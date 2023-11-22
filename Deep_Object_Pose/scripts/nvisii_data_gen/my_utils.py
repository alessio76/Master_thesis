import nvisii as visii
import glob
import random
from utils import *
import numpy as np
import pybullet 
from scipy.spatial.transform import Rotation

def export_to_ndds_file(
    filename = "tmp.json", #this has to include path as well
    obj_names = [], # this is a list of ids to load and export
    height = 500, 
    width = 500,
    camera_name = 'my_camera',
    cuboids = None,
    camera_struct = None,
    segmentation_mask = None,
    compute_visibility_fraction = True,
    #quaternion that transforms the world coordinates into camera coordinates (both are taken in pybullet)
    world_to_camera_matrix= np.eye(4)
    ):

    if segmentation_mask is None:
        segmentation_mask = visii.render_data(
            width=int(width),
            height=int(height),
            start_frame=0,
            frame_count=1,
            bounce=int(0),
            options="entity_id",
        )
        segmentation_mask = np.array(segmentation_mask).reshape((height, width, 4))[:, :, 0]
	
    ### modificato ####
    visible_object_ids = np.unique(segmentation_mask)
    visible_object_ids[visible_object_ids == np.max(visible_object_ids)] =0
    visible_object_ids=visible_object_ids.astype(int)
    ###

    cam_matrix_export = []
    for row in world_to_camera_matrix:
        cam_matrix_export.append([row[0],row[1],row[2],row[3]])

    cam_world_location = world_to_camera_matrix[0:3,3]
    cam_world_quaternion = Rotation.from_matrix(world_to_camera_matrix[0:3,0:3]).as_quat()

    cam_intrinsics = visii.entity.get(camera_name).get_camera().get_intrinsic_matrix(width, height)

    if camera_struct is None:
        camera_struct = {
            'at': [0,0,0,],
            'eye': [0,0,0,],
            'up': [0,0,0,]
        }

    dict_out = {
                "camera_data" : {
                    "width" : width,
                    'height' : height,
                    'camera_look_at':
                    {
                        'at': [
                            camera_struct['at'][0],
                            camera_struct['at'][1],
                            camera_struct['at'][2],
                        ],
                        'eye': [
                            camera_struct['eye'][0],
                            camera_struct['eye'][1],
                            camera_struct['eye'][2],
                        ],
                        'up': [
                            camera_struct['up'][0],
                            camera_struct['up'][1],
                            camera_struct['up'][2],
                        ]
                    },
                    'camera_view_matrix':cam_matrix_export,
                    'location_worldframe':
                    [
                        cam_world_location[0],
                        cam_world_location[1],
                        cam_world_location[2],
                    ],
                    'quaternion_xyzw_worldframe':[
                        cam_world_quaternion[0],
                        cam_world_quaternion[1],
                        cam_world_quaternion[2],
                        cam_world_quaternion[3],
                    ],
                    'intrinsics':{
                        'fx':cam_intrinsics[0][0],
                        'fy':cam_intrinsics[1][1],
                        'cx':cam_intrinsics[2][0],
                        'cy':cam_intrinsics[2][1]
                    }
                }, 
                "objects" : []
            }

    # Segmentation id to export
    id_keys_map = visii.entity.get_name_to_id_map()
    for obj_name in obj_names:
        # don't write objects without a single visible pixel in the output image to json file
        if int(id_keys_map[obj_name['visii_id']]) not in visible_object_ids:
            continue

        projected_keypoints, _ = get_cuboid_image_space(obj_name['visii_id'], camera_name=camera_name)

        if projected_keypoints is not None:                
            # put them in the image space. 
            for i_p, p in enumerate(projected_keypoints):
                projected_keypoints[i_p] = [p[0]*width, p[1]*height]

        # Get the location and rotation of the object in the camera frame
        trans = visii.transform.get(f"{obj_name['visii_id']}_symmetry_corrected")
        if trans is None:
            trans = visii.entity.get(f"{obj_name['visii_id']}_symmetry_corrected").get_transform()
            if trans is None: 
                continue
        
        #get the world position and orientation
        obj_world_pos, obj_world_ori = pybullet.getBasePositionAndOrientation(obj_name['bullet_id'])
        """
        obj_world_pos=visii.entity.get(obj_name['visii_id']).get_transform().get_position()
        obj_world_pos=np.array((obj_world_pos[0],obj_world_pos[1],obj_world_pos[2]))
        """
        #transform position and orientation in camera frame
        quaternion_xyzw = Rotation.from_quat(Rotation.from_matrix(world_to_camera_matrix[0:3,0:3]).as_quat()) * Rotation.from_quat(obj_world_ori)
        quaternion_xyzw=quaternion_xyzw.as_quat()/np.linalg.norm(quaternion_xyzw.as_quat())
        object_world_hom = np.append(obj_world_pos,1)

        pos_camera_frame = (world_to_camera_matrix @ object_world_hom)[0:3]


        if not cuboids is None:
            cuboid = cuboids[obj_name['visii_id']]
        else:
            cuboid = None

        # compute visibility fraction
        visibility = 1
        px_count_visib = 0
        px_count_all = 0
        if compute_visibility_fraction:
            transforms_to_keep = {}

            for name in id_keys_map.keys():
                if 'camera' in name.lower() or obj_name['visii_id'] in name:
                    continue
                trans_to_keep = visii.entity.get(name).get_transform()
                transforms_to_keep[name]=trans_to_keep
                visii.entity.get(name).clear_transform()

            # render segmentation mask of object in isolation to determine px_count_all (number of
            # pixels in the object silhouette without occlusions)
            segmentation_unique_mask = visii.render_data(
                width=int(width),
                height=int(height),
                start_frame=0,
                frame_count=1,
                bounce=int(0),
                options="entity_id",
            )
            segmentation_unique_mask = np.array(segmentation_unique_mask).reshape((height, width, 4))[:, :, 0]

            px_count_visib = len(np.where(segmentation_mask == int(id_keys_map[obj_name['visii_id']]))[0])
            px_count_all = len(np.where(segmentation_unique_mask == int(id_keys_map[obj_name['visii_id']]))[0])
            visibility = px_count_visib / px_count_all

            # set back the objects from remove
            for entity_name in transforms_to_keep.keys():
                visii.entity.get(entity_name).set_transform(transforms_to_keep[entity_name])

        # bounding box calculation
        y, x = np.where(segmentation_mask == int(id_keys_map[obj_name['visii_id']]))
        bounding_box = [int(min(x)), int(max(x)), height - int(max(y)), height - int(min(y))]

        #this matrix transforms object frame coordinates into world frame coordinates
        obj_to_world_coordinate_matrix = np.zeros((4,4))
        obj_to_world_coordinate_matrix[3,3]=1
        obj_to_world_coordinate_matrix[0:3,0:3]=Rotation.from_quat(obj_world_ori).as_matrix()
        obj_to_world_coordinate_matrix[:3,3]=obj_world_pos
        obj_to_world_coordinate_matrix_export = []

        for row in obj_to_world_coordinate_matrix:
            obj_to_world_coordinate_matrix_export.append([row[0],row[1],row[2],row[3]])

        # Final export
        class_name = object_to_class_name(obj_name['visii_id'])
        try:
            seg_id = id_keys_map[obj_name['visii_id']]
        except :
            seg_id = -1

        dict_out['objects'].append({
            'class':class_name,
            'name':obj_name['visii_id'],
            'provenance':'nvisii',
            # TODO check the location
            'location': [
                pos_camera_frame[0],
                pos_camera_frame[1],
                pos_camera_frame[2]
            ],
            'location_worldframe': [
                obj_world_pos[0],
                obj_world_pos[1],
                obj_world_pos[2]
            ],
            'quaternion_xyzw':[
                quaternion_xyzw[0],
                quaternion_xyzw[1],
                quaternion_xyzw[2],
                quaternion_xyzw[3],
            ],
            'quaternion_xyzw_worldframe':[
                obj_world_ori[0],
                obj_world_ori[1],
                obj_world_ori[2],
                obj_world_ori[3],
            ],
            'local_to_world_matrix':obj_to_world_coordinate_matrix_export,
            'projected_cuboid':projected_keypoints,
            'segmentation_id':seg_id,
            'local_cuboid': cuboid,
            'px_count_visib': px_count_visib,
            'px_count_all': px_count_all,
            'visibility':visibility,
            'bounding_box_minx_maxx_miny_maxy':bounding_box
        })
        
    with open(filename, 'w+') as fp:
        json.dump(dict_out, fp, indent=4, sort_keys=True)
    # return bounding_box

