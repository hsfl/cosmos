if [ -z "$1" ]
	then
	# use the default folder
	cosmosFolder=~/cosmos
else
	cosmosFolder=$1
fi

#developer=$2
usertype="$2"

echo "------------------"
echo "Downloading COSMOS Repositories >>>> "
echo "Setup as" $usertype

# clone the source code locally (can be later deployed into a remote/docker/etc.)
if [ -d $cosmosFolder/source/core ]
then
    echo "COSMOS/source/core exists"
else
    echo "------------------"

    # use ssh
    if [[ "$usertype" = "developer" ]]
    then
    	# developer must have ssh keys enabled
		echo "Cloning COSMOS/core from git@github.com:hsfl/cosmos-core.git"
		git clone git@github.com:hsfl/cosmos-core.git
    elif [[ "$usertype" = "embedded" ]]
    then
		echo "Downloading COSMOS/core from https://github.com/hsfl/cosmos-core/zipball/master/"
		# download the latest master as a zip file

		if [[ "$OSTYPE" == "linux" ]]; then
			wget -O core.zip https://github.com/hsfl/cosmos-core/zipball/master/
		elif [[ "$OSTYPE" == "linux-gnu" ]]; then
			wget -O core.zip https://github.com/hsfl/cosmos-core/zipball/master/
		elif [[ "$OSTYPE" == "darwin"* ]]; then
			 # Mac OSX
			curl https://github.com/hsfl/cosmos-core/zipball/master/ -o core.zip
		fi

		# unzip it (goes to a folder like cosmos-core-19271d3b9a1b)
		unzip -q -d source core.zip

		# rename the folder to core (cosmos-core-19271d3b9a1b -> core)
		mv source/cosmos-project-core* source/core

		# delete zip file
		rm core.zip

    else # not a developer use https
		echo "Cloning COSMOS/core from https://github.com/hsfl/cosmos-core.git"
		#echo "Cloning with depth 1 and branch master only"
		#git clone --depth 1 --branch master https://bitbucket.org/cosmos/core.git source/core
		git clone https://github.com/hsfl/cosmos-core.git source/core
    fi
fi

# clone the nodes folder locally (can be later deployed into a remote/docker/etc.)
if [ -d $cosmosFolder/nodes ]
then
    echo "COSMOS/nodes exists"
else
    echo "------------------"

    # use ssh
    if [[ "$usertype" = "developer" ]]
    then
		echo "Cloning COSMOS/nodes/cubesat1 from git@github.com:hsfl/cosmos-node-cubesat1.git"
		git clone git@github.com:hsfl/cosmos-node-cubesat1.git nodes/cubesat1
    elif [[ "$usertype" = "embedded" ]]
    then
		echo "Downloading COSMOS/nodes/cubesat1 from https://github.com/hsfl/cosmos-node-cubesat1/zipball/master/"
		# download the latest master as a zip file
		if [[ "$OSTYPE" == "linux" ]]; then
			wget -O cubesat1.zip https://github.com/hsfl/cosmos-node-cubesat1/zipball/master/
		elif [[ "$OSTYPE" == "linux-gnu" ]]; then
			wget -O cubesat1.zip https://github.com/hsfl/cosmos-node-cubesat1/zipball/master/		
		elif [[ "$OSTYPE" == "darwin"* ]]; then
			 # Mac OSX
			curl https://github.com/hsfl/cosmos-node-cubesat1/zipball/master/ -o cubesat1.zip
		fi

		# unzip it 
		unzip -q -d nodes cubesat1.zip

		# rename the folder to nodes/neutron1 
		mv nodes/cosmos-project-nodes-cubesat1* nodes/cubesat1

		# delete zip file
		rm cubesat1.zip
    else # not a developer use https, just download zip file
		echo "Cloning COSMOS/nodes/cubesat1 from https://github.com/hsfl/cosmos-node-cubesat1.git"
		#echo "Cloning with depth 1 and branch master only"
		#git clone --depth 1 --branch master https://bitbucket.org/cosmos/nodes-cubesat1.git nodes/cubesat1
		git clone https://github.com/hsfl/cosmos-node-cubesat1.git nodes/cubesat1

    fi
fi

# clone the resources folder locally (can be later deployed into a remote/docker/etc.)
if [ -d $cosmosFolder/resources ]
then
    echo "COSMOS/resources exists"
else
    echo "------------------"

    # use ssh
    if [[ "$usertype" = "developer" ]]
    then
		echo "Cloning COSMOS/resources from git@github.com:hsfl/cosmos-resources.git"
		git clone git@github.com:hsfl/cosmos-resources.git resources
    elif [[ "$usertype" = "embedded" ]]
    then
		# download zip to save space
		echo "Downloading COSMOS/resources from https://github.com/hsfl/cosmos-resources/zipball/master/"
		# download the latest master as a zip file
		if [[ "$OSTYPE" == "linux" ]]; then
			wget -O resources.zip https://github.com/hsfl/cosmos-resources/zipball/master/
		elif [[ "$OSTYPE" == "linux-gnu" ]]; then
			wget -O resources.zip https://github.com/hsfl/cosmos-resources/zipball/master/			
		elif [[ "$OSTYPE" == "darwin"* ]]; then
			# Mac OSX
			curl https://github.com/hsfl/cosmos-resources/zipball/master/ -o resources.zip
		fi

		# unzip it 
		unzip -q resources.zip

		# rename the folder to core 
		mv cosmos-project-resources* resources

		# delete zip file
		rm resources.zip
    else # not a developer use https, just download zip file
		echo "Cloning COSMOS/resources from https://github.com/hsfl/cosmos-resources.git"
		#echo "Cloning with depth 1 and branch master only"
		#git clone --depth 1 --branch master https://bitbucket.org/cosmos/resources.git resources
		git clone https://github.com/hsfl/cosmos-resources.git

    fi
fi


# clone the source/projects/template folder locally
if [ -d $cosmosFolder/source/projects/template ]
then
    echo "COSMOS/source/projects/template exists"
else
    echo "------------------"

    # use ssh
    if [[ "$usertype" = "developer" ]]
    then
		echo "Cloning COSMOS/source/projects/template from git@bitbucket.org:cosmos-project/project-template.git"
		git clone git@bitbucket.org:cosmos-project/project-template.git source/projects/template
    elif [[ "$usertype" = "embedded" ]]
    then
		# download zip to save space
		echo "Downloading COSMOS/source/projects/template from https://bitbucket.org/cosmos-project/project-template/get/master.zip"
		# download the latest master as a zip file
		if [[ "$OSTYPE" == "linux" ]]; then
			wget -O project-template.zip https://bitbucket.org/cosmos-project/project-template/get/master.zip
		elif [[ "$OSTYPE" == "linux-gnu" ]]; then
			wget -O project-template.zip https://bitbucket.org/cosmos-project/project-template/get/master.zip			
		elif [[ "$OSTYPE" == "darwin"* ]]; then
			# Mac OSX
			curl https://bitbucket.org/cosmos-project/project-template/get/master.zip -o project-template.zip
		fi

		# unzip it 
		unzip -q project-template.zip

		# rename the folder to core 
		mv cosmos-project-resources* project-template

		# delete zip file
		rm project-template.zip
    else # not a developer use https, just download zip file
		echo "Cloning COSMOS/project-template from https://bitbucket.org/cosmos-project/project-template.git"
		git clone https://bitbucket.org/cosmos-project/project-template.git source/projects/template
    fi
fi
