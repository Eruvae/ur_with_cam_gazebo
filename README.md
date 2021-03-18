# ur_with_cam_gazebo

Launch universal robot simulation with cam attached.

## Usage

Run the install_models.sh script from the models folder or copy the models manually to your gazebo models folder to be able to load the worlds.

Install the universal robots ROS packages. The most recent version can be found [here](https://github.com/fmauch/universal_robot/tree/calibration_devel). See also the installation instructions for the [Universal Robots ROS Driver](https://github.com/UniversalRobots/Universal_Robots_ROS_Driver) (only needed for physical arm).

## Relevant launch files

**ur5_with_cam.launch**: Simulated environment with arm on a static pole.

**ur5_retractable.launch**: Simulated environment with arm on a retractable pole hanging from the ceiling, that can move in a 2x2m square.

**ur5_with_cam_array.launch** and **ur5_retractable_with_cam_array.launch**: Same as above, but arm contains a simulated RGB camera array consisting of 9 cameras in addition to the single RGB-D camera.

## Parameters in launch files

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
