#!/bin/bash
. ./src/pentest_repos.sh
. ./src/pentest_pkgs.sh
. ./src/ubuntu_dev.sh
. ./src/fedora_dev.sh
. ./src/fedora_dev.sh

if [ $UID -ne 0 ]
then 
  echo "Please run this script as root!"
  exit
fi

echo "Please enter your username (for home directory configuration + folder permissions)"
read user

printf "Select your setup\n[1] PenTest Full (Git Repos + Packages)\n[2] PenTest Minimal (Packages Only)\n[3] Linux Dev(Ubuntu)\n[4] Linux Dev(RHEL)\n[5] BSD Dev\n"
read choice 

case $choice in 
  "1")
    mv /src/zshrc /home/$user/.zshrc;
    __pentest_repos__ $user;
    __pentest_pkgs__;;
  "2")
    mv /src/zshrc /home/$user/.zshrc;
    __pentest_pkgs__;;
  "3")
    __ubuntu_dev__ $user;;
  "4")
    __fedora_dev__ $user;;
  "5")
    __bsd_dev__ $user;;
esac

rmdir /home/$user/Desktop /home/$user/Documents /home/$user/Music /home/$user/Pictures /home/$user/Public /home/$user/Templates /home/$user/Videos
