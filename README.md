# COSMOS: Comprehensive Open-architecture Solution for Mission Operations Systems

COSMOS is a software framework for operating distributed robotic systems, with a particular focus on space systems such as CubeSats, including satellite swarms and constellations. It is a software ecosystem with various applications from the embedded flight software to ground station management software, to the mission operations center user interfaces. COSMOS is developed at the [Hawaii Space Flight Laboratory](https://www.hsfl.hawaii.edu/) and can be deployed in CubeSats, Rovers, Scientific Instruments and more. Let's build the COSMOS for your next amazing application!

<img src="https://user-images.githubusercontent.com/1541868/160047280-010609a7-596a-4eef-a3d7-5ccc59dbb247.PNG" width=100%>

COSMOS is a system that is designed to primarily support the development and operations of one or more small spacecraft and is particularly suited for organizations with limited development and operations budget, such as universities. COSMOS is currently in active development. COSMOS is designed to be seamlessly integrated and compatible with multiple different resources (nodal architecture) or nodes such as satellites, unmanned air systems (UASs), ground control stations, computer stations, etc. and it is being expanded to address simulation scenarios with complex nodal architectures where events can be detected and actions triggered. It has been developed in the new paradigm of the network-of-things where any asset can be connected to the system in a plug and play approach making it very generic for the inclusion and removal of assets. When an asset is connected and is COSMOS compatible, all the system can be informed of its presence and receive telemetry that can be processed to take actions. COSMOS is a suite of software (including external modules) that enables the operations team to interface with the spacecraft, ground control network, payload and other customers in order to perform the mission operations functions including mission planning and scheduling; contact operations; data management and analysis; simulations (including the operational testbed); ground network control; payload operations; flight dynamics; and system management. COSMOS is being designed to easily be adapted for new spacecraft or installation in new mission operations centers (MOCs).

## Getting Started

We recommend installing COSMOS via Docker. By using Docker containers you will get all the COSMOS dependencies automatically resolved. This process works well for users and developers.

**Windows/MacOS**

* [Install Docker Desktop](https://www.docker.com/get-started/)

**Linux**
* [Install Docker Compose](https://docs.docker.com/compose/install/)


## Install Instructions (via Docker)

**Windows Instructions:** 

You can use the same installation instruction as Linux/MacOS after [installing Windows Subsystem for Linux (WSL)](https://learn.microsoft.com/en-us/windows/wsl/install). Read the section **Check which version of WSL you are running** on the linked page to double check which distro you are using (Ubuntu recommended). Docker Desktop may change the default distro to something else, in which case you will need to set it to Ubuntu using the instructions in that section.

**Linux/MacOS/WSL Instructions:** 

Open a terminal window (Linux/MacOS) or a WSL terminal (Windows) and enter the following command to clone this repository to the home folder.

Clone cosmos to the home folder ~/cosmos-docker (recommended path)
```bash
git clone https://github.com/hsfl/cosmos.git ~/cosmos-docker
```

**AFTER you have completed the prior steps, continue with the following steps. Note these steps are the same for both operating systems.** 


1. Change directories to the newly cloned folder:

```bash
cd ~/cosmos-docker
```

2. Copy the .env.example file and name it .env. Nothing needs to be changed as of yet.
```bash
cp .env.example .env
```

3. Next, run the following command to get the containers running.
```bash
docker-compose up -d
```

You may confirm that the cosmos_core container is running by either checking the running containers in Docker Desktop, or by running the following command:
```bash
docker ps
```

> If you are getting an error that looks like this:
> ```Got permission denied while trying to connect to the Docker daemon...```
> This is because your user has not been added to the *docker* group that is required after the Docker installation. Run the following command to add the current user to the *docker* group:
>
> ```sudo usermod -aG docker $USER```
>
> Close the terminal window and reopen another terminal window to complete the process. You can confirm that your user is in the *docker* group by running the command:
> ```bash
> groups
> ```
> Retry steps 1-3

## Demo

Let's run agent_001 from the terminal: 
```bash
docker exec cosmos_core agent_001
```
and run agent_002 from another terminal window:
```bash
docker exec cosmos_core agent_002
```

Agents are able to discover and communicate with each other.

Let's also try running agent_cpu:
```bash
docker exec cosmos_core agent_cpu 
```

We can see what agents are running with the *agent* program, giving it the argument *list*
```bash
docker exec cosmos_core agent list 
```

## Running COSMOS Web (via Docker)

COSMOS Web is the graphical interface for COSMOS.
Go to the [COSMOS Web setup page](https://github.com/hsfl/cosmos-web) for more instructions.

## Open the COSMOS source code
- Start Visual Studio Code. [Download VSC from this link](https://code.visualstudio.com/)
- Install extensions: 'Remote Containers'
- Click *Open a Remote Window* on the bottom left corner of Visual Studio Code. The icon looks like this:  <sub>></sub><sup><</sup>
- Select *Attach to Running Container*. Select */cosmos_core*
- Select *Open Folder* and go to /root/cosmos/source/core. Click *OK*.
- Open a new terminal with *Terminal->New Terminal*
- In the terminal, run the command ```git pull``` to get the latest changes.

## How do I continue from here?
**Visit the COSMOS documentation to learn more about COSMOS:** [https://hsfl.github.io/cosmos-docs/](https://hsfl.github.io/cosmos-docs/). The website contains the getting started guides, tutorials, examples and more!
