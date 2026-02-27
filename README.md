# COSMOS: Comprehensive Open-architecture Solution for Mission Operations Systems

COSMOS is a software framework for operating distributed robotic systems, with a particular focus on space systems such as CubeSats, including satellite swarms and constellations. It is a software ecosystem with various applications from the embedded flight software to ground station management software, to the mission operations center user interfaces. COSMOS is developed at the [Hawaii Space Flight Laboratory](https://www.hsfl.hawaii.edu/) and can be deployed in CubeSats, Rovers, Scientific Instruments and more. 

<img src="https://user-images.githubusercontent.com/1541868/160047280-010609a7-596a-4eef-a3d7-5ccc59dbb247.PNG" width=100%>

## Step 1. Install Docker
We use Docker to build the COSMOS core and the COSMOS tools. By using Docker containers, you will get all the COSMOS dependencies automatically resolved. This process works well for users and developers.

> [!Warning]
> **Instructions for Windows users only:**
> Before you install Docker, you will first need to install [Windows Subsystem for Linux (WSL)](https://learn.microsoft.com/en-us/windows/wsl/install) with the recommended default Ubuntu 24.04 distro. 

**Instructions for all users:** 
* [Click here to install Docker Desktop](https://www.docker.com/get-started/)

## Step 2. Clone the COSMOS repository

Open a terminal window (Linux/MacOS) or a WSL terminal (Windows) and enter the following command to clone this repository to the home folder.

Clone the cosmos repository to the home folder ~/cosmos (recommended path)
```bash
git clone https://github.com/hsfl/cosmos.git ~/cosmos
```

Change directories to the newly cloned folder:

```bash
cd ~/cosmos
```

## Step 3. Build the Docker Image 

This step may take several minutes (expect ~5 to 10 m) as it installs the various dependencies and builds the cosmos binaries. The docker command builds a new Docker image with name "cosmos_u24" as a reference to Ubuntu 24.04
```
docker build -t cosmos_u24 .
```
While you wait you can check the various steps that are run from this [Docker file](https://github.com/hsfl/cosmos/blob/master/Dockerfile). 

Run a new container 'cosmos' from image 'cosmos_u24' in interactive mode to check if the image was built correctly. We'll use hostname 'sat1' to indicate this will run a simulation of a generic satellite #1. 
```
docker run --hostname sat1 -it --name cosmos cosmos_u24
```

Run the 'agent' program just to test that cosmos was correctly installed 
```
agent
```
You should see a simple response with the agent program arguments
```
root@29c377c10f6f:~/cosmos# agent
Usage: agent [ list | dump [soh, beat, ###] | node_name agent_name "request [ arguments ]" ]
```
Now exit the Docker container
```
exit
```
This completes the basic installation of COSMOS core.

## Step 4. Run Demo

Let's start the docker container again
```
docker start cosmos
```

Run agent_001 from the terminal: 
```bash
docker exec cosmos agent_001
```
From another terminal window run agent_002:
```bash
docker exec cosmos agent_002
```

You can observe that the two agents can discover and communicate with one another.

Let's also try running agent_cpu:
```bash
docker exec cosmos agent_cpu 
```

We can see what agents are running with the *agent* program, giving it the argument *list*
```bash
docker exec cosmos agent list 
```

Check the commands available for each agent by querying the 'node' and 'agent_name'
```
docker exec cosmos agent sat_111 agent_001 
```

Let's turn off the agents by running the 'agent' program with the aruments: 'node' and 'agent_name' and 'shutdown'
```
docker exec cosmos agent sat_111 agent_001 shutdown
docker exec cosmos agent sat_001 agent_002 shutdown
docker exec cosmos agent 29c377c10f6f cpu shutdown #where the node `29c377c10f6f` will differ
```

## Step 5. Open the COSMOS source code
- Start Visual Studio Code. [Download VSC from this link](https://code.visualstudio.com/)
- Select Extensions from the left side icons. Install extension: 'Dev Containers'
- Click *Open a Remote Window* on the bottom left corner of Visual Studio Code. The icon looks like this:  <sub>></sub><sup><</sup>
- Select *Attach to Running Container*. Select */cosmos*
- Select *Open Folder* and go to /root/cosmos/source/core. Click *OK*.
- Open a new terminal with *Terminal->New Terminal*
- In the terminal, run the command ```git pull``` to get the latest changes.

## How do I continue from here?
**Visit the COSMOS documentation to learn more about COSMOS:** [https://hsfl.github.io/cosmos-docs/](https://hsfl.github.io/cosmos-docs/). The website contains the getting started guides, tutorials, examples and more!

## Running COSMOS Web (currently deprecated)

COSMOS Web is the graphical interface for COSMOS.
Go to the [COSMOS Web setup page](https://github.com/hsfl/cosmos-web) for more instructions.
