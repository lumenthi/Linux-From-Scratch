export LFS=/mnt/lfs

# Create mnt folder
sudo mkdir -pv $LFS/boot

# Mount partitions
sudo mount -v -t ext4 /dev/sdb2 $LFS
sudo mount -v -t ext2 /dev/sdb1 $LFS/boot
sudo /sbin/swapon -v /dev/sdb3

# Create LFS user
sudo groupadd lfs
sudo useradd -s /bin/bash -g lfs -m -k /dev/null lfs
sudo passwd lfs

# LFS User rights
sudo chown -v lfs $LFS
sudo chown -v lfs $LFS/{usr{,/*},lib,var,etc,bin,sbin,tools}

su - lfs

# Chroot LFS
sudo chroot "/mnt/lfs" /usr/bin/env -i HOME=/root TERM="$TERM" PS1='(lfs chroot) \u:\w\$ ' PATH=/bin:/usr/bin:/sbin:/usr/sbin HOSTTYPE='4.15.3' /bin/bash --login

:<< 'COMMENT'
=================GRUB CONFIGURATION============================
user@debian:~$ sudo cat /etc/grub.d/40_custom
#!/bin/sh
exec tail -n +3 $0
# This file provides an easy way to add custom menu entries.  Simply type the
# menu entries you want to add after this comment.  Be careful not to change
# the 'exec tail' line above.
# Begin /boot/grub/grub.cfg
set default=0
set timeout=5

insmod part_gpt
insmod ext2
set root='hd1,gpt1'

menuentry "ft_linux, Linux 4.15.3-lumenthi" {
	linux /vmlinuz-4.15.3-lumenthi root=/dev/sdb2
}
COMMENT
