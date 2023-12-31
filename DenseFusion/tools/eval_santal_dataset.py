import _init_paths
import argparse
import os
from sklearn.metrics import auc as AUC 
import random
import numpy as np
from scipy.spatial.transform import Rotation
import yaml
import copy
from mpl_toolkits.mplot3d import Axes3D 
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
import matplotlib.pyplot as plt
from datasets.santal_dataset.dataset import PoseDataset as PoseDataset_santal_dataset
from lib.network import PoseNet, PoseRefineNet
from lib.loss import Loss
from lib.loss_refiner import Loss_refine
from lib.transformations import euler_matrix, quaternion_matrix, quaternion_from_matrix
from lib.knn.__init__ import KNearestNeighbor
###
import cv2

parser = argparse.ArgumentParser()
parser.add_argument('--dataset_root', type=str, default = '', help='dataset root dir')
parser.add_argument('--model', type=str, default = '',  help='resume PoseNet model')
parser.add_argument('--refine_model', type=str, default = '',  help='resume PoseRefineNet model')
parser.add_argument('--display', type=bool, default=False,  help='visualize point cloud and 3D cuboid')
parser.add_argument('--output_result_dir', type=str, default='experiments/eval_result/santal_dataset',  help='where to store the evaluation result')
parser.add_argument('--iteration', type=int, default=2,  help='number of refine iteration')
parser.add_argument('--dis_target', type=float, default=0.02,  help='distance threshold to consider a prediction correct')
parser.add_argument('--ADD', action='store_true',  help='set to true to calculate only the ADD metric')
parser.add_argument('--AUC', action='store_true',  help='set to true to calculate only the AUC')
parser.add_argument('--num_poi', action='store_true',  help='set to true to calculate only the AUC')
opt = parser.parse_args()

num_objects = 1
num_points = 1000
#num_points=15000
bs = 1

dataset_config_dir = 'datasets/santal_dataset/dataset_config'
if not(os.path.exists(opt.output_result_dir)):
        os.mkdir(opt.output_result_dir)

knn = KNearestNeighbor(1)

estimator = PoseNet(num_points = num_points, num_obj = num_objects)
estimator.load_state_dict(torch.load(opt.model))
estimator.cuda()
estimator.eval()

if opt.refine_model!='':
    refiner = PoseRefineNet(num_points = num_points, num_obj = num_objects)
    refiner.load_state_dict(torch.load(opt.refine_model))
    refiner.cuda()
    refiner.eval()


testdataset = PoseDataset_santal_dataset('test', num_points, False, opt.dataset_root, 0.0, True)
testdataloader = torch.utils.data.DataLoader(testdataset, batch_size=1, shuffle=False, num_workers=10)

sym_list = testdataset.get_sym_list()
num_points_mesh = testdataset.get_num_points_mesh()
criterion = Loss(num_points_mesh, sym_list)
criterion_refine = Loss_refine(num_points_mesh, sym_list)

success_count = 0
num_count = 0
fw = open('{0}/eval_result_logs.txt'.format(opt.output_result_dir), 'w')
dt=0.001
n_samples=int(0.1/dt)
tresh_list=np.linspace(0, 0.1, n_samples+1)

success_list=np.zeros(len(tresh_list))

