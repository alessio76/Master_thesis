# --------------------------------------------------------
# DenseFusion 6D Object Pose Estimation by Iterative Dense Fusion
# Licensed under The MIT License [see LICENSE for details]
# Written by Chen
# --------------------------------------------------------
import datetime
import _init_paths
import argparse
import os
from torch.utils.tensorboard import SummaryWriter
import random
import time
import numpy as np
import torch
import torch.nn as nn
import torch.nn.parallel
import torch.backends.cudnn as cudnn
import torch.optim as optim
import torch.utils.data
import torchvision.datasets as dset
import torchvision.transforms as transforms
import torchvision.utils as vutils
from torch.autograd import Variable
from datasets.ycb.dataset import PoseDataset as PoseDataset_ycb
from datasets.linemod.dataset import PoseDataset as PoseDataset_linemod
from datasets.santal_dataset.dataset import PoseDataset as PoseDataset_santal_dataset
from lib.network import PoseNet, PoseRefineNet
from lib.loss import Loss
from lib.loss_refiner import Loss_refine
from lib.utils import setup_logger
import json

parser = argparse.ArgumentParser()
parser.add_argument('--dataset', type=str, default = 'santal_dataset', help='ycb or linemod or santal_dataset')
parser.add_argument('--dataset_root', type=str, default = '/mnt/d1382ef8-acda-4cd4-ae67-0a971abc01c8/dope_dataset', help='dataset root dir (''YCB_Video_Dataset'' or ''Linemod_preprocessed'' or ''santal_dataset'')')
parser.add_argument('--batch_size', type=int, default = 16, help='batch size')
parser.add_argument('--workers', type=int, default = 2, help='number of data loading workers')
parser.add_argument('--lr', default=0.001, help='learning rate')
parser.add_argument('--lr_rate', default=0.3, help='learning rate decay rate')
parser.add_argument('--w', default=0.015, help='learning rate')
parser.add_argument('--w_rate', default=0.3, help='learning rate decay rate')
parser.add_argument('--decay_margin', default=0.016, help='margin to decay lr & w')
parser.add_argument('--refine_margin', default=0.013, help='margin to start the training of iterative refinement')
parser.add_argument('--noise_trans', default=0.03, help='range of the random noise of translation added to the training data')
parser.add_argument('--iteration', type=int, default = 2, help='number of refinement iterations')
parser.add_argument('--nepoch', type=int, default=50, help='max number of epochs to train')
parser.add_argument('--resume_posenet', type=str, default = '',  help='resume PoseNet model')
parser.add_argument('--resume_refinenet', type=str, default = '',  help='resume PoseRefineNet model')
parser.add_argument('--start_epoch', type=int, default = 1, help='which epoch to start')
parser.add_argument('--refine_start', type=bool, default = False, help='If True starts the training of the refine model')
parser.add_argument('--max_imgs_train', type=int, default=None,help='If not None sets a maximun to the number of images used for training')
parser.add_argument('--max_imgs_test', type=int, default=None,help='If not None sets a maximun to the number of images used for testing')
parser.add_argument('--max_failure', type=int, default=5,help='max iteration where the val precision does not increase')
opt = parser.parse_args()

def freeze_layers(model,layers_to_freeze):
    for name in layers_to_freeze:
        layer=getattr(model, name)
        for param in layer.parameters():
            param.requires_grad=False

