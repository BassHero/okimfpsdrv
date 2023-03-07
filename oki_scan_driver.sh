#!/bin/bash

# Oki scan driver install script
# Models: 
# CX2633 MFP; CX2731 MFP; ES3451 MFP; ES3452 MFP; ES3461 MFP; ES4172LP MFP; 
# ES4192 MFP; ES5162 MFP; ES5162LP MFP; ES5461 MFP; ES5462 MFP; ES5463 MFP; ES5473 MFP; 
# ES8451 MFP; ES8453 MFP; ES8461 MFP; ES8461+ MFP; ES8462 MFP; ES8463 MFP; ES8473 MFP; 
# ES8483 MFP; MB441; MB451; MB461; MB461+LP; MB471; MB472; MB491; MB491+LP; MB492; MB562; 
# MC332; MC342; MC351; MC352; MC361; MC362; MC363; MC561; MC562; MC563; MC573; MC851; 
# MC851+; MC852; MC853; MC860; MC861; MC861+; MC862; MC863; MC873; MC883; MPS2731mc; MPS4200mb

# 1. Oki Scan Driver Installation:

	cd /home/$USER/Downloads
	
	echo "Downloading driver..."	
	wget https://github.com/BassHero/okimfpsdrv/releases/download/v1.0/okimfpsdrv_1.7-0_amd64_20230201.deb
	
	# The Original Oki driver can be downloaded on link:
	# https://www.oki.com/printing/download/okimfpsdrv_1.7-0_amd64_231225.deb
	# but it don't works. It causes dependency's problems with python.
	
	echo "Installing Python2..."
	sudo apt install python2 -y
	
	echo "Installing Python3..."
	sudo apt install python3
	
	echo "Installing driver..."
	sudo dpkg -i okimfpsdrv_1.7-0_amd64_20230201.deb
	
	cd /usr/libexec/okimfpdrv
	
	echo "Starting Scanadm..."
	python2 scanadm.py
	echo "Installation Finished!"
	
	
	
	