def create_camera(world_bullet_to_world_nvisii,focal_length=None,fx=None,fy=None,cx=None,cy=None, width=640,height=480,fov=0.785398,debug=False):
    if focal_length:
        camera = visii.entity.create(
        name = "camera",
        transform = visii.transform.create("camera"),
        camera = visii.camera.create_from_intrinsics(
            name = "camera",
            fx=focal_length,
            fy=focal_length,
            cx=(width / 2),
            cy=(height / 2),
            width=width,
            height=height
        )
    )
        
    elif fx and fy and cx and cy:
        camera = visii.entity.create(
        name = "camera",
        transform = visii.transform.create("camera"),
        camera = visii.camera.create_from_intrinsics(
            name = "camera",
            fx=fx,
            fy=fy,
            cx=cx,
            cy=cy,
            width=width,
            height=height
        )
    )
    else:
        camera = visii.entity.create(
        name = "camera",
        transform = visii.transform.create("camera"),
        camera = visii.camera.create_perspective_from_fov(
            name = "camera",
            field_of_view =fov, #45 degree 
            aspect = float(width)/float(height)
        )
    )
    #world_bullet_to_world_nvisii is the matrix from world bullet frame to nvisii bullet frame
    #set the position of the nvisii world frame in bullet
    bullet_camera_pos=world_bullet_to_world_nvisii[0:3,3]

    #make the camera a phisycal object in this case a sphere
    p.createMultiBody(
        baseCollisionShapeIndex = p.createCollisionShape(p.GEOM_SPHERE,0.05),
        baseVisualShapeIndex = p.createVisualShape(p.GEOM_SPHERE,0.05),
        basePosition =bullet_camera_pos,
        baseOrientation=Rotation.from_matrix(world_bullet_to_world_nvisii[0:3,0:3]).as_quat()
    )

    #draw the camera frame in bullet if required
    if debug:
        p.addUserDebugLine(lineFromXYZ = bullet_camera_pos,lineToXYZ=bullet_camera_pos+world_bullet_to_world_nvisii[0:3,0],lineColorRGB=(1,0,0),lifeTime=0,lineWidth=2)
        p.addUserDebugLine(lineFromXYZ = bullet_camera_pos,lineToXYZ=bullet_camera_pos+world_bullet_to_world_nvisii[0:3,1],lineColorRGB=(0,1,0),lifeTime=0,lineWidth=2)
        p.addUserDebugLine(lineFromXYZ = bullet_camera_pos,lineToXYZ=bullet_camera_pos+world_bullet_to_world_nvisii[0:3,2],lineColorRGB=(0,0,1),lifeTime=0,lineWidth=2)           

    return camera

