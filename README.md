## Setup Script

This setup script is designed for seamless reimaging or recovery of your system, continuously evolving to adapt to unique needs and changes in daily workflows.

### Inspired by
This repository is inspired by [JoshXT's Repo](https://github.com/Josh-XT/Setup).

### Compatibility
- **Arch Linux and Arch-based Distributions**
- **Ubuntu 22.04 and Ubuntu-based Distributions**

### How to Use
1. Clone this repository.
2. Navigate to the repository directory.
3. Run the following commands:

```bash
chmod +x Script.sh
sudo sh Script.sh
```

### Installed Software (Note some Arch based or Arch versions aren't official so do keep in mind that...)

1. **Browser of Choice - Floorp**
   - Installed from the official repository.

2. **Latest Nvidia Drivers (Version 545)**
   - Ubuntu Repository Proprietary GPU Drivers (Requires Reboot).

3. **Steam**
   - Downloaded and installed from the official Akamai CDN (deb package).

4. **Raspberry Pi Imager**
   - Installed from the official repository.

5. **Scrcpy**
   - Installed from source for Android development.

6. **Realtek WiFi Driver rtl8852bu (Optional)**
   - Requires reboot to function.
   - Installed only if selected during script execution.

7. **Visual Studio Code (VSCode)**
   - Installed from the official repository.

8. **OpenShot Video Editor**
   - Installed from the official repository.

### Notes
- The script will prompt for optional installation of the WiFi driver.
- The NVIDIA drivers installation requires a system reboot.
- Ensure that the script is run with elevated privileges (`sudo`).

### Disclaimer
This script is a dynamic asset, adapting to development changes and expanding workflow requirements. Use it responsibly and review the code before execution.

### Final Message
All desired software packages have been installed! Please reboot your system to ensure everything has been successfully installed!
