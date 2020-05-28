#!/bin/bash

# Install the required dependencies
sudo apt install build-essential cmake git pkg-config libgtk-3-dev \
    libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
    libxvidcore-dev libx264-dev libjpeg-dev libpng-dev libtiff-dev \
    gfortran openexr libatlas-base-dev python3-dev python3-numpy \
    libtbb2 libtbb-dev libdc1394-22-dev -y

# Clone the OpenCV’s and OpenCV contrib repositories
mkdir ~/opencv_build && cd ~/opencv_build
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git

# Once the download is complete, create a temporary build directory, and switch to it
cd ~/opencv_build/opencv
mkdir build && cd build

# Set up the OpenCV build with CMake
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_C_EXAMPLES=ON \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D OPENCV_GENERATE_PKGCONFIG=ON \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_build/opencv_contrib/modules \
    -D BUILD_EXAMPLES=ON ..

# Start the compilation process
# Modify the -j flag according to your processor.
# If you do not know the number of cores your processor, you can find it by typing nproc
make -j8

# Install OpenCV with
sudo make install

# Verify Installation
pkg-config --modversion opencv4

pip3 -r requirements.txt