def set_skybox(single_skybox_path=None,skybox_folder="dome_hdri_haven",skybox_name='dome_text'):
    # lets turn off the ambiant lights
    # load a random skybox from the folder
    #load one skybox
    if single_skybox_path:
        skybox_selection =single_skybox_path

    else:
    #or chose one at random
        skyboxes = glob.glob(f'{skybox_folder}/*.hdr')
        skybox_selection = skyboxes[random.randint(0,len(skyboxes)-1)]
    
    dome_tex = visii.texture.create_from_file(skybox_name,skybox_selection)
    visii.set_dome_light_texture(dome_tex)
    return dome_tex

def set_uniform_background(color,max_distance):
    
    background = visii.entity.create(
            name = "background",
            mesh = visii.mesh.create_plane("mesh_background"),
            transform = visii.transform.create("transform_background"),
            material = visii.material.create("material_background")
        )
    

    mat = background.get_material()
    mat.set_roughness(0.7)
    mat.set_base_color(color)
    # Make the wall large and far
    #ATTENTION: since the wall is rendered as an object the depth will count it as an object like the others, depth associated with 
    #the wall MUST be removed for training
    trans = background.get_transform()
    trans.set_scale((10,10,10))
    #place the colored plane perpendicolar the view axis (x axis)
    trans.set_position(visii.vec3(max_distance,0,0))   
    trans.set_rotation(visii.angleAxis(visii.pi()/2,visii.vec3(0,1,0))) 

    return mat


