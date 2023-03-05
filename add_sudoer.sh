#!/bin/bash
set -ex
if [ $# -ne 1 ]; then
	echo "Usage: $0 <user_name>"
	exit 1
fi

if [ $(id -u) -ne 0 ]; then
	echo "This script must be run with root/sudo!!!"
	exit 1
fi

user=$1
os=$(lsb_release -is)
if [ "$os" != "CentOS" ]; then
	sudo usermod -aG sudo $user
fi
sudoer_files=/etc/sudoers.d/$user
echo "$user ALL=(ALL:ALL) NOPASSWD: ALL
Defaults editor=/usr/bin/vim" > ${sudoer_files}
