#!/bin/bash

# Update the package index
clear
dialog --title "NVIDIA Driver Installer" --msgbox "Updating package index..." 10 50
sudo apt update

# Add the PPA for "ubuntu-drivers" which handles NVIDIA driver installation repositories
clear
dialog --title "NVIDIA Driver Installer" --msgbox "Adding PPA for NVIDIA drivers..." 10 50
sudo add-apt-repository ppa:graphics-drivers/ppa

# Update the package index again to include the new repository
clear
dialog --title "NVIDIA Driver Installer" --msgbox "Updating package index again..." 10 50
sudo apt update

# Install the latest Nvidia Drivers 
clear
dialog --title "NVIDIA Driver Installer" --msgbox "Installing latest NVIDIA drivers..." 10 50
sudo apt install nvidia-driver-545
