
### 安装额外的依赖
```bash
sudo apt install ros-noetic-gazebo-ros-pkgs
sudo apt install ros-noetic-pr2-description
sudo apt install ros-noetic-mavros ros-noetic-mavros-extras
sudo apt install ros-noetic-robot-state-publisher
sudo apt install ros-noetic-xacro
pip install tqdm
```

### 安装修改后的 requirements.txt
```bash
cd ~/catkin_ws/src/
pip install -r vswarm_cp/requirements.txt
```

### 模型 
安装 git-lfs
```bash
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt install git-lfs
git lfs install

# pull 
git lfs pull
```
打开 gazebo 手动添加模型陆路径


### 编译 python3 下的cv_bridge

遵循原有步骤，wstool
```bash
cd ~/catkin_ws/src
wstool merge vswarm_cp/vswarm.rosinstall
wstool update
```
Install selected ROS packages with Python 3 support

```bash
cd ~/catkin_ws
catkin config --append-args \
    -DPYTHON_EXECUTABLE=/usr/bin/python3 \
    -DPYTHON_INCLUDE_DIR=/usr/include/python3.8 \
    -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.8.so
source ~/.bashrc  # Make sure ROS_PYTHON_VERSION=3 is set before you invoke catkin build
catkin build cv_bridge # You can (probably) safely ignore the warnings
```

## 安装特定版本boost

https://blog.csdn.net/weixin_45929038/article/details/115425996
```
#find_package(Boost REQUIRED COMPONENTS signals system thread)
set(Boost_INCLUDE_DIRS /usr/include/boost)
```

### 更改 LD_PACKAGE_PATH
~/.bashrc 中添加
```
export LD_LIBRARY_PATH=/opt/ros/noetic/lib:$LD_LIBRARY_PATH
export GAZEBO_MODEL_PATH=~/catkin_ws/src/vswarm_cp/models:$GAZEBO_MODEL_PATH

```

