# autoware_foxglove_studio_visualization

This repository is [autoware](https://github.com/autowarefoundation/autoware) visualization with [foxglove studio](https://github.com/foxglove/studio).

## Get started
### Setup with Autoware

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

If you need analyze in detail, you can analyze topic data by using rosbag2-api.
You can access to topic data of rosbag2 easily by [rosbag2](https://github.com/scepter914/rosbag2-loader-py).

### Use Case 2. Visualization for comparison between component development

1. Make original result rosbag as same as Use Case 1.

```sh
ros2 launch autoware_foxglove_studio_visualization foxglove_rosbag2_creator.xml -r -param :rosbag=path_to/rosbag2_2022_02_05-00_54_33/
```

2. Develop autoware and re-build autoware
  - Make new feature
  - Debug a package
  - Change parameters
3. Run comparison_rosbag2_creator

```
ros2 launch autoware_foxglove_studio_visualization comparison_rosbag2_creator.xml -r -param :rosbag=path_to/rosbag2_2022_02_05-00_54_33/
```

4. Open foxglove studio with comparison topic.
