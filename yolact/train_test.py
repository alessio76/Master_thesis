from yolact import Yolact
from train import validation_check

validation_errors=0
mAP_old=5
best_mAP=mAP_old

mAP_now=[2,5,8,9,46]
net=Yolact()
max_failure=3
best_model=-1
for i,mAP in enumerate(mAP_now):
    
    validation_errors, best_model, best_mAP = validation_check(i, mAP,validation_errors, mAP_old, best_mAP, best_model)
    print("val_errors",validation_errors,"best_model" ,best_model, "best_mAP",best_mAP)
    if validation_errors>=max_failure:
        exit()

