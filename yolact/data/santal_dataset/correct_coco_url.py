import json

file_name=("val.json","train.json")

for name in file_name:
    file=open(name)
    data=json.load(file)
    for i in range(len(data['images'])):
        img_ann=data['images'][i]
        data['images'][i]['coco_url']=img_ann['coco_url'].replace("/home/workstation2/AlessioBenitoAlterani/Master-thesis/yolact/data/santal_dataset",
                                                        "/media/workstation2/d1382ef8-acda-4cd4-ae67-0a971abc01c81/dope_dataset/santal_juice_dataset")
    file.close()
    new_name=name.replace(".json","")
    out_file = open(f"{new_name}_test.json", "w") 
    json.dump(data, out_file) 
    out_file.close() 