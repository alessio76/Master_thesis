from PIL import Image
from pycocotools.coco import COCO
import numpy as np
import skimage.io as io
import matplotlib.pyplot as plt
import pylab
import argparse
pylab.rcParams['figure.figsize'] = (8.0, 10.0)

def show_images(n_img_to_show,imgIds):
    
   
    img_ann=coco.loadImgs(imgIds)
    n_img=len(img_ann)
    count=0
    result,rest = (n_img // n_img_to_show, n_img % n_img_to_show)

    for k in range(result+rest):
        if count+n_img_to_show<n_img:
            img_to_load=n_img_to_show
        else:
            img_to_load=n_img-count
        fig=plt.figure()
        for i in range(count,count+img_to_load):
            ax =fig.add_subplot(n_img_to_show,1,i+1-count)
            I = Image.open(img_ann[i]['coco_url'])
            print(img_ann[i]['coco_url'])
            ax.imshow(I)
            plt.axis('off')
            annIds = coco.getAnnIds(imgIds=imgIds[i], iscrowd=None)
            anns = coco.loadAnns(annIds)
            coco.showAnns(anns,draw_bbox=True)
        
        plt.show()
      
        count+=img_to_load

def structure_check(imgIds):
    annIds=coco.getAnnIds(imgIds, iscrowd=None)
    anns = coco.loadAnns(annIds)
    errors=0
    for ann in anns:
       assert len(ann['segmentation']) >0,"segmentation is empty"
       assert ann['area']!=0,f"area is 0 {ann}"
       for elem in ann['segmentation']:
           try:
                assert len(elem)>2, f"number of border points <2, {elem}"
           except(AssertionError):
               errors+=1

    if errors!=0:
        print(f"Total border points <2 is {errors}")
    

parser = argparse.ArgumentParser()

parser.add_argument(
    '--img-to-show',
    default=1,
    type=int,
    help = 'number of images to show in a iteration'
)

parser.add_argument(
    '--ann-file',
    default=None,
    help = 'annotation file to load'
)

parser.add_argument(
    '--show-img',
    default=False,
    dest='show_img',
    action='store_true',
    help = 'show annotations on images'
)

parser.add_argument(
    '--object',
    default="santal_ace",
    help = 'object whose annotations will be shown'
)

opt = parser.parse_args()
n_img_to_show=opt.img_to_show
annFile=opt.ann_file

coco=COCO(annFile)

cats = coco.loadCats(coco.getCatIds())
nms=[cat['name'] for cat in cats]
print('COCO categories: \n{}\n'.format(' '.join(nms)))

nms = set([cat['supercategory'] for cat in cats])
print('COCO supercategories: \n{}'.format(' '.join(nms)))
catIds = coco.getCatIds(catNms=[opt.object])
imgIds = coco.getImgIds(catIds=catIds)

#check if the annotations are properly filled
structure_check(imgIds)
print(f"total number of images {len(imgIds)}")
#shows image annotations
if opt.show_img:
    show_images(opt.img_to_show,imgIds)


   
    
            




