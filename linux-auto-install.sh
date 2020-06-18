#!/bin/bash

echo "*******UPDATING REPOSITORIES*******"
if ! sudo apt-get update
then
    echo "Couldn't update the repos. Check the file /etc/apt/sources.list"
    exit 1
fi
echo "DONE"


echo "*******UPGRADE REPOSITORIES*******"
if ! sudo apt-get dist-upgrade -y
then
    echo "Couldn't upgrade the repos. Check the file /etc/apt/sources.list"
    exit 1
fi
echo "DONE"


echo "*******INSTALLING BATTERY POWER SAVER*******"
if ! sudo apt install tlp tlp-rdw -y && systemctl enable tlp
then
    echo "Error installing battery power saver"
    exit 1
fi
echo "DONE"


echo "*******INSTALLING GNOME TWEAK TOOL*******"
if ! sudo apt install gnome-tweak-tool -y
then
    echo "Error installing Gnome Tweak Tools"
    exit 1
fi
echo "DONE"


echo "*******INSTALLING GIT*******"
if ! sudo apt install git -y
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
if ! sudo apt install guake -y
then
    echo "Error installing Guake Terminal"
    exit 1
fi
echo "DONE"


echo "*******INSTALLING CURL*******"
if ! sudo apt install curl -y
then
    echo "Error installing Guake Terminal"
    exit 1
fi
echo "DONE"


echo "*******INSTALLING VSCODE*******"
if ! snap install --classic code
then
    echo "Error installing VSCode"
    exit 1
fi
echo "DONE"


echo "*******INSTALLING GOOGLE CHROME*******"
if ! wget -P $HOME/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i $HOME/Downloads/google-chrome-stable_current_amd64.deb
then
    echo "Error installing Google Chrome"
    exit 1
fi
echo "DONE"


echo "*******INSTALLING ZSH*******"
if ! sudo apt install zsh -y && chsh -s $(which zsh)
then
    echo "Error installing ZSH"
    exit 1
fi
echo "DONE"


echo "*******INSTALLING OH MY ZSH*******"
if ! sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
then
    echo "Error installing Oh My Zsh"
    exit 1
fi


echo "*******INSTALLING FIRA CODE*******"
if ! sudo apt install fonts-firacode
then
    echo "Error installing Fira Code"
    exit 1
fi
echo "DONE"


echo "*******INSTALLING SPACESHIP OH MY ZSH THEME*******"
if ! git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" && ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
then
    echo "Error installing Spaceship theme for Oh My Zsh"
    exit 1
else
    # Changes the theme on the .zshrc file
    sed -i '/ZSH_THEME="robbyrussell"/c\ZSH_THEME="spaceship"' ~/.zshrc

    # Adding the theme config to the .zshrc file
    echo 'SPACESHIP_PROMPT_ORDER=(
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
    SPACESHIP_CHAR_SUFFIX=" "' >> ~/.zshrc
    echo "DONE"
fi


echo "*******INSTALLING OH MY ZSH PLUGINS*******"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

echo 'zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions' >> ~/.zshrc


echo "*******INSTALLING AND LOADING NVM*******"
if ! curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash && wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash && export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
then
    echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zshrc
    source ~/.zshrc
else
    echo "Error installing NVM"
    exit 1
fi
echo "DONE"


echo "*******INSTALLING NODE JS*******"
if ! nvm install node
then
    echo "Error installing Node JS"
    exit 1
fi
echo "DONE"


echo "*******INSTALLING YARN*******"
if ! curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && sudo apt update && sudo apt install --no-install-recommends yarn -y
then
    echo "Error installing Yarn"
    exit 1
fi
echo "DONE"
