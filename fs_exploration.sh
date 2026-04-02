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
#Its main function is to evaluate two expressions and return true only if both sides are true. If either side is false, the result will be false.
&&
#This command checks if the /sys/firmware/efi directory exists, indicating that the system is running under UEFI. If it exists, it prints "UEFI"; otherwise, it displays "BIOS," allowing for quick identification of the firmware used at boot.
[ -d /sys/firmware/efi ] && echo "UEFI" || echo "BIOS"
#(Logical OR or logical "or") evaluates two expressions and returns true if at least one of them is true, functioning like a "short circuit": if the first expression is true, it does not evaluate the second.
||
#On Unix/Linux systems, it displays detailed information and metadata about the test.txt file.
stat test.txt