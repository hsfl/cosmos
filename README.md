# COSMOS: Comprehensive Open-architecture Solution for Mission Operations Systems

COSMOS is a software framework for operating distributed robotic systems, with a particular focus on space systems such as CubeSats, including satellite swarms and constellations. It is a software ecosystem with various applications from the embedded flight software to ground station management software, to the mission operations center user interfaces. COSMOS is developed at the [Hawaii Space Flight Laboratory](https://www.hsfl.hawaii.edu/) and can be deployed in CubeSats, Rovers, Scientific Instruments and more. Let's build the COSMOS for your next amazing application!

<img src="https://user-images.githubusercontent.com/1541868/160047280-010609a7-596a-4eef-a3d7-5ccc59dbb247.PNG" width=100%>

COSMOS is a system that is designed to primarily support the development and operations of one or more small spacecraft and is particularly suited for organizations with limited development and operations budget, such as universities. COSMOS is currently in active development. COSMOS is designed to be seamlessly integrated and compatible with multiple different resources (nodal architecture) or nodes such as satellites, unmanned air systems (UASs), ground control stations, computer stations, etc. and it is being expanded to address simulation scenarios with complex nodal architectures where events can be detected and actions triggered. It has been developed in the new paradigm of the network-of-things where any asset can be connected to the system in a plug and play approach making it very generic for the inclusion and removal of assets. When an asset is connected and is COSMOS compatible, all the system can be informed of its presence and receive telemetry that can be processed to take actions. COSMOS is a suite of software (including external modules) that enables the operations team to interface with the spacecraft, ground control network, payload and other customers in order to perform the mission operations functions including mission planning and scheduling; contact operations; data management and analysis; simulations (including the operational testbed); ground network control; payload operations; flight dynamics; and system management. COSMOS is being designed to easily be adapted for new spacecraft or installation in new mission operations centers (MOCs).

## Getting Started

We recommend installing COSMOS via Docker. By using Docker containers you will get all the COSMOS dependencies automatically resolved. This process works well for users and developers.

* [Install Docker Desktop](https://www.docker.com/get-started/)
* [Install Docker Compose](https://docs.docker.com/compose/install/) (Only needed for a Linux OS. Docker compose is automatically installed on Docker Desktop on Windows and macOS)

Once you have Docker installed we are going to clone the cosmos repository. Open your terminal window, copy and run the following commands.

## Install Instructions (via Docker)

**Windows Instructions:** 

Open a command prompt window and enter the following two commands: 

On Windows: clone cosmos to c:/cosmos (recommended path)
```shell
git clone https://github.com/hsfl/cosmos.git c:/cosmos
```
this git clones cosmos core to c:/cosmos/docker/cosmos

```shell
git clone https://github.com/hsfl/cosmos-web.git c:/cosmos/tools/cosmos-web
```
this git clones cosmos web to c:/cosmos/docker/cosmos-web


**Linux/macOS Instructions:** 

Open a terminal window and enter the following two commands: 

clone cosmos to the home folder ~/cosmos (recommended path)
```shell
git clone https://github.com/hsfl/cosmos.git ~/cosmos
```
this git clones cosmos core to ~/cosmos/docker/cosmos

```shell
git clone https://github.com/hsfl/cosmos-web.git ~/cosmos/tools/cosmos-web
```
this git clones cosmos web to ~/cosmos/docker/cosmos-web


**AFTER you have completed the prior steps, continue with the following steps. Note these steps are the same for both operating systems.** 


1. Open terminal in your newly created cosmos folder. To build the cosmos image go into the newly created folder and run the Docker build command (this step may take several minutes to complete):

Windows: 
```bash
cd c:/cosmos
```

macOS:
```bash
cd cosmos
```

2. Copy the .env.example file and name it .env

Windows:
```bash
copy .env.example .env
```

macOS/Linux:
```bash
cp .env.example .env
```

Then change the variables inside the .env file to configure your setup.
If the next step fails with ```ERROR: Missing mandatory value for "environment" option``` be sure that the .env file was copied and created and filled out.

3. Next, run the following command to get the containers up in the terminal, this builds the telegraf, influxdb, and grafana containers needed for COSMOS. (this process may take a few minutes)
```
docker-compose build
```

4. Finally, run this command to create the containers in Docker. 
```
docker-compose up -d
```

5. Now that cosmos and cosmos-web have been installed

Let's run agent_001 from the terminal: 
```
docker exec cosmos /root/cosmos/bin/agent_001
```
and run agent_002 from another terminal window:
```
docker exec cosmos /root/cosmos/bin/agent_002
```
if you want to enter the 'cosmos' container in bash mode:
```
docker exec -it cosmos bash
```

Let's start agent_cpu and test some more features:

```
cd bin
./agent_cpu &
./agent list
```

## Running COSMOS Web (via Docker)

View grafana in the browser using this url
http://localhost:3000/

type user and pass (admin: admin), skip new pass (or change it if you want it)

(old instructions: Follow the instructions on the [COSMOS Web Installation page](https://hsfl.github.io/cosmos-docs/pages/2-getting_started/install/cosmos-web.html))


## Demo 

Start COSMOS Docker

Run agent_cpu
```
./comos/bin/agent_cpu 
```


Run propagator_simple. Propagate position and attitude in the satellite orbit for a specific node/satellite
```
./comos/bin/propagator_simple
```

Run agent_web? (WIP): State of Health collector agent.
```
./comos/bin/agent_web
```

Open Grafana to see the agent_cpu and propagator data by opening the standard widget.


## Open the COSMOS source code
- Start Visual Studio Code. [Download VSC from this link](https://code.visualstudio.com/)
- Install extensions: 'Docker' and 'Remote Containers'
- Click 'Open a Remote Window' on the bottom left corner of Visual Studio Code. 
- Select 'Attach to Running Container'. Select the cosmos container
- Select 'Open Folder' /root/cosmos. Click 'OK'

## How do I continue from here?
**Visit the COSMOS documentation to learn more about COSMOS:** [https://hsfl.github.io/cosmos-docs/](https://hsfl.github.io/cosmos-docs/). The website contains the getting started guides, tutorials, examples and more!

# Notes

Build cosmos docker separately
```bash
docker build -t cosmos .
```

Once the build has been completed we will run the 'cosmos' container. Let's create the docker container 'cosmos' in detach mode. 
```
docker run -t -d --name cosmos cosmos
```
