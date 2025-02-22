#!/bin/bash

# Oki scan driver install script to ubuntu 24.04 and derivatives.
# Models: 
# CX2633 MFP; CX2731 MFP; ES3451 MFP; ES3452 MFP; ES3461 MFP; ES4172LP MFP; 
# ES4192 MFP; ES5162 MFP; ES5162LP MFP; ES5461 MFP; ES5462 MFP; ES5463 MFP; ES5473 MFP; 
# ES8451 MFP; ES8453 MFP; ES8461 MFP; ES8461+ MFP; ES8462 MFP; ES8463 MFP; ES8473 MFP; 
# ES8483 MFP; MB441; MB451; MB461; MB461+LP; MB471; MB472; MB491; MB491+LP; MB492; MB562; 
# MC332; MC342; MC351; MC352; MC361; MC362; MC363; MC561; MC562; MC563; MC573; MC851; 
# MC851+; MC852; MC853; MC860; MC861; MC861+; MC862; MC863; MC873; MC883; MPS2731mc; MPS4200mb

# 1. Oki Scan Driver download files:

	cd ~/Downloads
	mkdir -p oki_scan_driver/python2
	cd oki_scan_driver
	
	echo "Downloading driver..."	
	wget https://github.com/BassHero/okimfpsdrv/releases/download/v1.0/okimfpsdrv_1.7-0_amd64_20230201.deb
	
	# The Original Oki driver can be downloaded on link:
	# https://www.oki.com/printing/download/okimfpsdrv_1.7-0_amd64_231225.deb
	# but it don't works. It causes dependency's problems with python.
	#
	# Since the initial script the version numbers of the python files have changed and I updated them - Roland Giesler
	
	echo "Installing Python2..."	
	
	cd python2

	# python2 (2.7.18-3) [universe]
	wget https://mirrors.kernel.org/ubuntu/pool/universe/p/python-defaults/python2_2.7.18-3_amd64.deb
	
        # python2-minimal (= 2.7.18-3)
	wget https://mirrors.kernel.org/ubuntu/pool/universe/p/python-defaults/python2-minimal_2.7.18-3_amd64.deb

	# python2.7-minimal (>= 2.7.18~)
	#wget http://security.ubuntu.com/ubuntu/pool/universe/p/python2.7/python2.7-minimal_2.7.18-13ubuntu1.1_amd64.deb
        wget https://security.ubuntu.com/ubuntu/pool/universe/p/python2.7/python2.7-minimal_2.7.18-13ubuntu1.5_amd64.deb

	# libpython2.7-minimal (= 2.7.18-13ubuntu1.1) [amd64, i386]
	#wget http://security.ubuntu.com/ubuntu/pool/universe/p/python2.7/libpython2.7-minimal_2.7.18-13ubuntu1.1_amd64.deb
        wget https://security.ubuntu.com/ubuntu/pool/universe/p/python2.7/libpython2.7-minimal_2.7.18-13ubuntu1.5_amd64.deb

	# libpython2-stdlib (= 2.7.18-3)
	#wget http://mirrors.kernel.org/ubuntu/pool/universe/p/python-defaults/libpython2-stdlib_2.7.18-3_amd64.deb
        wget https://security.ubuntu.com/ubuntu/pool/universe/p/python-defaults/libpython2-stdlib_2.7.18-3_amd64.deb

	# libpython2.7-stdlib (>= 2.7.18~) 
	#wget https://security.ubuntu.com/ubuntu/pool/universe/p/python2.7/libpython2.7-stdlib_2.7.18-13ubuntu1.1_amd64.deb
	wget https://security.ubuntu.com/ubuntu/pool/universe/p/python2.7/libpython2.7-stdlib_2.7.18-13ubuntu1.5_amd64.deb

	# python2.7 (>= 2.7.18~)
	#wget http://security.ubuntu.com/ubuntu/pool/universe/p/python2.7/python2.7_2.7.18-13ubuntu1.5_amd64.deb
	wget https://security.ubuntu.com/ubuntu/pool/universe/p/python2.7/python2.7_2.7.18-13ubuntu1.5_amd64.deb


	# 2. Packages Installation

	# 2.1 Dependencies

	sudo apt install libnsl2

	# 2.1.1 python2-minimal and dependencies
	#sudo dpkg -i libpython2.7-minimal_2.7.18-13ubuntu1.5_amd64.deb python2.7-minimal_2.7.18-3ubuntu1.5_amd64.deb python2-minimal_2.7.18-3_amd64.deb
	sudo dpkg -i libpython2.7-minimal_2.7.18-13ubuntu1.5_amd64.deb python2.7-minimal_2.7.18-13ubuntu1.5_amd64.deb python2-minimal_2.7.18-3_amd64.deb

	# 2.1.2 libpython2-stdlib and dependencies
	sudo dpkg -i libpython2.7-stdlib_2.7.18-13ubuntu1.5_amd64.deb libpython2-stdlib_2.7.18-3_amd64.deb

	# 2.1.3 python2.7 (>= 2.7.18~) dependency
	sudo dpkg -i python2.7_2.7.18-13ubuntu1.5_amd64.deb

	# 2.1.4 And finally, python2
	sudo dpkg -i python2_2.7.18-3_amd64.deb
	
	
	# 2.2.1 Installing Oki Scan Driver	
	
	cd ~/Downloads/oki_scan_driver	
	
	echo "Installing driver..."
	sudo dpkg -i okimfpsdrv_1.7-0_amd64_20230201.deb
	
	cd /usr/libexec/okimfpdrv
	
	# 2.2.2 Add a PC to scanner
	echo "Starting Scanadm..."
	python2 scanadm.py
	
	
	echo "Installation Finished!"
