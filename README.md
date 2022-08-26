# autoware_rosbag_foxglove_visualization

This repository is rosbag from [autoware](https://github.com/autowarefoundation/autoware) visualization with [foxglove studio](https://github.com/foxglove/studio).

- Supported feature
  - [x] Making rosbag2 to visualize pointcloud2 in foxglove
  - [ ] Making rosbag2 to visualize perception results in foxglove

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
vcs import src < ./src/autoware_foxglove_studio_visualization/build_depends.repos
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

### Visualization with foxglove studio

1. Set record topic you want to visualize in [shell script example](/scripts/rosbag_record.sh).
2. Launch visualization launcher.
  - See [Autoware tutorials](https://autowarefoundation.github.io/autoware-documentation/main/tutorials/ad-hoc-simulation/rosbag-replay-simulation/) for paramters

```sh
ros2 launch autoware_foxglove_studio_visualization foxglove_rosbag2_creator.xml map_path:=$HOME/Downloads/sample-map-rosbag vehicle_model:=sample_vehicle sensor_model:=sample_sensor_kit
```

3. Run record scripts rosbag2 for visualization.

```sh
./autoware_foxglove_studio_visualization/scripts/record_and_remap.sh ~/path_to_rosbag/input_rosbag.db3
```

4. Open foxglove studio with the output rosbag2.

Output files is below.

```
- ~/path_to_rosbag/
  - input_rosbag.db3: original rosbag
  - /visualize/{TIME}/
    - {TIME}.db3: rosbag for visualization
    - input_rosbag.txt
    - metadata.yaml
```

- Option
  - Analyze by Rosbag
    - If you need analyze in detail, you can analyze topic data by using rosbag2-api.
    - You can access to topic data of rosbag2 easily by [rosbag2](https://github.com/scepter914/rosbag2-loader-py).
