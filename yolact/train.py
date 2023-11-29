from data import *
from utils.augmentations import SSDAugmentation, BaseTransform
from utils.functions import MovingAverage, SavePath
from utils.logger import Log
from utils import timer
from layers.modules import MultiBoxLoss
from yolact import Yolact
from torch.utils.tensorboard import SummaryWriter
import os
import sys
import time
import math, random
from pathlib import Path
import torch
from torch.autograd import Variable
import torch.nn as nn
import torch.optim as optim
import torch.backends.cudnn as cudnn
import torch.nn.init as init
import torch.utils.data as data
import argparse
import datetime
import matplotlib.pyplot as plt
import numpy as np

import matplotlib.animation as animation
# Oof
import eval as eval_script

def str2bool(v):
    return v.lower() in ("yes", "true", "t", "1")


parser = argparse.ArgumentParser(
    description='Yolact Training Script')
parser.add_argument('--batch_size', default=8, type=int,help='Batch size for training')
parser.add_argument('--resume', default=None, type=str,
                    help='Checkpoint state_dict file to resume training from. If this is "interrupt"'\
                        ', the model will resume training from the interrupt file.')
parser.add_argument('--start_iter', default=-1, type=int,
                    help='Resume training at this iter. If this is -1, the iteration will be'\
                         'determined from the file name.')
parser.add_argument('--num_workers', default=4, type=int,
                    help='Number of workers used in dataloading')
parser.add_argument('--cuda', default=True, type=str2bool,
                    help='Use CUDA to train model')
parser.add_argument('--lr', '--learning_rate', default=None, type=float,
                    help='Initial learning rate. Leave as None to read this from the config.')
parser.add_argument('--momentum', default=None, type=float,
                    help='Momentum for SGD. Leave as None to read this from the config.')
parser.add_argument('--decay', '--weight_decay', default=None, type=float,
                    help='Weight decay for SGD. Leave as None to read this from the config.')
parser.add_argument('--gamma', default=None, type=float,
                    help='For each lr step, what to multiply the lr by. Leave as None to read this from the config.')
parser.add_argument('--save_folder', default='weights/',
                    help='Directory for saving checkpoint models.')
parser.add_argument('--log_folder', default='logs/',
                    help='Directory for saving logs.')
parser.add_argument('--config', default=None,
                    help='The config object to use.')
parser.add_argument('--save_interval', default=10000, type=int,
                    help='The number of iterations between saving the model.')
parser.add_argument('--validation_size', default=5000, type=int,
                    help='The number of images to use for validation.')
parser.add_argument('--validation_epoch', default=2, type=int,
                    help='Output validation information every n iterations. If -1, do no validation.')
parser.add_argument('--max_failure', default=6, type=int,
                    help='Number of consecutive failure on the validation mAP that stops the training.')
parser.add_argument('--keep_latest', dest='keep_latest', action='store_true',
                    help='Only keep the latest checkpoint instead of each one.')
parser.add_argument('--keep_latest_interval', default=100000, type=int,
                    help='When --keep_latest is on, don\'t delete the latest file at these intervals. This should be a multiple of save_interval or 0.')
parser.add_argument('--dataset', default=None, type=str,
                    help='If specified, override the dataset specified in the config with this one (example: coco2017_dataset).')
parser.add_argument('--no_log', dest='log', action='store_false',
                    help='Don\'t log per iteration information into log_folder.')
parser.add_argument('--log_gpu', dest='log_gpu', action='store_true',
                    help='Include GPU information in the logs. Nvidia-smi tends to be slow, so set this with caution.')
parser.add_argument('--no_interrupt', dest='interrupt', action='store_false',
                    help='Don\'t save an interrupt when KeyboardInterrupt is caught.')
parser.add_argument('--batch_alloc', default=None, type=str,
                    help='If using multiple GPUS, you can set this to be a comma separated list detailing which GPUs should get what local batch size (It should add up to your total batch size).')
parser.add_argument('--no_autoscale', dest='autoscale', action='store_false',
                    help='YOLACT will automatically scale the lr and the number of iterations depending on the batch size. Set this if you want to disable that.')
