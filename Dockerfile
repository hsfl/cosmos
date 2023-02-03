FROM ubuntu:20.04

LABEL description="COSMOS Container" 

# Install apt packages
RUN apt-get update && apt upgrade -y
# Utility packages 
# TZDATA is now required to install cmake, quick fix to not break the docker install
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
RUN apt-get install git cmake -y 
RUN apt-get install build-essential -y 
RUN apt-get install rsync zip -y 
RUN apt-get install openssh-server -y 
RUN apt-get install -y iputils-ping
RUN apt-get install -y python3 python3-pip

# Run COSMOS quick installer
WORKDIR /root/cosmos
COPY ./scripts scripts
RUN chmod +x scripts/cosmos-install.sh
RUN chmod +x scripts/cosmos-repos.sh
RUN chmod +x scripts/cosmos-deploy.sh
RUN chmod +x scripts/cosmos-build.sh
WORKDIR /root/cosmos/scripts/
RUN ./cosmos-install.sh

# Container start folder
WORKDIR /root/cosmos

# RUN PERPETUALLY
CMD tail -f /dev/null
