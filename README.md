# autoware_foxglove_studio_visualization

This repository is [autoware](https://github.com/autowarefoundation/autoware) visualization with [foxglove studio](https://github.com/foxglove/studio).

## Get started
### Setup with autoware

1. Install and build Autoware according to [installation](https://autowarefoundation.github.io/autoware-documentation/main/installation/autoware/source-installation/).
  - In this case, setup at `~/autoware`
2. Clone this repository

```sh
cd ~/autoware/src
git clone https://github.com/scepter914/autoware_foxglove_studio_visualization.git
```

3. vcs import

```sh
cd ~/autoware
vcs import src < src/autoware_foxglove_studio_visualization/build_depends.repos
```

4. Install by rosdep

```sh
rosdep install -y --from-paths src --ignore-src --rosdistro $ROS_DISTRO
```

5. Build with these package

```sh
cd ~/autoware
colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release
source ~/autoware/install/setup.bash
```

### Use Case 1. Visualization with foxglove studio

1. Set record topic you want to visualize in [shell script example](/scripts/record_visualization_topic.sh).
2. Launch launcher to create visualization rosbag2.
  - Be careful for last `/` in directory path.

```sh
ros2 launch autoware_foxglove_studio_visualization foxglove_rosbag2_creator.xml -r -param :rosbag=path_to/rosbag2_2022_02_05-00_54_33/
```

3. Open foxglove studio with the output rosbag2.

### Use Case 2. Visualization for comparison between component development

1. Make original result rosbag as same as Use Case 1.

```sh
ros2 launch autoware_foxglove_studio_visualization foxglove_rosbag2_creator.xml -r -param :rosbag=path_to/rosbag2_2022_02_05-00_54_33/
```

2. Make new feature or debug a package
3. Make rosbag with new feature

```
ros2 launch autoware_foxglove_studio_visualization perception_rosbag_creator.xml
```

4. Merge original result rosbag and new feature result rosbag
  - Recommend to use <https://github.com/tier4/ros2bag_extensions>
5. Open foxglove studio with the output rosbag2.

