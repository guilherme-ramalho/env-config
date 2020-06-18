#!/bin/bash

echo "*******UPDATING REPOSITORIES*******"
if ! apt-get update
then
    echo "Couldn't update the repos. Check the file /etc/apt/sources.list"
    exit 1
fi
echo "DONE"


echo "*******UPGRADE REPOSITORIES*******"
if ! apt-get dist-upgrade -y
then
    echo "Couldn't upgrade the repos. Check the file /etc/apt/sources.list"
    exit 1
fi
echo "DONE"


echo "*******INSTALL BATTERY POWER SAVER*******"
if ! apt install tlp tlp-rdw -y && systemctl enable tlp
then
    echo "Error installing battery power saver"
    exit 1
fi
echo "DONE"


echo "*******INSTALL GNOME TWEAK TOOL*******"
if ! apt install gnome-tweak-tool -y
then
    echo "Error installing Gnome Tweak Tools"
    exit 1
fi
echo "DONE"


echo "*******INSTALL GIT*******"
if ! apt install git -y
then
    echo "Error installing GIT"
    exit 1
fi
echo "DONE"


echo "*******INSTALL POSTMAN*******"
if ! snap install --edge postman
then
    echo "Error installing Postman"
    exit 1
fi
echo "DONE"


echo "*******INSTALL GUAKE TERMINAL*******"
if ! apt install guake -y
then
    echo "Error installing Guake Terminal"
    exit 1
fi
echo "DONE"
