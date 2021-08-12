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


# Installing PyRep
if [[ '$find . -maxdepth 1 -type f -iname "PyRep"' = "./PyRep" ]]; then
        echo "PyRep is already installed"
else
	fancy_print "Installing PyRep"
	git clone https://github.com/stepjam/PyRep.git
	cd ./PyRep/
	pip3 install -r requirements.txt
	pip3 install .
	cd ..
fi

# Installing RLBench
if [[ '$find . -maxdepth 1 -type f -iname "CoppeliaSim*"' = "./CoppeliaSim*" ]]; then
       echo "RLBench is already installed"
else
	fancy_print "Installing RLBench"
	git clone https://github.com/stepjam/RLBench.git
	cd ./RLBench/
    	pip3 install -r requirements.txt
    	pip3 install .
    	cd ..
fi


# Loop through all directories in the current directory
for f in *; do

# Check if there are any directories	
    if [ -d "$f" ]; then

	# Extract the directory names
	extract=`echo $f | cut -c 1-11`
	
    	# Copy files into respective directories
	# CoppeliaSim add-on files
	if [[ "$extract" = "CoppeliaSim" ]]; then
		cp -afr ./temp/CoppeliaSim/. ./CoppeliaSim/.
		echo "success"
	fi

	# PyRep add-on files
	if [[ "$extract" = "PyRep" ]]; then
		cp -afr ./temp/PyRep/. ./PyRep/.
		cd ./PyRep/.
		python3 setup.py install --user
		cd .. 
		echo "success"
	fi

	# RLBench add-on files
	if [[ "$extract" = "RLBench" ]]; then
		cp -afr ./temp/RLBench/. ./RLBench/.
		cd ./RLBench/.
		python3 setup.py install --user
		cd ..
		echo "success"
	fi		
    fi
done

# Remove temp after installation
rm -rf ./temp


fancy_print "All Packages Installated Successfully :)"
