# Cross Compile for Raspberry PI 0
Raspberry PI cross compiler using the new GCC8 and GCC9 for Raspbian Buster.

## install toolchain on Docker
```
cd cosmos/toolchain
wget https://github.com/Pro/raspi-toolchain/releases/latest/download/raspi-toolchain.tar.gz
sudo tar xfz raspi-toolchain.tar.gz --strip-components=1 -C /opt
```

## Test the new toolchain with RPI Zero
- open VS code
- open .vscode/cmake-kits.json (see https://vector-of-bool.github.io/docs/vscode-cmake-tools/kits.html) and add:
```
[
    {
      "name": "RPI Build",
      "toolchainFile": "${workspaceFolder}/cmake/toolchain_rpi_zero.cmake"
  }
  ]
```
- open source/cmake/toolchain_rpi_zero.cmake
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
- restart VS code in case you don't see the "RPI build" kit
- open template project 
- compile agent_template
- sync with RPI 0
```
rsync -auv agent_template pi@192.168.152.173:~
```
