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

echo "*******INSTALLING OH MY ZSH*******"
if ! sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
then
    echo "Error installing Oh My Zsh"
    exit 1
fi

read -p "You need to install FiraCode. Type 'y' once It's installed (y/n)?" FC_CONFIRM
if [ "$FC_CONFIRM" = "y" ]; 
then
    echo "Continuing...";
else
    echo "Please install Fira Code to proceed. (https://github.com/tonsky/FiraCode/releases)";
    exit 1
fi

echo "DONE"


echo "*******INSTALLING SPACESHIP OH MY ZSH THEME*******"
if ! git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" && ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
then
    echo "Error installing Guake Terminal"
    exit 1
fi
echo "DONE"


read -p "You need to change the theme on .zshrc to 'spaceship'. Type 'y' once you're done (y/n)?" SPC_THEME_CONFIRM
if [ "$SPC_THEME_CONFIRM" = "y" ]; 
then
    echo "Continuing...";
else
    echo "Please change the .zshrc theme to spaceship";
    exit 1
fi

SPACESHIP_THEME_CONFIG = 'SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "'


echo $SPACESHIP_THEME_CONFIG >> ~/.zshrc

echo "*******INSTALLING OH MY ZSH PLUGINS*******"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
ZSH_PLUGINS = 'zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions'

echo $ZSH_PLUGINS >> ~/.zshrc


#echo "*******INSTALLING AND LOADING NVM*******"
#if ! curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash && wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash && export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
#then
#    echo "Error installing Guake Terminal"
#    exit 1
#fi
#echo "## PS: ADD NVM LOADER TO ZSHRC"
#echo "DONE"
