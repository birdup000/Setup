#!/bin/bash

# Update the package index
clear
dialog --title "NVIDIA Driver and Floorp Installer" --msgbox "Updating package index..." 10 50
sudo apt update

# Add the PPA for "ubuntu-drivers" which handles NVIDIA driver installation repositories
clear
dialog --title "NVIDIA Driver and Floorp Installer" --msgbox "Adding PPA for NVIDIA drivers..." 10 50
sudo add-apt-repository ppa:graphics-drivers/ppa

# Install Floorp from the PPA
clear
dialog --title "NVIDIA Driver and Floorp Installer" --msgbox "Installing Floorp..." 10 50
curl -fsSL https://ppa.ablaze.one/KEY.gpg | sudo gpg --dearmor -o /usr/share/keyrings/Floorp.gpg
sudo curl -sS --compressed -o /etc/apt/sources.list.d/Floorp.list 'https://ppa.ablaze.one/Floorp.list'
sudo apt update

# Install floorp
sudo apt install floorp

# Update the package index again to include the new repository
clear
dialog --title "NVIDIA Driver and Floorp Installer" --msgbox "Updating package index again..." 10 50
sudo apt update

# Install the latest Nvidia Drivers
clear
dialog --title "NVIDIA Driver and Floorp Installer" --msgbox "Installing latest NVIDIA drivers..." 10 50
sudo apt install nvidia-driver-545