def adding_mesh_object(
        name, 
        obj_to_load, 
        texture_to_load, 
        obj_base_position,
        model_info_path=None, 
        scale=1, 
        debug=False
    ):

    mesh_loaded = {}
   
    if texture_to_load is None:
        toys = load_obj_scene(obj_to_load)
        if len(toys) > 1: 
            print("more than one model in the object, \
                   materials might be wrong!")
        toy_transform = visii.entity.get(toys[0]).get_transform()
        toy_material = visii.entity.get(toys[0]).get_material()
        toy_mesh = visii.entity.get(toys[0]).get_mesh()        

        obj_export = visii.entity.create(
                name = name,
                transform = visii.transform.create(
                    name = name, 
                    position = toy_transform.get_position(),
                    rotation = toy_transform.get_rotation(),
                    scale = toy_transform.get_scale(),
                ),
                material = toy_material,
                mesh = visii.mesh.create_from_file(name,obj_to_load),
            )

        toy_transform = obj_export.get_transform()
        obj_export.get_material().set_roughness(random.uniform(0.1, 0.5))

        for toy in toys:
            visii.entity.remove(toy)

        toys = [name]
    else:
        toys = [name]

        if obj_to_load in mesh_loaded:
            toy_mesh = mesh_loaded[obj_to_load]
        else:
            toy_mesh = visii.mesh.create_from_file(name, obj_to_load)
            mesh_loaded[obj_to_load] = toy_mesh

        toy = visii.entity.create(
            name=name,
            transform=visii.transform.create(name),
            mesh=toy_mesh,
            material=visii.material.create(name)
        )

        toy_rgb_tex = visii.texture.create_from_file(name, texture_to_load)
        toy.get_material().set_base_color_texture(toy_rgb_tex)
        toy.get_material().set_roughness(random.uniform(0.1, 0.5))

        toy_transform = toy.get_transform()

    ###########################

    toy_transform.set_scale(visii.vec3(scale))
    toy_transform.set_position(visii.vec3(obj_base_position))

    quat=visii.quat(random.uniform(0,1),random.uniform(0,1),random.uniform(0,1),random.uniform(0,1))
    toy_transform.set_rotation(quat)

    # add symmetry_corrected transform
    child_transform = visii.transform.create(f"{toy_transform.get_name()}_symmetry_corrected")

    child_transform.set_parent(toy_transform)

    # store symmetry transforms for later use.
    symmetry_transforms = get_symmetry_transformations(model_info_path)
    id_pybullet = create_physics(name, mass=(np.random.rand() * 5))
    visii_pybullet_element={
            'visii_id': name,
            'bullet_id': id_pybullet,
            'base_rot': None,
            'model_info': {},
            'symmetry_transforms': symmetry_transforms
    }
    
    for entity_name in toys:
        add_cuboid(entity_name, scale=scale, debug=debug)

    return visii_pybullet_element,toys

#mesh_path and texture_path are fixed due to the structure of their models  
def load_objects(parameters,obj_base_position,debug=False):
    visii_pybullet=[] 
    names_to_export = []

    for i_obj in range(parameters['n_objects']):
        objects_folder =parameters['folder']
        scale=parameters['scale']
        toy_to_load = objects_folder[random.randint(0, len(objects_folder) - 1)]
        obj_to_load = toy_to_load + parameters['mesh_path']
        texture_to_load = toy_to_load + parameters['textures_path']
        name =  parameters['name_prefix']+ toy_to_load.split('/')[-2] + f"_{i_obj}"
        visii_pybullet_element,names=adding_mesh_object(name, obj_to_load, texture_to_load,obj_base_position,scale=scale, debug=debug)
        visii_pybullet.append(visii_pybullet_element)
        names_to_export.extend(names)

    return visii_pybullet,names_to_export

