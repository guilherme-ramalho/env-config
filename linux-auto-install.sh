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


echo "*******INSTALLING BATTERY POWER SAVER*******"
if ! apt install tlp tlp-rdw -y && systemctl enable tlp
then
    echo "Error installing battery power saver"
    exit 1
fi
echo "DONE"


echo "*******INSTALLING GNOME TWEAK TOOL*******"
if ! apt install gnome-tweak-tool -y
then
    echo "Error installing Gnome Tweak Tools"
    exit 1
fi
echo "DONE"


echo "*******INSTALLING GIT*******"
if ! apt install git -y
then
    echo "Error installing GIT"
    exit 1
fi
echo "DONE"


echo "*******INSTALLING POSTMAN*******"
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


echo "*******INSTALLING CURL*******"
if ! apt install curl -y
then
    echo "Error installing Guake Terminal"
    exit 1
fi
echo "DONE"


echo "*******INSTALLING AND LOADING NVM*******"
if ! curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash && wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash && export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
then
    echo "Error installing Guake Terminal"
    exit 1
fi
echo "## PS: ADD NVM LOADER TO ZSHRC"
echo "DONE"
