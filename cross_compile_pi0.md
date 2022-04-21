# Cross Compile for Raspberry PI 0
Raspberry PI cross compiler using GCC8 and GCC9 for Raspbian Buster.

To check what is your RPI0 OS release, login to your pi via ssh and enter:
```
cat /etc/os-release
```

[Click here to see the currently available Raspbian oficial releases]( https://www.raspberrypi.com/software/operating-systems/). To see past releases go to [this wiki page](https://en.wikipedia.org/wiki/Raspberry_Pi_OS) 

## Install the RPI zero toolchain on Docker
Make sure to install the Docker image as described here: https://github.com/hsfl/cosmos. 
Start the Docker container and enter the terminal.

TO DO: Update command for the new docker compose set up. 
```
docker run -t -d --name cosmos cosmos
```
Now let's install the toolchain. First download from the provided repository and then extract the files to the '/opt/' directory:
```
mkdir cosmos/toolchain

cd cosmos/toolchain
wget https://github.com/Pro/raspi-toolchain/releases/latest/download/raspi-toolchain.tar.gz
tar xfz raspi-toolchain.tar.gz --strip-components=1 -C /opt
```

## Test the new toolchain with RPI Zero
- open VS code and attach the 'cosmos' container 
- open a cosmos project (example: [cosmos-core](https://github.com/hsfl/cosmos-core) or [cosmos-project-template](https://github.com/hsfl/cosmos-project-template))
- Create a new file 'cmake-kits.json' inside the .vscode directory (see how to work with cmake kits in VSC [cosmos-core]( https://vector-of-bool.github.io/docs/vscode-cmake-tools/kits.html)) and add:
```
[
    {
      "name": "RPI Build",
      "toolchainFile": "${workspaceFolder}/cmake/toolchain_rpi_zero.cmake"
  }
]
```
- Create a new file (or just edit if it already exists) in 'source/cmake/toolchain_rpi_zero.cmake' and add the cross compiler path:
```
SET(CMAKE_SYSTEM_NAME Linux)
SET(CROSS_TYPE rpi)

SET(CMAKE_C_COMPILER   /opt/cross-pi-gcc/bin/arm-linux-gnueabihf-gcc)
SET(CMAKE_CXX_COMPILER /opt/cross-pi-gcc/bin/arm-linux-gnueabihf-g++)
SET(CMAKE_FIND_ROOT_PATH  /opt/cross-pi-gcc/arm-linux-gnueabihf)

SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
```
- restart VS code in case you don't see the "RPI build" kit in the 'active kits' selector (bottom blue bar in VS Code)
- build the selected target 
- sync with RPI 0 (change to your PI's address'
```
rsync -auv agent_template pi@192.168.1.10:~
```
- run the file in the PI Zero. Voila!
