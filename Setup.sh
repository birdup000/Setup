#!/bin/bash

# Welcome message and installation overview
echo "Welcome! This script will install various software packages on your system."
echo "You can choose to install the WiFi driver optionally."

# Update the package index
clear
sudo apt update

# Add the PPA for NVIDIA drivers
clear
sudo add-apt-repository ppa:graphics-drivers/ppa

# Install Floorp from the PPA
clear
curl -fsSL https://ppa.ablaze.one/KEY.gpg | sudo gpg --dearmor -o /usr/share/keyrings/Floorp.gpg
sudo curl -sS --compressed -o /etc/apt/sources.list.d/Floorp.list 'https://ppa.ablaze.one/Floorp.list'
sudo apt update

# Install floorp
sudo apt install floorp

# Install VSCode
sudo apt install code

# Update the package index again
clear
sudo apt update

# Install the latest Nvidia Drivers
clear
sudo apt install nvidia-driver-545

# Prompt for WiFi driver installation
read -p "Do you want to install the WiFi driver? (y/N): " install_wifi

# Install WiFi driver if chosen
if [[ $install_wifi =~ ^[Yy]$ ]]; then
  # Create directory, clone repository, and install dependencies
  sudo mkdir -p ~/src
  sudo cd ~/src
  sudo git clone https://github.com/morrownr/rtl8852bu.git
  sudo apt install -y build-essential dkms git iw gcc-12

  # Install the driver
  sudo cd ~/src/rtl8852bu
  sudo ./install-driver.sh

  # Confirm installation
  echo "WiFi driver installation completed!"
fi


# Install OpenShot Video Editor
sudo add-apt-repository ppa:openshot.developers/ppa
sudo apt update
sudo apt install openshot-qt python3-openshot

# Install Steam
cd ~
cd Downloads
mkdir installation_files
cd installation_files
wget https://cdn.akamai.steamstatic.com/client/installer/steam.deb
sudo dpkg -i steam.deb

# Install Scrcpy dependencies and Scrcpy
sudo apt install ffmpeg libsdl2-2.0-0 adb wget \
                gcc git pkg-config meson ninja-build libsdl2-dev \
                libavcodec-dev libavdevice-dev libavformat-dev libavutil-dev \
                libswresample-dev libusb-1.0-0 libusb-1.0-0-dev

# Install from source instead of packaged version stated in Scrcpy repo readme 
git clone https://github.com/Genymobile/scrcpy
cd scrcpy
./install_release.sh

# Install Raspberry Pi Imager
clear
sudo apt install rpi-imager

# Final message
echo "All desired software packages have been installed! Please Reboot your system to ensure everything has been sucessfully installed!"
