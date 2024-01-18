#!/bin/bash

# Check distribution
if [ -f /etc/arch-release ]; then
  package_manager="pacman"
  aur_helper="yay"
else
  package_manager="apt"
  aur_helper=""
fi

# Welcome message and installation overview
echo "Welcome! This script will install various software packages on your system."
echo "You can choose to install the WiFi driver optionally."

# Update the package index
clear
if [ "$package_manager" = "apt" ]; then
  sudo apt update
else
  sudo pacman -Syu
fi

# Add the PPA for NVIDIA drivers if on Ubuntu
if [ "$package_manager" = "apt" ]; then
  clear
  sudo add-apt-repository ppa:graphics-drivers/ppa
fi

# Install Floorp from the PPA or AUR
clear
if [ "$package_manager" = "apt" ]; then
  curl -fsSL https://ppa.ablaze.one/KEY.gpg | sudo gpg --dearmor -o /usr/share/keyrings/Floorp.gpg
  sudo curl -sS --compressed -o /etc/apt/sources.list.d/Floorp.list 'https://ppa.ablaze.one/Floorp.list'
  sudo apt update
  sudo apt install floorp
else
  $aur_helper -S floorp-bin
fi

# Install VSCode
if [ "$package_manager" = "apt" ]; then
  sudo apt install code
else
  $aur_helper -S visual-studio-code-bin
fi

# Update the package index again
clear
if [ "$package_manager" = "apt" ]; then
  sudo apt update
else
  sudo pacman -Syu
fi

# Install the latest Nvidia Drivers
clear
if [ "$package_manager" = "apt" ]; then
  sudo apt install nvidia-driver-545
else
  sudo pacman -S nvidia
fi

# Prompt for WiFi driver installation
read -p "Do you want to install the WiFi driver? (y/N): " install_wifi

# Install WiFi driver if chosen
if [[ $install_wifi =~ ^[Yy]$ ]]; then
  # Create directory, clone repository, and install dependencies
  sudo mkdir -p ~/src
  cd ~/src
  git clone https://github.com/morrownr/rtl8852bu.git
  if [ "$package_manager" = "apt" ]; then
    sudo apt install -y build-essential dkms git iw gcc-12
  else
    sudo pacman -S base-devel dkms iw gcc
  fi

  # Install the driver
  cd rtl8852bu
  sudo ./install-driver.sh

  # Confirm installation
  echo "WiFi driver installation completed!"
fi

# Install OpenShot Video Editor
if [ "$package_manager" = "apt" ]; then
  sudo add-apt-repository ppa:openshot.developers/ppa
  sudo apt update
  sudo apt install openshot-qt python3-openshot
else
  $aur_helper -S openshot
fi

# Install Steam
cd ~
cd Downloads
mkdir installation_files
cd installation_files
wget https://cdn.akamai.steamstatic.com/client/installer/steam.deb
if [ "$package_manager" = "apt" ]; then
  sudo dpkg -i steam.deb
else
  sudo pacman -S steam
fi

# Install Scrcpy dependencies and Scrcpy
if [ "$package_manager" = "apt" ]; then
  sudo apt install ffmpeg libsdl2-2.0-0 adb wget gcc git pkg-config meson ninja-build libsdl2-dev libavcodec-dev libavdevice-dev libavformat-dev libavutil-dev libswresample-dev libusb-1.0-0 libusb-1.0-0-dev
else
  sudo pacman -S ffmpeg sdl2 adb wget
fi

# Install Scrcpy from source instead of packaged version stated in Scrcpy repo readme 
git clone https://github.com/Genymobile/scrcpy
cd scrcpy
./install_release.sh

# Install Raspberry Pi Imager
clear
if [ "$package_manager" = "apt" ]; then
  sudo apt install rpi-imager
else
  $aur_helper -S rpi-imager
fi

# Final message
echo "All desired software packages have been installed! Please reboot your system to ensure everything has been successfully installed!"
