# Cross Compile for Raspberry PI
Raspberry PI cross compiler using GCC8 and GCC9 for Raspbian Buster.

To check what is your RPI's OS release, login to your pi via ssh and enter:
```
cat /etc/os-release
```

[Click here to see the currently available Raspbian oficial releases]( https://www.raspberrypi.com/software/operating-systems/). To see past releases go to [this wiki page](https://en.wikipedia.org/wiki/Raspberry_Pi_OS) 

## Install the RPI toolchain on Docker
Make sure to install the Docker image as described here: https://github.com/hsfl/cosmos. 
Start the Docker container and enter the terminal.
```
docker run -t -d --name cosmos cosmos
```
Now let's install the toolchain. First download from the provided repository and then extract the files to the '/opt/' directory:
```
wget https://github.com/Pro/raspi-toolchain/releases/latest/download/raspi-toolchain.tar.gz
tar xfz raspi-toolchain.tar.gz --strip-components=1 -C /opt
```

## Test the new toolchain with RPI Zero
- open VS code and attach the 'cosmos' container, see instructions in the [readme](https://github.com/hsfl/cosmos).
- clone the [cosmos-project-template](https://github.com/hsfl/cosmos-project-template)) to your source/projects folder in the cosmos image. 
- next, go to the build folder and run do_cmake_rpi in the vscode terminal. 
```
cd build
./do_cmake_rpi
```
- then build the project
```
cd rpi_ 
make -j8
```
- sync with the RPI (change to your PI's address), you will have to transfer the file to your host machine first and then sync from there. 
```
rsync -auv agent_template pi@ipaddres:~
```
- run the file on your Raspberry Pi. Voila!