def main():
    opt.manualSeed = random.randint(1, 10000)
    random.seed(opt.manualSeed)
    torch.manual_seed(opt.manualSeed)

    if opt.dataset == 'ycb':
        opt.num_objects = 21 #number of object classes in the dataset
        opt.num_points = 1000 #number of points on the input pointcloud
        opt.outf = 'trained_models/ycb' #folder to save trained models
        opt.log_dir = 'experiments/logs/ycb' #folder to save logs
        opt.repeat_epoch = 1 #number of repeat times for one epoch training
        
    elif opt.dataset == 'linemod':
        opt.num_objects = 13
        opt.num_points = 500
        opt.outf = 'trained_models/linemod'
        opt.log_dir = 'experiments/logs/linemod'
        opt.repeat_epoch = 20

    elif opt.dataset == 'santal_dataset':
        opt.num_objects = 1 #number of object classes in the dataset
        opt.num_points = 1000 #number of points on the input pointcloud
        opt.outf = 'trained_models/santal_dataset' #folder to save trained models
        opt.log_dir = 'experiments/logs/santal_dataset' #folder to save logs
        opt.log_file_train="santal_train.log"
        opt.log_file_test="santal_test.log"
        opt.repeat_epoch = 1 #number of repeat times for one epoch training
    else:
        print('Unknown dataset')
        return
   
    estimator = PoseNet(num_points = opt.num_points, num_obj = opt.num_objects)
    estimator.cuda()
    refiner = PoseRefineNet(num_points = opt.num_points, num_obj = opt.num_objects)
    refiner.cuda()
    
    if opt.resume_posenet != '':
        estimator.load_state_dict(torch.load('{0}/{1}'.format(opt.outf, opt.resume_posenet)))

    if opt.resume_refinenet != '' or opt.refine_start:
        if opt.resume_refinenet:
            refiner.load_state_dict(torch.load('{0}/{1}'.format(opt.outf, opt.resume_refinenet)))
        opt.refine_start = True
        opt.decay_start = True
        opt.lr *= opt.lr_rate
        opt.w *= opt.w_rate
        opt.batch_size = int(opt.batch_size / opt.iteration)
        optimizer = optim.Adam(refiner.parameters(), lr=opt.lr)
    else:
        opt.refine_start = False
        opt.decay_start = False
        optimizer = optim.Adam(estimator.parameters(), lr=opt.lr)

    if opt.dataset == 'ycb':
        dataset = PoseDataset_ycb('train', opt.num_points, True, opt.dataset_root, opt.noise_trans, opt.refine_start)
    elif opt.dataset == 'linemod':
        dataset = PoseDataset_linemod('train', opt.num_points, True, opt.dataset_root, opt.noise_trans, opt.refine_start)
    elif opt.dataset == 'santal_dataset':
        dataset = PoseDataset_santal_dataset('train', opt.num_points, True, opt.dataset_root, opt.noise_trans, opt.refine_start)
    dataloader = torch.utils.data.DataLoader(dataset, batch_size=1, shuffle=True, num_workers=opt.workers)

    if opt.dataset == 'ycb':
        test_dataset = PoseDataset_ycb('test', opt.num_points, False, opt.dataset_root, 0.0, opt.refine_start)
    elif opt.dataset == 'linemod':
        test_dataset = PoseDataset_linemod('test', opt.num_points, False, opt.dataset_root, 0.0, opt.refine_start)
    elif opt.dataset == 'santal_dataset':
        test_dataset = PoseDataset_santal_dataset('test', opt.num_points, False, opt.dataset_root, 0.0, opt.refine_start)
    testdataloader = torch.utils.data.DataLoader(test_dataset, batch_size=1, shuffle=False, num_workers=opt.workers)
    
    opt.sym_list = dataset.get_sym_list()
    opt.num_points_mesh = dataset.get_num_points_mesh()
  

    print('>>>>>>>>----------Dataset loaded!---------<<<<<<<<\nlength of the training set: {0}\nlength of the testing set: {1}\nnumber of sample points on mesh: {2}\nsymmetry object list: {3}'.format(len(dataset), len(test_dataset), opt.num_points_mesh, opt.sym_list))
    
    criterion = Loss(opt.num_points_mesh, opt.sym_list)
    criterion_refine = Loss_refine(opt.num_points_mesh, opt.sym_list)
    best_test = np.Inf

    if opt.start_epoch == 1:
        for log in os.listdir(opt.log_dir):
            os.remove(os.path.join(opt.log_dir, log))
    
    if not(os.path.exists(opt.outf)):
        os.mkdir(opt.outf)

    iteration_per_epoch = len(dataset) // opt.batch_size
    extimated_iterations=opt.nepoch*iteration_per_epoch

   
    """main_layers_to_freeze=[]
    for i in range(1,2):
        main_layers_to_freeze.append('conv%d_r' % i)
        main_layers_to_freeze.append('conv%d_t' % i)
        main_layers_to_freeze.append('conv%d_c' % i)
    main_layers_to_freeze.extend(('feat','cnn'))
    
    for i in range(3,5):
        layer=getattr(estimator,'conv%d_r' % i)
        nn.init.xavier_uniform_(layer.weight)
        layer=getattr(estimator,'conv%d_t' % i)
        nn.init.xavier_uniform_(layer.weight)
        layer=getattr(estimator,'conv%d_c' % i)
        nn.init.xavier_uniform_(layer.weight)
   
    freeze_layers(estimator,main_layers_to_freeze)
    refine_layers_to_freeze=[]
    refine_layers_to_freeze.extend(('feat','conv1_r','conv1_t'))
    freeze_layers(refiner,refine_layers_to_freeze)
    
    for i in range(2,4):
        layer=getattr(refiner,'conv%d_r' % i)
        nn.init.xavier_uniform_(layer.weight)
        layer=getattr(refiner,'conv%d_t' % i)
        nn.init.xavier_uniform_(layer.weight)"""
    
    num_params = sum(p.numel() for p in estimator.parameters() if p.requires_grad)
    num_params += sum(p.numel() for p in refiner.parameters() if p.requires_grad)
    print(f"Number of trainable parameters: {num_params/1e6}M")
    log_file=open(os.path.join(opt.log_dir,opt.log_file_train),'a')
  
    print("epoch",opt.nepoch,'learning rate',opt.lr,'batch size',opt.batch_size,'estimated iterations',extimated_iterations,
          os.path.join(opt.log_dir,opt.log_file_train),os.path.join(opt.log_dir,opt.log_file_test))
    input("Start training?")
    st_time = time.time()
    train_iteration=0
    writer = SummaryWriter('experiments/eval_result/santal_dataset/santal_session')
    validation_errors=0
    previous_dis=np.Inf

    try:
        for epoch in range(opt.start_epoch, opt.nepoch+opt.start_epoch):
            if validation_errors>=opt.max_failure:
                torch.save(estimator.state_dict(), '{0}/pose_model_current.pth'.format(opt.outf))
                if opt.refine_start:
                        torch.save(refiner.state_dict(), '{0}/pose_refine_model_current.pth'.format(opt.outf))
                break

            #logger = setup_logger('epoch%d' % epoch, os.path.join(opt.log_dir, 'epoch_%d_log.txt' % epoch))
            print('Train time {0}'.format(time.strftime("%Hh %Mm %Ss", time.gmtime(time.time() - st_time)) + ', ' + 'Training started'))
            #iterations for the current epoch
            train_count = 0

            #set the refiner network in train mode and the main network in evaluation 
            if opt.refine_start:
                estimator.eval()
                refiner.train()
            #set only the main network in train mode
            else:
                estimator.train()
            optimizer.zero_grad()
            
            batch_time=time.time()
        
            for i, data in enumerate(dataloader, 0):
                if opt.max_imgs_train != None:
                    if i>=opt.max_imgs_train:
                        break
                    #average dis for current batch, resetted every new batch
                train_dis_avg_per_image = 0.0
                train_loss_avg_per_image = 0.0 

                #get all the data for every objects in the image
                points_list, choose_list, img_list, target_list, model_points_list, idx_list = data
                n_obj_img=len(img_list)
                #since there is a threshhold on the minimun number of visible pixels some images can be empty 
                if(n_obj_img >0):
                    #print(type( points_list), len(choose_list), len(img_list), len(target_list), len(model_points_list), len(idx_list),idx_list[0:])
                    #iterate on every objects in the selected image
                    #we sum the losses and dist on every objects 
                    dis_per_image=0
                    loss_per_image=0

                    for h in range(n_obj_img):
                        points, choose, img, target, model_points, idx=points_list[h], choose_list[h], img_list[h], target_list[h], model_points_list[h], idx_list[h]
                        points, choose, img, target, model_points, idx = Variable(points).cuda(), \
                                                                        Variable(choose).cuda(), \
                                                                        Variable(img).cuda(), \
                                                                        Variable(target).cuda(), \
                                                                        Variable(model_points).cuda(), \
                                                                        Variable(idx).cuda()
                        #make predictions on one object
                        pred_r, pred_t, pred_c, emb = estimator(img, points, choose, idx)
                        #calculate loss for that object
                        loss, dis, new_points, new_target = criterion(pred_r, pred_t, pred_c, target, model_points, idx, points, opt.w, opt.refine_start)
                    
                        #the train of the refiner model and the one of the main model are mutually exclusive
                        # dis = mean on every object point of the distance between ground truth and estimated point cloud.
                        # loss = mean of dis over all pixels weighted by the prediction confidence, since its generated one pose prediction
                        # for every pixels used for the embedding step
                                    
                        if opt.refine_start:
                            for ite in range(0, opt.iteration):
                                #make refiner predictions
                                pred_r, pred_t = refiner(new_points, emb, idx)
                                #calculate refiner loss
                                dis, new_points, new_target = criterion_refine(pred_r, pred_t, new_target, model_points, idx, new_points)
                                #calculate refiner gradient
                                dis.backward()
                        else:
                            #calculate main gradient
                            loss.backward()
                        
                        #sum of all distances of every object from their ground truth point cloud
                        dis_per_image += dis.item()

                        #sum of all losses of every object from their ground truth point cloud
                        loss_per_image += loss.item()

                        
                    #compute the dis on one image as the mean dis on every object in the image, cumulative per batch
                    train_dis_avg_per_image += dis_per_image/n_obj_img

                    #compute the loss on one image as the mean dis on every object in the image, cumulative per batch
                    train_loss_avg_per_image += loss_per_image/n_obj_img

                    #train count is incremented every image but zeroed every epoch 
                    train_count += 1

                    #when a batch is completed update the weights
                    if train_count % opt.batch_size == 0:
                        optimizer.step()
                        optimizer.zero_grad()
                        #overall counter of the iteratons done so far
                        train_iteration+=1
                        ###add timing information
                        #compute time passed for current batch
                        cur_time  = time.time()
                        elapsed   = cur_time - batch_time
                        batch_time = cur_time
                        ###compute the mean over the present and all the past batch timing informations 
                        if train_iteration ==1:
                            new_mean=elapsed
                        elif train_iteration>1:
                            old_mean=new_mean
                            new_mean=(old_mean*(train_iteration-1)+elapsed)/train_iteration

                        eta_str = str(datetime.timedelta(seconds=(extimated_iterations-train_iteration) * new_mean)).split('.')[0]
                        print('Train time {0} Epoch {1} Batch {2} Frame {3} Iteration {4} Avg_dis (m):{5} Avg_loss:{6} ETA:{7} Refine:{8}, validation_errors {9}'.format(time.strftime("%Hh %Mm %Ss", 
                                                                                                                                        time.gmtime(time.time() - st_time)), epoch, 
                                                                                                                                        int(train_count / opt.batch_size), 
                                                                                                                                        train_count, 
                                                                                                                                        train_iteration,
                                                                                                                                        train_dis_avg_per_image / opt.batch_size,
                                                                                                                                        train_loss_avg_per_image / opt.batch_size,
                                                                                                                                        eta_str,
                                                                                                                                        opt.refine_start,
                                                                                                                                        validation_errors))
                        writer.add_scalars('Loss', { 'Training_loss' : train_loss_avg_per_image / opt.batch_size}, train_iteration)
                        writer.add_scalars('Dis', { 'Training_dis' : train_dis_avg_per_image / opt.batch_size}, train_iteration)
                        writer.flush()

                        data_dict = {'Train time':time.strftime("%Hh %Mm %Ss", time.gmtime(time.time() - st_time)),
                                'Epoch':epoch, 
                                'Batch' : int(train_count / opt.batch_size), 
                                'Frame': train_count,
                                'Avg_dis': train_dis_avg_per_image / opt.batch_size,
                                'Refine':opt.refine_start,
                                'Avg_loss': train_loss_avg_per_image / opt.batch_size
                                }
                        
                        log_file.write(json.dumps(data_dict)+'\n')

                    if train_count != 0 and train_count % 1000 == 0:
                        if opt.refine_start:
                            torch.save(refiner.state_dict(), '{0}/pose_refine_model_current.pth'.format(opt.outf))
                        else:
                            torch.save(estimator.state_dict(), '{0}/pose_model_current.pth'.format(opt.outf))


            print('>>>>>>>>----------epoch {0} train finish---------<<<<<<<<'.format(epoch))

            points_list, choose_list, img_list, target_list, model_points_list, idx_list=[],[],[],[],[],[]
            #logger = setup_logger('epoch%d_test' % epoch, os.path.join(opt.log_dir, 'epoch_%d_test_log.txt' % epoch))
            print('Test time {0}'.format(time.strftime("%Hh %Mm %Ss", time.gmtime(time.time() - st_time)) + ', ' + 'Testing started'))
            test_count = 0
            estimator.eval()
            refiner.eval()
            log_file.close()
            log_file=open(os.path.join(opt.log_dir,opt.log_file_test),'a')
            test_dis=0.0
            for j, data in enumerate(testdataloader, 0):
                if opt.max_imgs_test != None:
                    if j>=opt.max_imgs_test:
                        break
                test_dis_avg_per_image = 0.0
                points_list, choose_list, img_list, target_list, model_points_list, idx_list = data[:-1]
                n_obj_img=len(img_list)
                if n_obj_img>0:
                        dis_per_image=0.0
                        
                        for l in range(n_obj_img):
                            points, choose, img, target, model_points, idx=points_list[l], choose_list[l], img_list[l], target_list[l], model_points_list[l], idx_list[l]
                            points, choose, img, target, model_points, idx = Variable(points).cuda(), \
                                                                            Variable(choose).cuda(), \
                                                                            Variable(img).cuda(), \
                                                                            Variable(target).cuda(), \
                                                                            Variable(model_points).cuda(), \
                                                                            Variable(idx).cuda()
                            pred_r, pred_t, pred_c, emb = estimator(img, points, choose, idx)

                            dis, new_points, new_target = criterion(pred_r, pred_t, pred_c, target, model_points, idx, points, opt.w, opt.refine_start)[1:4]
                        
                            if opt.refine_start:
                                for ite in range(0, opt.iteration):
                                    pred_r, pred_t = refiner(new_points, emb, idx)
                                    dis, new_points, new_target = criterion_refine(pred_r, pred_t, new_target, model_points, idx, new_points)
                            dis_per_image += dis.item()

                        test_dis_avg_per_image += dis_per_image/n_obj_img
                        test_dis += test_dis_avg_per_image
                        print('Test time {0} Test Frame No.{1} dis:{2} test_dist: {3}'.format(time.strftime("%Hh %Mm %Ss", time.gmtime(time.time() - st_time)), test_count, test_dis_avg_per_image,test_dis))
                        
                        data_dict = {'Test time':time.strftime("%Hh %Mm %Ss", time.gmtime(time.time() - st_time)),
                                'test_count':test_count, 
                                'Avg_dis': test_dis_avg_per_image,
                                'test iteration': test_count
                                }
                        
                        log_file.write(json.dumps(data_dict)+'\n')
                        test_count += 1

            test_dis = test_dis/ test_count
            
            print('Test time {0} Epoch {1} TEST FINISH Avg dis: {2}'.format(time.strftime("%Hh %Mm %Ss", time.gmtime(time.time() - st_time)), epoch, test_dis))
            writer.add_scalars('Val_dis', { 'Val_dis' : test_dis }, epoch)
            writer.flush()
            
            if test_dis >=previous_dis:
                validation_errors+=1
            else:
                validation_errors=0
            previous_dis=test_dis

            if test_dis <= best_test:
                best_test = test_dis
                if opt.refine_start:
                    torch.save(refiner.state_dict(), '{0}/pose_refine_model_{1}_{2}.pth'.format(opt.outf, epoch, test_dis))
                else:
                    torch.save(estimator.state_dict(), '{0}/pose_model_{1}_{2}.pth'.format(opt.outf, epoch, test_dis))
                print('>>>>>>>>----------BEST TEST MODEL SAVED---------<<<<<<<<')

            if best_test < opt.decay_margin and not opt.decay_start:
                opt.decay_start = True
                opt.lr *= opt.lr_rate
                opt.w *= opt.w_rate
                optimizer = optim.Adam(estimator.parameters(), lr=opt.lr)

            if best_test < opt.refine_margin and not opt.refine_start:
                opt.refine_start = True
                opt.batch_size = int(opt.batch_size / opt.iteration)
                optimizer = optim.Adam(refiner.parameters(), lr=opt.lr)

                if opt.dataset == 'ycb':
                    dataset = PoseDataset_ycb('train', opt.num_points, True, opt.dataset_root, opt.noise_trans, opt.refine_start)
                elif opt.dataset == 'linemod':
                    dataset = PoseDataset_linemod('train', opt.num_points, True, opt.dataset_root, opt.noise_trans, opt.refine_start)
                elif opt.dataset == 'santal_dataset':
                    dataset = PoseDataset_santal_dataset('train', opt.num_points, True, opt.dataset_root, opt.noise_trans, opt.refine_start)
                dataloader = torch.utils.data.DataLoader(dataset, batch_size=1, shuffle=True, num_workers=opt.workers)
                if opt.dataset == 'ycb':
                    test_dataset = PoseDataset_ycb('test', opt.num_points, False, opt.dataset_root, 0.0, opt.refine_start)
                elif opt.dataset == 'linemod':
                    test_dataset = PoseDataset_linemod('test', opt.num_points, False, opt.dataset_root, 0.0, opt.refine_start)
                elif opt.dataset == 'santal_dataset':
                    dataset = PoseDataset_santal_dataset('test', opt.num_points, False, opt.dataset_root, 0.0, opt.refine_start)
                testdataloader = torch.utils.data.DataLoader(test_dataset, batch_size=1, shuffle=False, num_workers=opt.workers)
                
                opt.sym_list = dataset.get_sym_list()
                opt.num_points_mesh = dataset.get_num_points_mesh()

                print('>>>>>>>>----------Dataset loaded!---------<<<<<<<<\nlength of the training set: {0}\nlength of the testing set: {1}\nnumber of sample points on mesh: {2}\nsymmetry object list: {3}'.format(len(dataset), len(test_dataset), opt.num_points_mesh, opt.sym_list))

                criterion = Loss(opt.num_points_mesh, opt.sym_list)
                criterion_refine = Loss_refine(opt.num_points_mesh, opt.sym_list)
    
    except(KeyboardInterrupt):
        print('Stopping early. Saving network...')
        # Delete previous copy of the interrupted network so we don't spam the weights folder
        if opt.refine_start:
            torch.save(refiner.state_dict(), '{0}/pose_refine_model_{1}_{2}.pth'.format(opt.outf, epoch, best_test))
        else:
            torch.save(estimator.state_dict(), '{0}/pose_model_{1}_{2}.pth'.format(opt.outf, epoch, best_test))      

    log_file.close()
        

if __name__ == '__main__':
    main()
    