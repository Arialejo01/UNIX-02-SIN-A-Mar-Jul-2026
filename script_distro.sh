sudo apt update #Refreshes the local system's list of available software packages and their latest versions
sudo apt upgrade #Installs the newest available updates for all currently installed software on your system
sudo apt install -y git vim make gcc libncurses-dev flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools qemu-system-x86 #Installs all the specified development tools and dependencies automatically without asking for confirmation (-y)
git clone --depth 1 https://github.com/torvalds/linux.git #Downloads only the most recent version (--depth 1) of the official Linux kernel source code to save time and space
cd linux #Changes the current directory to the newly downloaded linux folder
make menuconfig #Opens a text-based, interactive graphical menu to configure the settings before compiling the Linux kernel
make menuconfig