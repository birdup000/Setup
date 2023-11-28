#!/bin/bash

# Update the package index
clear
sudo apt update

# Add the PPA for "ubuntu-drivers" which handles NVIDIA driver installation repositories
clear
sudo add-apt-repository ppa:graphics-drivers/ppa

# Install Floorp from the PPA
clear
curl -fsSL https://ppa.ablaze.one/KEY.gpg | sudo gpg --dearmor -o /usr/share/keyrings/Floorp.gpg
sudo curl -sS --compressed -o /etc/apt/sources.list.d/Floorp.list 'https://ppa.ablaze.one/Floorp.list'
sudo apt update

# Install floorp
sudo apt install floorp

# Update the package index again to include the new repository
clear
sudo apt update

# Install the latest Nvidia Drivers
clear
sudo apt install nvidia-driver-545


# Install Steam
cd ~
cd Downloads
mkdir installation_files
cd installation_files
wget https://cdn.akamai.steamstatic.com/client/installer/steam.deb
sudo dpkg -i steam.deb


# Install Raspberry Pi Imager
clear
sudo apt install rpi-imager
