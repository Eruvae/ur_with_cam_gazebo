# ur_with_cam_gazebo

Launch universal robot simulation with cam attached.

## Usage

Run the install_models.sh script from the models folder or copy the models manually to your gazebo models folder to be able to load the worlds.

Install the universal robots ROS packages. The most recent version can be found [here](https://github.com/fmauch/universal_robot/tree/calibration_devel). See also the installation instructions for the [Universal Robots ROS Driver](https://github.com/UniversalRobots/Universal_Robots_ROS_Driver) (only needed for physical arm).

The launch file also starts nodelets to publish pointclouds with marked regions of interest. You'll need the [pointcloud_roi](https://github.com/Eruvae/pointcloud_roi) and [pointcloud_roi_msgs](https://github.com/Eruvae/pointcloud_roi_msgs) packages to start those, or you can comment out the nodelets from the launch file if not needed. The pointcloud_roi package depends on [yolact_ros_msgs](https://github.com/Eruvae/yolact_ros_msgs) ([yolact_ros](https://github.com/Eruvae/yolact_ros) is not required to run the simulation).

## Launch simulation

The simulation can be started using the ur_with_cam.launch file. This launch file will start gazebo with a specified world, load the robot, and set up moveit. Parameters can be changed to 

```shell
# Simulated environment with arm on a static pole
roslaunch ur_with_cam_gazebo ur_with_cam.launch base:=static world_name:=world14
# Simulated environment with arm on a retractable pole hanging from the ceiling, that can move in a 2x2m square
roslaunch ur_with_cam_gazebo ur_with_cam.launch base:=retractable world_name:=world19
# Arm with a simulated RGB camera array consisting of 9 cameras in addition to the single RGB-D camera (works for both retractable/static base)
roslaunch ur_with_cam_gazebo ur_with_cam.launch base:=static world_name:=world14 camera2:=camera_array
```

## Parameters for launch file

Some parameters are used by the [ROI viewpoint planner](https://github.com/Eruvae/roi_viewpoint_planner), for which this environment are created. They can be ignored if the environment is used for other purposes.

- **paused**: Starts gazebo in paused mode
- **gui**: Starts gazebo gui
- **world_path**: Path where the world file is located
- **world_name**: Name of the world to be loaded
- **tree_resolution**: Resolution of octree created by ROI viewpoint planner
- **workspace_tree**: Location of workspace octree used by ROI viewpoint planner
- **sampling_tree**: Location of sampling octree used by ROI viewpoint planner
- **map_frame**: Name of the frame of the map created by ROI viewpoint planner
- **ws_frame**: Name of the frame used for movement commands and workspace
- **planning_mode**: Specify preferred planning mode for ROI viewpoint planner
- **base**: The base of the robot arm, currently either "static" or "retractable"
- **camera**: The camera attached to the arm, currently "depth_camera" by default
- **camera2**: Attach a second camera, e.g "camera_array"
