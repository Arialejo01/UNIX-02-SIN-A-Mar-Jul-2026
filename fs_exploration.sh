#Changes your current directory to the root directory (/), which is the very top level of the entire Linux file system hierarchy
cd /
#Lists the contents of the current directory, but adds a special character to the end of each name to indicate its file type. For example, it adds a / to directories and an * to executable files
ls -F
#Updates the local package database (index) on Debian/Ubuntu-based Linux systems
sudo apt update
#Update all installed software packages to their latest versions on Debian/Ubuntu-based Linux systems
sudo apt upgrade
#Install the GNU Parted tool on Debian/Ubuntu-based Linux systems
sudo apt install parted
#This command displays the system's disk and partition configuration. `sudo parted -l` lists storage devices and their partitions with details such as size, type, and labels. Then, `echo -e "\n---\n"` adds a separator line. Finally, `lsblk -f` displays the device tree with information about file systems, labels, UUIDs, and mounts. It is useful for diagnosing or verifying the storage status in Linux.
sudo parted -l && echo -e "\n---\n" %% lsblk -f && echo -e "\n---\n"
#It displays a detailed list of all available partitions and disks on the system, including their size, type, label, and file system.
parted -l
#It displays detailed information about block devices (disks, partitions, volumes) including their file system, label, UUID, and type.
lsblk -f