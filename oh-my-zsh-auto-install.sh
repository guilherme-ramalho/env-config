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
    echo "Error installing Spaceship theme for Oh My Zsh"
    exit 1
else
    # Changes the theme on the .zshrc file
    sed -i '/ZSH_THEME="robbyrussell"/c\ZSH_THEME="spaceship"' ~/.zshrc
fi

# Theme config
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

# Adding the theme config to the .zshrc file
echo $SPACESHIP_THEME_CONFIG >> ~/.zshrc
echo "DONE"


echo "*******INSTALLING OH MY ZSH PLUGINS*******"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
ZSH_PLUGINS = 'zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions'

echo $ZSH_PLUGINS >> ~/.zshrc
