
#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>

#include <moveit_msgs/DisplayRobotState.h>
#include <moveit_msgs/DisplayTrajectory.h>

#include <moveit_msgs/AttachedCollisionObject.h>
#include <moveit_msgs/CollisionObject.h>

#include <moveit_visual_tools/moveit_visual_tools.h>
#include "geometric_shapes/shapes.h"
#include "geometric_shapes/mesh_operations.h"
#include "geometric_shapes/shape_operations.h"

// The circle constant tau = 2*pi. One tau is one rotation in radians.
const double tau = 2 * M_PI;

/*sets the goal cartesian pose*/
//quat in w,x,y,z, format
geometry_msgs::Pose set_goal_pose(moveit::planning_interface::MoveGroupInterface& move_group_interface, std::array<float, 4>& quat, std::array<float, 3>& position){

  geometry_msgs::Pose target_pose;
  target_pose.orientation.w=quat[0];
  target_pose.orientation.x=quat[1];
  target_pose.orientation.y=quat[2];
  target_pose.orientation.z=quat[3];

  target_pose.position.x=position[0];
  target_pose.position.y=position[1];
  target_pose.position.z=position[2];

  move_group_interface.setPoseTarget(target_pose);
  return target_pose;

}

shape_msgs::Mesh createMeshFromObj(const std::string& obj_file_path) {
    // Variables to store vertices and faces
    std::vector<geometry_msgs::Point> vertices;
    std::vector<shape_msgs::MeshTriangle> triangles;

    // Read and parse the .obj file
    std::ifstream obj_file(obj_file_path);
    std::string line;
    while (std::getline(obj_file, line)) {
        std::istringstream iss(line);
        char line_type;
        iss >> line_type;

        if (line_type == 'v') {
            // Parse vertex line
            geometry_msgs::Point vertex;
            iss >> vertex.x >> vertex.y >> vertex.z;
            vertices.push_back(vertex);
        } else if (line_type == 'f') {
            // Parse face line
            shape_msgs::MeshTriangle triangle;
            int vertex_index1, vertex_index2, vertex_index3;
            iss >> vertex_index1 >> vertex_index2 >> vertex_index3;
            triangle.vertex_indices[0] = vertex_index1 - 1; // Adjust for 1-based indexing in .obj files
            triangle.vertex_indices[1] = vertex_index2 - 1;
            triangle.vertex_indices[2] = vertex_index3 - 1;
            triangles.push_back(triangle);
        }
    }

    // Create the shape_msgs::Mesh message
    shape_msgs::Mesh mesh;
    mesh.vertices = vertices;
    mesh.triangles = triangles;

    return mesh;
}


int main(int argc, char** argv)
{
  ros::init(argc, argv, "Planning_node");
  ros::NodeHandle node_handle;

  ros::AsyncSpinner spinner(1);
  spinner.start();
  static const std::string PLANNING_GROUP = "yaskawa_arm";
  moveit::planning_interface::MoveGroupInterface move_group_interface(PLANNING_GROUP);
  moveit::planning_interface::PlanningSceneInterface planning_scene_interface;
  const moveit::core::JointModelGroup* joint_model_group =
      move_group_interface.getCurrentState()->getJointModelGroup(PLANNING_GROUP);

  namespace rvt = rviz_visual_tools;
  moveit_visual_tools::MoveItVisualTools visual_tools("base_link");
  
  std::array<float, 4> quat = {1,0,0,0};
  std::array<float, 3> position = {0.28, 0.2, 0.5};

  //the function needs the quaternion in the x,y,z,w format
  geometry_msgs::Pose target_pose1=set_goal_pose(move_group_interface, quat, position);
  /*static const std::string PLANNER = "RRT";
  move_group_interface.setPlannerId("RTT")
   moveit::planning_interface::MoveGroupInterface::Plan my_plan;

  bool success = (move_group_interface.plan(my_plan) == moveit::core::MoveItErrorCode::SUCCESS);*/
 

  moveit_msgs::CollisionObject object_to_attach;
  object_to_attach.id = "santal";

  shapes::Mesh* m = shapes::createMeshFromResource("file:///mnt/d1382ef8-acda-4cd4-ae67-0a971abc01c8/dope_dataset/santal_ace/santal_centered.obj",Eigen::Vector3d(1e-3,1e-3,1e-3));
  shape_msgs::Mesh mesh;
  shapes::ShapeMsg mesh_msg;
  shapes::constructMsgFromShape(m, mesh_msg);
   mesh = boost::get<shape_msgs::Mesh>(mesh_msg);


  // We define the frame/pose for this cylinder so that it appears in the gripper
  object_to_attach.header.frame_id = "base_link";
  geometry_msgs::Pose santal_pose;
  santal_pose.orientation.w = 1.0;
  santal_pose.position.x = 0.5;

  // First, we add the object to the world (without using a vector)
  object_to_attach.meshes.push_back(mesh);
  object_to_attach.mesh_poses.push_back(santal_pose);
  object_to_attach.operation = object_to_attach.ADD;
  planning_scene_interface.applyCollisionObject(object_to_attach);
  

  // Finally, to execute the trajectory stored in my_plan, you could use the following method call:
  // Note that this can lead to problems if the robot moved in the meanwhile.
  //move_group_interface.execute(my_plan);

}