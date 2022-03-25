#!/bin/bash

echo "------------------"
echo "COSMOS deployment >>>> "

if [ -z "$1" ]
	then
	# use the default folder
	cosmosFolder=~/cosmos
else
	cosmosFolder=$1
fi

dockerBuild=$2

#echo "COSMOS folder set to: $cosmosFolder"

if [ -d $cosmosFolder/tmp ]
then
    echo "COSMOS/tmp exists"
else
	echo "Creating tmp folder to build COSMOS"
	mkdir $cosmosFolder/tmp
fi

# # remove the build folder
# #rm -rf /root/tmp

if [ -d $cosmosFolder/nodes ]
then
    echo "COSMOS/nodes exists"
else
	echo "Creating COSMOS/nodes folder"
	mkdir $cosmosFolder/nodes
fi

if [ -d $cosmosFolder/resources ]
then
    echo "COSMOS/resources exists"
else
	echo "Creating COSMOS/resources folder"
	mkdir $cosmosFolder/resources
fi

#echo "export PATH=$cosmosFolder/bin:$PATH"
echo "$PATH"|grep -q cosmos/bin && cosmosInThePath='yes' #&& echo "found cosmos on the PATH"

if [ "$cosmosInThePath" = "yes" ]
	then
	echo "COSMOS/bin folder was found on the PATH"
else
	echo "COSMOS/bin folder not found on the PATH"
	
	# mac
	if [[ "$OSTYPE" == "darwin"* ]]; then
		echo "adding cosmos path to ~/.bash_profile"

		echo "" >>~/.bash_profile
		echo "# COSMOS PATHs" >>~/.bash_profile
		echo "export PATH=$cosmosFolder/bin:\$PATH" >>~/.bash_profile
		source ~/.bash_profile #won't work unless the script was started with $source cosmos-setup.sh
	else #linux
		echo "export PATH=$cosmosFolder/bin:\$PATH" >>~/.profile
		source ~/.profile
	fi


	#source ~/.bashrc 
fi