parser.add_argument('--mAP', default=None, type=float,help='initial mAP to beat')

parser.set_defaults(keep_latest=False, log=True, log_gpu=False, interrupt=True, autoscale=True)
args = parser.parse_args()
#torch.set_default_dtype(torch.float16)


if args.config is not None:
    set_cfg(args.config)

if args.dataset is not None:
    set_dataset(args.dataset)

if args.autoscale and args.batch_size != 8:
    factor = args.batch_size / 8
    if __name__ == '__main__':
        print('Scaling parameters by %.2f to account for a batch size of %d.' % (factor, args.batch_size))

    cfg.lr *= factor
    cfg.max_iter //= factor
    cfg.lr_steps = [x // factor for x in cfg.lr_steps]

# Update training parameters from the config if necessary
def replace(name):
    if getattr(args, name) == None: setattr(args, name, getattr(cfg, name))
replace('lr')
replace('decay')
replace('gamma')
replace('momentum')

# This is managed by set_lr
cur_lr = args.lr

if torch.cuda.device_count() == 0:
    print('No GPUs detected. Exiting...')
    exit(-1)

if args.batch_size // torch.cuda.device_count() < 6:
    if __name__ == '__main__':
        print('Per-GPU batch size is less than the recommended limit for batch norm. Disabling batch norm.')
    cfg.freeze_bn = True

"""
#  - B: Box Localization Loss
        #  - C: Class Confidence Loss
        #  - M: Mask Loss
        #  - P: Prototype Loss
        #  - D: Coefficient Diversity Loss
        #  - E: Class Existence Loss
        #  - S: Semantic Segmentation Loss

EXPLAINED IN MultiBox loss in layers.modules
"""

loss_types = ['B', 'C', 'M', 'P', 'D', 'E', 'S', 'I']
save_path = lambda epoch, iteration: SavePath(cfg.name, epoch, iteration).get_path(root=args.save_folder)

if torch.cuda.is_available():
    if args.cuda:
        torch.set_default_tensor_type('torch.cuda.FloatTensor')
    if not args.cuda:
        print("WARNING: It looks like you have a CUDA device, but aren't " +
              "using CUDA.\nRun with --cuda for optimal training speed.")
        torch.set_default_tensor_type('torch.FloatTensor')
else:
    torch.set_default_tensor_type('torch.FloatTensor')

class NetLoss(nn.Module):
    """
    A wrapper for running the network and computing the loss
    This is so we can more efficiently use DataParallel.
    """
    
    def __init__(self, net:Yolact, criterion:MultiBoxLoss):
        super().__init__()

        self.net = net
        self.criterion = criterion
    
    def forward(self, images, targets, masks, num_crowds):
        preds = self.net(images)
        losses = self.criterion(self.net, preds, targets, masks, num_crowds)
        return losses

class CustomDataParallel(nn.DataParallel):
    """
    This is a custom version of DataParallel that works better with our training data.
    It should also be faster than the general case.
    """

    def scatter(self, inputs, kwargs, device_ids):
        # More like scatter and data prep at the same time. The point is we prep the data in such a way
        # that no scatter is necessary, and there's no need to shuffle stuff around different GPUs.
        devices = ['cuda:' + str(x) for x in device_ids]
        splits = prepare_data(inputs[0], devices, allocation=args.batch_alloc)

        return [[split[device_idx] for split in splits] for device_idx in range(len(devices))], \
            [kwargs] * len(devices)

    def gather(self, outputs, output_device):
        out = {}

        for k in outputs[0]:
            out[k] = torch.stack([output[k].to(output_device) for output in outputs])
        
        return out

def train():

    if not os.path.exists(args.save_folder):
        os.mkdir(args.save_folder)

    validation_errors=0
    
    log_file_path = os.path.join(cfg.name,args.log_folder)
    
    dataset = COCODetection(image_path=cfg.dataset.train_images,
                            info_file=cfg.dataset.train_info,
                            transform=SSDAugmentation(MEANS))
    
    if args.validation_epoch > 0:
        setup_eval()
        val_dataset = COCODetection(image_path=cfg.dataset.valid_images,
                                    info_file=cfg.dataset.valid_info,
                                    transform=BaseTransform(MEANS))

    # Parallel wraps the underlying module, but when saving and loading we don't want that
    yolact_net = Yolact()
    net = yolact_net
    net.train()

    if args.log:
        log = Log(cfg.name, args.log_folder, dict(args._get_kwargs()),
            overwrite=(args.resume is None), log_gpu_stats=args.log_gpu)

    # I don't use the timer during training (I use a different timing method).
    # Apparently there's a race condition with multiple GPUs, so disable it just to be safe.
    timer.disable_all()

    # Both of these can set args.resume to None, so do them before the check    
    if args.resume == 'interrupt':
        args.resume = SavePath.get_interrupt(args.save_folder)
    elif args.resume == 'latest':
        args.resume = SavePath.get_latest(args.save_folder, cfg.name)

    #number of iteration per epoch 
    epoch_size = len(dataset) // args.batch_size
    print(f'iteration_per_epoch = {epoch_size}')

    #number of epochs
    num_epochs = math.ceil(cfg.max_iter / epoch_size)
    print(f'num_epoch = {num_epochs}')

    if args.resume is not None:
        print('Resuming training, loading {}...'.format(args.resume))
        yolact_net.load_weights(args.resume)
    
        if args.start_iter == -1:
            args.start_iter = SavePath.from_str(args.resume).iteration
           
    else:
        print('Initializing weights...')
        yolact_net.init_weights(backbone_path=args.save_folder + cfg.backbone.path)

    iteration = max(args.start_iter, 0)
    epoch=iteration//epoch_size

    if iteration==0:
        mAP_old=0
        best_mAP=mAP_old
        mAP_now=mAP_old
        best_model=None
        if os.path.exists(log_file_path):
            os.remove(log_file_path)
    else:
        best_model=yolact_net.state_dict()
        if args.mAP != None:
            mAP_old=args.mAP
        else:
            mAP_old=compute_validation_map(epoch, iteration, yolact_net, val_dataset, log if args.log else None)['mask']['all']
        best_mAP=mAP_old
        mAP_now=mAP_old
        

    """optimizer = optim.SGD(net.parameters(), lr=args.lr, momentum=args.momentum,
                          weight_decay=args.decay)"""
    optimizer=optim.Adam(net.parameters(), lr=args.lr, weight_decay=args.decay)
    criterion = MultiBoxLoss(num_classes=cfg.num_classes,
                             pos_threshold=cfg.positive_iou_threshold,
                             neg_threshold=cfg.negative_iou_threshold,
                             negpos_ratio=cfg.ohem_negpos_ratio)

    if args.batch_alloc is not None:
        args.batch_alloc = [int(x) for x in args.batch_alloc.split(',')]
        if sum(args.batch_alloc) != args.batch_size:
            print('Error: Batch allocation (%s) does not sum to batch size (%s).' % (args.batch_alloc, args.batch_size))
            exit(-1)

    net = CustomDataParallel(NetLoss(net, criterion))
    if args.cuda:
        net = net.cuda()
    
    # Initialize everything
    if not cfg.freeze_bn: yolact_net.freeze_bn() # Freeze bn so we don't kill our means
    yolact_net(torch.zeros(1, 3, cfg.max_size, cfg.max_size).cuda())
    if not cfg.freeze_bn: yolact_net.freeze_bn(True)

    
    # loss counters
    loc_loss = 0
    conf_loss = 0
    last_time = time.time()

    # Which learning rate adjustment step are we on? lr' = lr * gamma ^ step_index
    step_index = 0

    data_loader = data.DataLoader(dataset, args.batch_size,
                                  num_workers=args.num_workers,
                                  shuffle=False, collate_fn=detection_collate,
                                  pin_memory=True,generator=torch.Generator(device='cuda'))
    
    
    time_avg = MovingAverage()
    validation_check_result=False
    global loss_types # Forms the print order
    loss_avgs  = { k: MovingAverage(100) for k in loss_types }
    
    print("lr",args.lr,"momentum",args.momentum,"validation_size",args.validation_size,"validation_epoch",args.validation_epoch,"iteration",iteration,
          "epoch",epoch,"best_mAP",best_mAP,"mAP_old",mAP_old)
    #input('Press enter to begin training')
    print('Begin training!')
    
    writer = SummaryWriter('logs/santal_session')
    # try-except so you can use ctrl+c to save early and stop training
    
    try:
        while epoch<num_epochs:
            
            # Resume from start_iter
            if (epoch+1)*epoch_size < iteration:
                continue

            if validation_errors>=args.max_failure:
                if best_model!=None:
                    yolact_net.load_state_dict(best_model)
                break
            
            for datum in data_loader:
              
                # Stop if we've reached an epoch if we're resuming from start_iter
                if iteration == (epoch+1)*epoch_size:
                    break

                # Stop at the configured number of iterations even if mid-epoch
                if iteration == cfg.max_iter:
                    break

                # Change a config setting if we've reached the specified iteration
                changed = False
                for change in cfg.delayed_settings:
                    if iteration >= change[0]:
                        changed = True
                        cfg.replace(change[1])

                        # Reset the loss averages because things might have changed
                        for avg in loss_avgs:
                            avg.reset()
                
                # If a config setting was changed, remove it from the list so we don't keep checking
                if changed:
                    cfg.delayed_settings = [x for x in cfg.delayed_settings if x[0] > iteration]

                # Warm up by linearly interpolating the learning rate from some smaller value
                if cfg.lr_warmup_until > 0 and iteration <= cfg.lr_warmup_until:
                    set_lr(optimizer, (args.lr - cfg.lr_warmup_init) * (iteration / cfg.lr_warmup_until) + cfg.lr_warmup_init)

                # Adjust the learning rate at the given iterations, but also if we resume from past that iteration
                while step_index < len(cfg.lr_steps) and iteration >= cfg.lr_steps[step_index]:
                    step_index += 1
                    set_lr(optimizer, args.lr * (args.gamma ** step_index))
                
                # Zero the grad to get ready to compute gradients
                optimizer.zero_grad()

                # Forward Pass + Compute loss at the same time (see CustomDataParallel and NetLoss)
                #torch.cuda.empty_cache()
                losses = net(datum)
                
                losses = { k: (v).mean() for k,v in losses.items() } # Mean here because Dataparallel
                loss = sum([losses[k] for k in losses])
                
                # no_inf_mean removes some components from the loss, so make sure to backward through all of it
                # all_loss = sum([v.mean() for v in losses.values()])

                # Backprop
                loss.backward() # Do this to free up vram even if loss is not finite
                if torch.isfinite(loss).item():
                    optimizer.step()
                
                # Add the loss to the moving average for bookkeeping
                for k in losses:
                    loss_avgs[k].add(losses[k].item())

                cur_time  = time.time()
                elapsed   = cur_time - last_time
                last_time = cur_time

                # Exclude graph setup from the timing information
                if iteration != args.start_iter:
                    time_avg.add(elapsed)

                if iteration % 10 == 0:
                    eta_str = str(datetime.timedelta(seconds=(cfg.max_iter-iteration) * time_avg.get_avg())).split('.')[0]
                    
                    total = sum([loss_avgs[k].get_avg() for k in losses])
                    loss_labels = sum([[k, loss_avgs[k].get_avg()] for k in loss_types if k in losses], [])
                    string=('[%3d] %7d ||' + (' %s: %.3f |' * len(losses)) + ' T: %.3f || ETA: %s || timer: %.3f || best_mAP: %f || val_errors: %d') % tuple([epoch, iteration] + loss_labels + [total, eta_str, elapsed]+ [best_mAP , validation_errors]) 
                    print(string)
                    writer.add_scalars('Loss', { 'Training' : total}, iteration)
                    writer.flush()
                    #yield iteration,total,mAP_now

                if args.log:
                    precision = 5
                    loss_info = {k: round(losses[k].item(), precision) for k in losses}
                    loss_info['T'] = round(loss.item(), precision)

                    if args.log_gpu:
                        log.log_gpu_stats = (iteration % 10 == 0) # nvidia-smi is sloooow
                        
                    log.log('train', loss=loss_info, epoch=epoch, iter=iteration,
                        lr=round(cur_lr, 10), elapsed=elapsed,best_mAP=best_mAP)

                    log.log_gpu_stats = args.log_gpu
                
                iteration += 1

                if iteration % args.save_interval == 0 and iteration != args.start_iter:
                    if args.keep_latest:
                        latest = SavePath.get_latest(args.save_folder, cfg.name)

                    print('Saving state, iter:', iteration)
                    yolact_net.save_weights(save_path(epoch, iteration))

                    if args.keep_latest and latest is not None:
                        if args.keep_latest_interval <= 0 or iteration % args.keep_latest_interval != args.save_interval:
                            print('Deleting old save...')
                            os.remove(latest)
                
           
            
            writer.add_scalars('mAP', { 'Val' : mAP_now}, epoch)
            writer.flush()    
            # This is done per epoch
            if args.validation_epoch > 0:
                if epoch % args.validation_epoch == 0 and epoch > 0:
                    #compute current precision mAP
                    mAP_now = compute_validation_map(epoch, iteration, yolact_net, val_dataset, log if args.log else None)['mask']['all']
                    validation_errors, best_model, best_mAP = validation_check(yolact_net, mAP_now, validation_errors, mAP_old, best_mAP,best_model)
                    if best_mAP < mAP_now:
                        yolact_net.save_weights(save_path(epoch, iteration))
                    mAP_old=mAP_now

            epoch+=1
               
        # Compute validation mAP after training is finished
        compute_validation_map(epoch, iteration, yolact_net, val_dataset, log if args.log else None)
        if validation_errors > args.max_failure:
            print("exited for validation check")
        else:
            print("exited for maximum number of epochs reached")
        print('Saving network...')
        
        
        if(best_model!=None):
            yolact_net.save_weights(save_path(epoch, repr(iteration)))
            exit()
            """if interactive:
                plt.savefig("logs/last_result.png")"""
           

    except KeyboardInterrupt:
        if args.interrupt:
            print('Stopping early. Saving network...')
            # Delete previous copy of the interrupted network so we don't spam the weights folder
            SavePath.remove_interrupt(args.save_folder)
            yolact_net.save_weights(save_path(epoch, repr(iteration) + '_interrupt'))
            exit()
            """if interactive:
                plt.savefig("logs/last_result.png")"""
           

def validation_check(net, precision_now, validation_errors, old_precision, best_precision, best_model):
    
    #if the old precision is less than the actual one reset the error counter
    if old_precision < precision_now:
        validation_errors=0

        #if the previous best precision is beaten update it and save the best model
        if best_precision<precision_now:
            best_precision=precision_now
            best_model= net.state_dict()
    #if the old precision is greater or equal to the current mark one error
    else:
        validation_errors+=1

    return validation_errors, best_model, best_precision

def set_lr(optimizer, new_lr):
    for param_group in optimizer.param_groups:
        param_group['lr'] = new_lr
    
    global cur_lr
    cur_lr = new_lr

def gradinator(x):
    x.requires_grad = False
    return x

def prepare_data(datum, devices:list=None, allocation:list=None):
    with torch.no_grad():
        if devices is None:
            devices = ['cuda:0'] if args.cuda else ['cpu']
        if allocation is None:
            allocation = [args.batch_size // len(devices)] * (len(devices) - 1)
            allocation.append(args.batch_size - sum(allocation)) # The rest might need more/less
        
        images, (targets, masks, num_crowds) = datum
	 
        cur_idx = 0
        for device, alloc in zip(devices, allocation):
            for _ in range(alloc):
            	
                images[cur_idx]  = gradinator(images[cur_idx].to(device))
                targets[cur_idx] = gradinator(targets[cur_idx].to(device))
                masks[cur_idx]   = gradinator(masks[cur_idx].to(device))
                cur_idx += 1

        if cfg.preserve_aspect_ratio:
            # Choose a random size from the batch
            _, h, w = images[random.randint(0, len(images)-1)].size()

            for idx, (image, target, mask, num_crowd) in enumerate(zip(images, targets, masks, num_crowds)):
                images[idx], targets[idx], masks[idx], num_crowds[idx] \
                    = enforce_size(image, target, mask, num_crowd, w, h)
        
        cur_idx = 0
        split_images, split_targets, split_masks, split_numcrowds \
            = [[None for alloc in allocation] for _ in range(4)]

        for device_idx, alloc in enumerate(allocation):
            split_images[device_idx]    = torch.stack(images[cur_idx:cur_idx+alloc], dim=0)
            split_targets[device_idx]   = targets[cur_idx:cur_idx+alloc]
            split_masks[device_idx]     = masks[cur_idx:cur_idx+alloc]
            split_numcrowds[device_idx] = num_crowds[cur_idx:cur_idx+alloc]

            cur_idx += alloc

        return split_images, split_targets, split_masks, split_numcrowds

def no_inf_mean(x:torch.Tensor):
    """
    Computes the mean of a vector, throwing out all inf values.
    If there are no non-inf values, this will return inf (i.e., just the normal mean).
    """

    no_inf = [a for a in x if torch.isfinite(a)]

    if len(no_inf) > 0:
        return sum(no_inf) / len(no_inf)
    else:
        return x.mean()

def compute_validation_loss(net, data_loader, criterion):
    global loss_types

    with torch.no_grad():
        losses = {}
        
        # Don't switch to eval mode because we want to get losses
        iterations = 0
        for datum in data_loader:
            images, targets, masks, num_crowds = prepare_data(datum)
            out = net(images)

            wrapper = ScatterWrapper(targets, masks, num_crowds)
            _losses = criterion(out, wrapper, wrapper.make_mask())
            
            for k, v in _losses.items():
                v = v.mean().item()
                if k in losses:
                    losses[k] += v
                else:
                    losses[k] = v

            iterations += 1
            if args.validation_size <= iterations * args.batch_size:
                break
        
        for k in losses:
            losses[k] /= iterations
            
        
        loss_labels = sum([[k, losses[k]] for k in loss_types if k in losses], [])
        print(('Validation ||' + (' %s: %.3f |' * len(losses)) + ')') % tuple(loss_labels), flush=True)

def compute_validation_map(epoch, iteration, yolact_net, dataset, log:Log=None):
    with torch.no_grad():
        yolact_net.eval()
        
        start = time.time()
        print()
        print("Computing validation mAP (this may take a while)...", flush=True)
        val_info = eval_script.evaluate(yolact_net, dataset, train_mode=True)
        end = time.time()
        duration = end-start
        if (end-start)<60:
            print(f"validation mAP time {duration}s")
        else:
            print(f"validation mAP time {(duration)//60}.{duration%60}m")

        if log is not None:
            log.log('val', val_info, elapsed=(end - start), epoch=epoch, iter=iteration)

        yolact_net.train()
        return val_info

def setup_eval():
    eval_script.parse_args(['--no_bar', '--max_images='+str(args.validation_size)])


"""
def run(data):
    
    # update the data
    t, y,mAP = data
    xdata.append(t)
    yloss.append(y)
    ymAP.append(mAP)
    
    for line,yk in zip(lines,(yloss,ymAP)):
        line.set_data(xdata,yk)

    for a in ax:
        a.relim()
        a.autoscale_view()

    return lines,"""

if __name__ == '__main__':
    """fig, ax = plt.subplots(1,2)
    lines=[]
    for a in ax:
        line, = a.plot([], [], lw=2)
        lines.append(line)
        a.grid()
    
    xdata,yloss,ymAP = [],[],[]
    ax[0].set_title("Loss")
    ax[0].set_xlabel("iteration")
    ax[0].set_ylabel("loss")

    ax[1].set_title("mAP")
    ax[1].set_xlabel("iteration")
    ax[1].set_ylabel("mAP")

    
    ani = animation.FuncAnimation(fig, run, fargs=(train,), blit=True)
    plt.show()"""
    train()
    

    
   
