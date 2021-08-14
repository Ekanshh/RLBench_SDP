#!/bin/bash


# Exit immediately if any command exits with a nonzero exit value
set -e

function install_basic_packages {
	sudo apt-get install figlet
}

function fancy_print {
    echo "################################################################################"
    figlet -t $1
    echo "################################################################################"
}


function download_coppeliasim {
	# Check ubuntu version
	s=`lsb_release -r`
	version=`echo $s | cut -c 10-14`

	# Downloading CoppeliaSim as per ubuntu version
	fancy_print "Downloading CoppeliaSim"
	VAR1="CoppeliaSim_Edu_V4_1_0_Ubuntu"
	VAR2=".tar.xz"

	if [[ "$version" = "16.04" ]]; then
		wget https://www.coppeliarobotics.com/files/CoppeliaSim_Edu_V4_1_0_Ubuntu16_04.tar.xz --no-check-certificate

		# Unzipping Coppeliasim
		# MUST INSTALL tar
		if [[ $(dpkg -l tar) ]]; then
			echo "Tar is already installed"
		else
        		echo "Installing Tar"
        		sudo apt-get install tar
        		echo "Success: Tar Installed" 
		fi

		VAR="16_04"
		VAR3="$VAR1$VAR$VAR2"
		fancy_print "Installing CoppeliaSim"
		tar -xf $VAR3

	elif [[ "$version" = "18.04" ]]; then
		wget https://www.coppeliarobotics.com/files/CoppeliaSim_Edu_V4_1_0_Ubuntu18_04.tar.xz --no-check-certificate
	
		if [[ $(dpkg -l tar) ]]; then
			echo "Tar is already installed"
		else
        		echo "Installing Tar"
        		sudo apt-get install tar
        		echo "Success: Tar Installed" 
		fi

		VAR="18_04"
		VAR3="$VAR1$VAR$VAR2"
		fancy_print "Installing CoppeliaSim"
		tar -xf $VAR3
	elif [[ "$version" = "20.04" ]]; then
		wget https://www.coppeliarobotics.com/files/CoppeliaSim_Edu_V4_1_0_Ubuntu20_04.tar.xz --no-check-certificate
	
		# Unzipping Coppeliasim
		# MUST INSTALL tar
		if [[ $(dpkg -l tar) ]]; then
			echo "Tar is already installed"
		else
        		echo "Installing Tar"
        		sudo apt-get install tar
        		echo "Success: Tar Installed" 
		fi

		VAR="20_04"
		VAR3="$VAR1$VAR$VAR2"
		fancy_print "Installing CoppeliaSim"
		tar -xf $VAR3
	else
		echo "Failed to check Ubuntu Version: Download CoppeliaSim manually"
	fi

	mv CoppeliaSim*/ CoppeliaSim
}

echo "##############################################################################
# Following software components are required to run this script: ( in order)
# 1. Anaconda (Install manually)
# 2. CoppeliaSim
# 3. PyRep
# 4. RLBench
################################################################################"

# Installing basic packages
install_basic_packages

# Check if anaconda is installed and create virtual env
if [[ "$conda list" ]]; then  
	fancy_print "Creating Conda VEnv"
	yes | conda create --name RLBench_SDP python=3.8 --channel pkgs/main
	source ~/anaconda3/etc/profile.d/conda.sh
	conda activate RLBench_SDP
	pip install opencv-python-headless
else 
	echo "FATAL: Failed to create conda virtual environment"
	exit 1
fi 


# Installing CoppeliaSim
if [[ '$find . -maxdepth 1 -type f -iname "CoppeliaSim*"' = "./CoppeliaSim*" ]]; then
        echo "CoppeliaSim is already installed"
else
	download_coppeliasim 
        path=$PWD/CoppeliaSim
	echo export COPPELIASIM_ROOT=$path >> ~/.bashrc 
	echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$COPPELIASIM_ROOT' >> ~/.bashrc
	echo 'export QT_QPA_PLATFORM_PLUGIN_PATH=$COPPELIASIM_ROOT' >> ~/.bashrc
fi

 echo "CoppeliaSim all set"