def render_objects_by_position(objects,obj_base_position):
    for entry in objects:
        visii.entity.get(entry['visii_id']).get_transform().set_position(obj_base_position)
        #set a random orientation
        quat=visii.quat(random.uniform(0,1),random.uniform(0,1),random.uniform(0,1),random.uniform(0,1))
        visii.entity.get(entry['visii_id']).get_transform().set_rotation(quat)


def render_objects_by_force(objects,force_max):
    object_position=0.01
    for entry in objects:
        visii.entity.get(entry['visii_id']).get_transform().set_position(
            visii.entity.get(entry['visii_id']).get_transform().get_position(),
            previous = True
        )
        visii.entity.get(entry['visii_id']).get_transform().set_rotation(
            visii.entity.get(entry['visii_id']).get_transform().get_rotation(),
            previous = True
        )
      
        update_pose(entry)

        p.applyExternalForce(
                entry['bullet_id'],
                -1,
                [   random.uniform(-force_max[0],force_max[0]),
                    random.uniform(-force_max[1],force_max[1]),
                    random.uniform(-force_max[2],force_max[2])],
                [  random.uniform(-object_position,object_position),
                    random.uniform(-object_position,object_position),
                    random.uniform(-object_position,object_position)],
                flags=p.WORLD_FRAME
            )
        
"""def render_with_camera_movement(r,phi,theta,camera,obj_base_position):
    pos=(-r*np.cos(phi)*np.sin(theta),r*np.sin(phi),-r*np.cos(phi)*np.cos(theta))
    Tc_w=np.zeros((3,3))
    #transponse to write column-wise 
    Tc_w[:3,:3]=Rotation.from_euler('zy',[theta,-phi]).as_matrix()
    Tc_w[0:3,1]=(-1)*Tc_w[0:3,1]
    Tc_w[0:3,2]=(-1)*Tc_w[0:3,2]
    camera.get_transform().look_at(at=obj_base_position,eye=pos,up=Tc_w[0:3,1])
    eye,up=pos,Tc_w[0:3,1]
    return eye,up"""


def generate_images(width,height,spp,outf,i_render):
    visii.sample_pixel_area(
            x_sample_interval = (0,1),
            y_sample_interval = (0,1))
    
    visii.render_to_file(
            width=int(width),
            height=int(height),
            samples_per_pixel=int(spp),
            file_path=f"{outf}/{str(i_render).zfill(5)}.png"
        )
    

    visii.sample_pixel_area(
        x_sample_interval = (.5,.5),
        y_sample_interval = (.5,.5))
    
    visii.sample_time_interval((1,1))

    visii.render_data_to_file(
            width=width,
            height=height,
            start_frame=0,
            frame_count=1,
            bounce=int(0),
            options="entity_id",
            file_path = f"{outf}/{str(i_render).zfill(5)}.seg.exr"
        )

    visii.render_data_to_file(
            width=width,
            height=height,
            start_frame=0,
            frame_count=1,
            bounce=int(0),
            options="depth",
            file_path = f"{outf}/{str(i_render).zfill(5)}.depth.exr"
        )
    
def generate_annotations(width,height,i_render,names_to_export,random_camera_movement,visibility_fraction,outf):
        segmentation_mask = visii.render_data(
            width=int(width),
            height=int(height),
            start_frame=0,
            frame_count=1,
            bounce=int(0),
            options="entity_id",
        )
    
        segmentation_mask = np.array(segmentation_mask).reshape((height, width, 4))[:, :, 0]
        
        export_to_ndds_file(
            f"{outf}/{str(i_render).zfill(5)}.json",
            obj_names = names_to_export,
            width = width,
            height = height,
            camera_name = 'camera',
            camera_struct = random_camera_movement,
            segmentation_mask=segmentation_mask,
            compute_visibility_fraction=visibility_fraction,
        )

def create_limiting_plane(position,orientation):
            
    box_col = p.createCollisionShape(p.GEOM_BOX,halfExtents=[2,2,0.1])
    box_vis = p.createVisualShape(p.GEOM_BOX,halfExtents=[2,2,0.1])

    p.createMultiBody(
        baseCollisionShapeIndex = box_col,
        baseVisualShapeIndex=box_vis,
        basePosition = list(position),
        #make the plane perdicolar to the x asis
        baseOrientation=orientation,
        baseMass=0
        )
    
        
