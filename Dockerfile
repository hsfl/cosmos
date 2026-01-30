# Dockerfile for building the COSMOS development environment

FROM ubuntu:24.04

LABEL description="COSMOS Container" 

# Install apt packages
RUN apt-get update && apt upgrade -y
# Utility packages 
# TZDATA is now required to install cmake, quick fix to not break the docker install
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC 
RUN apt install -y tzdata
RUN apt install -y git cmake
RUN apt install -y build-essential 
RUN apt install -y rsync zip 
RUN apt install -y openssh-server 
RUN apt install -y iputils-ping
RUN apt install -y python3 python3-pip

# Prepare COSMOS installation scrips
WORKDIR /root/cosmos
# COPY ./install_scripts install_scripts


# new instructions
# clone cosmos
RUN git clone https://github.com/hsfl/cosmos.git ~/cosmos
# change to scrips folder
# RUN cd cosmos/install_scripts
WORKDIR /root/cosmos/install_scripts
# make scripts executable
RUN chmod +x *.sh
# run installation (may take a few min)
RUN ./cosmos-install.sh

# if build fails run this
# cd cosmos/source/core
# git checkout dev
# cd build
# cmake ..
# make install -j8

# # Container start folder
WORKDIR /root/cosmos
ENV PATH="$PATH:/root/cosmos/bin"

# RUN PERPETUALLY
# CMD tail -f /dev/null

# 
# >> instruction to build image
# docker build -t cosmos
# >> Run a new container in interactive mode 
# docker run -it cosmos
# Best Practice: Use a docker-compose.yml file to define volumes for persistent data, and never rely on editing files inside a container

# Prepare Qt environment
# RUN apt install -y libglu1-mesa-dev  libgl-dev libgl1 libxcb-cursor-dev libsecret-1-dev libxcb-cursor0
# RUN apt install -y qtcreator qtbase5-dev

# >> Run the docker with these arguments (from ubuntu 24:04 machine) to activate the X environemtn
# $ xhost +local:docker
# $ docker run -it --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" -e DISPLAY=$DISPLAY cosmos
# >> start qtcreator
# $ qtcreator