for i, data in enumerate(testdataloader, 0):
    points_list, choose_list, img_list, target_list, model_points_list, idx_list,path = data
    n_imgs=len(img_list)
    num_count+=n_imgs

    for h in range(n_imgs):
        points, choose, img, target, model_points, idx=points_list[h], choose_list[h], img_list[h], target_list[h], model_points_list[h], idx_list[h]
        #print(path)
        if len(points.size()) == 2:
            print('No.{0} NOT Pass! Lost detection!'.format(i))
            fw.write('No.{0} NOT Pass! Lost detection!\n'.format(i))
            continue
        points, choose, img, target, model_points, idx = Variable(points).cuda(), \
                                                        Variable(choose).cuda(), \
                                                        Variable(img).cuda(), \
                                                        Variable(target).cuda(), \
                                                        Variable(model_points).cuda(), \
                                                        Variable(idx).cuda()
        
        pred_r, pred_t, pred_c, emb = estimator(img, points, choose, idx)
        pred_r = pred_r / torch.norm(pred_r, dim=2).view(1, num_points, 1)
        pred_c = pred_c.view(bs, num_points)
        pred_t = pred_t.view(bs * num_points, 1, 3)
        how_max, which_max = torch.max(pred_c, 1)
        my_r = pred_r[0][which_max[0]].view(-1).cpu().data.numpy()
        my_t = (points.view(bs * num_points, 1, 3) + pred_t)[which_max[0]].view(-1).cpu().data.numpy()
        my_pred = np.append(my_r, my_t)
     
        for ite in range(0, opt.iteration):
            T = Variable(torch.from_numpy(my_t.astype(np.float32))).cuda().view(1, 3).repeat(num_points, 1).contiguous().view(1, num_points, 3)
           
            my_mat = quaternion_matrix(my_r)
            R = Variable(torch.from_numpy(my_mat[:3, :3].astype(np.float32))).cuda().view(1, 3, 3)
            my_mat[0:3, 3] = my_t
            
            new_points = torch.bmm((points - T), R).contiguous()
            pred_r, pred_t = refiner(new_points, emb, idx)
            pred_r = pred_r.view(1, 1, -1)
            pred_r = pred_r / (torch.norm(pred_r, dim=2).view(1, 1, 1))
            my_r_2 = pred_r.view(-1).cpu().data.numpy()
            my_t_2 = pred_t.view(-1).cpu().data.numpy()
            my_mat_2 = quaternion_matrix(my_r_2)
            my_mat_2[0:3, 3] = my_t_2

            my_mat_final = np.dot(my_mat, my_mat_2)
            my_r_final = copy.deepcopy(my_mat_final)
            my_r_final[0:3, 3] = 0
            my_r_final = quaternion_from_matrix(my_r_final, True)
            my_t_final = np.array([my_mat_final[0][3], my_mat_final[1][3], my_mat_final[2][3]])

            my_pred = np.append(my_r_final, my_t_final)
           
            my_r = my_r_final
            my_t = my_t_final

        # Here 'my_pred' is the final pose estimation result after refinement ('my_r': quaternion, 'my_t': translation)
       
        model_points = model_points[0].cpu().detach().numpy()
        my_r = quaternion_matrix(my_r)[:3, :3]
        pred = np.dot(model_points, my_r.T) + my_t
        target = target[0].cpu().detach().numpy()

        if idx[0].item() in sym_list:
            pred = torch.from_numpy(pred.astype(np.float32)).cuda().transpose(1, 0).contiguous()
            target = torch.from_numpy(target.astype(np.float32)).cuda().transpose(1, 0).contiguous()
            inds = knn(target.unsqueeze(0), pred.unsqueeze(0))
            target = torch.index_select(target, 1, inds.view(-1) - 1)
            dis = torch.mean(torch.norm((pred.transpose(1, 0) - target.transpose(1, 0)), dim=1), dim=0).item()
        else:
            dis = np.mean(np.linalg.norm(pred - target, axis=1))

        if opt.ADD:
            if dis < opt.dis_target:
                success_count += 1
                print('No.{0} Pass! Distance: {1}'.format(i, dis),path)
                fw.write('No.{0} Pass! Distance: {1}\n'.format(i, dis))            
            
            else:
                    print('No.{0} NOT Pass! Distance: {1}'.format(i, dis),path)
                    fw.write('No.{0} NOT Pass! Distance: {1}\n'.format(i, dis))
        
        elif opt.AUC:
            for j in range(len(tresh_list)):
                if dis < tresh_list[j]:
                    success_list[j] += 1
                    
            
        if opt.display:
            ##### for visualization
                    fig1= plt.figure()
                    ax1 = fig1.add_subplot(projection='3d')
                    img_plt = ax1.scatter(target[:,0], target[:,1], target[:,2],c='r',label="gt")

                    ax1.set_xlabel('X')
                    ax1.set_ylabel('Y')
                    ax1.set_zlabel('Z')
                    #ax1 = fig1.add_subplot(projection='3d')
                    img_plt = ax1.scatter(pred[:,0], pred[:,1], pred[:,2],c='g',label="estimated")

                    ax1.set_xlabel('X')
                    ax1.set_ylabel('Y')
                    ax1.set_zlabel('Z')
                    ax1.legend()
                    title=str(path[0]).split('/')[-1]
                    plt.title(title)
                    plt.show()

if opt.ADD:
    print('ALL success rate: {0}'.format(float(success_count) / float(num_count)))
    fw.write('ALL success rate: {0}'.format(float(success_count) / float(num_count)))

if opt.AUC:
    success_list=success_list/float(num_count)
    auc=AUC(tresh_list,success_list)
    ADD_2_cm=success_list[tresh_list==0.02]
    print('AUC: {0}, ADD<2cm {1}'.format(auc,ADD_2_cm))
    fw.write('AUC: {0}, ADD<2cm {1}'.format(auc,ADD_2_cm))

    fig2= plt.figure()
    ax2 = fig2.add_subplot()
    plt.plot(tresh_list,success_list)
    ax2.set_xlabel('treshold')
    ax2.set_ylabel('ADD')
    plt.title("ADD/treshold")
    plt.show()
                
fw.close()
