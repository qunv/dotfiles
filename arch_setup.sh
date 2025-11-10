#!/usr/bin/env bash

# -----------------------------------------------------
# Arch Linux setup script by Quan
# - Installs essential tools
# - Sets up zsh plugins and dotfiles
# - Ignores all errors (keeps going)
# -----------------------------------------------------

set +e
LOGFILE="$HOME/arch_setup.log"
exec > >(tee -a "$LOGFILE") 2>&1

# Colors
GREEN="\033[1;32m"
RED="\033[1;31m"
BLUE="\033[1;34m"
YELLOW="\033[1;33m"
RESET="\033[0m"

echo -e "${BLUE}=== Arch Linux setup started at $(date) ===${RESET}"

# Helper function to run commands with feedback
run() {
    echo -e "\n${BLUE}>>> $*${RESET}"
    if "$@"; then
        echo -e "${GREEN}✓ Success:${RESET} $*"
    else
        echo -e "${YELLOW}⚠️  Failed (ignored):${RESET} $*"
    fi
}

# --- Install packages ---
PKGS=(
    bat
    jq
    fzf
    tree
    vim
    nvim
    htop
    xorg-xmodmap
    tmux
    zsh
    alacritty
    jetbrains-toolbox
    ttf-nerd-fonts-symbols
    google-chrome
    jdk-openjdk
    maven
)

echo -e "\n${BLUE}>>> Installing packages...${RESET}"
for pkg in "${PKGS[@]}"; do
    run yay -S --noconfirm --needed "$pkg"
done

# --- Setup Zsh plugins ---
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
mkdir -p "$ZSH_CUSTOM/plugins"

echo -e "\n${BLUE}>>> Installing Zsh plugins...${RESET}"
run git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
run git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
run git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git "$ZSH_CUSTOM/plugins/zsh-autocomplete"

# --- Clone dotfiles ---
echo -e "\n${BLUE}>>> Cloning dotfiles...${RESET}"
run git clone https://github.com/qunv/dotfiles.git

# --- Copy configs ---
echo -e "\n${BLUE}>>> Copying config files...${RESET}"
run cp -r \
  dotfiles/.Xmodmap \
  dotfiles/.xprofile \
  dotfiles/.bash_alias \
  dotfiles/.gitconfig \
  dotfiles/.ideavimrc \
  dotfiles/.myfzf \
  dotfiles/.tmux.conf \
  dotfiles/.vimrc \
  dotfiles/.zshrc \
  "$HOME"

# create this packages if os does not has it
mkdir -p ~/.config
run cp -r \
  dotfiles/.config/alacritty \
  dotfiles/.config/rofi \
  ~/.config/

# apply new config in zsh
source ~/.zshrc


#Setup NvChad
echo -e "\n${BLUE}>>> Setup NvChad...${RESET}"
run git clone https://github.com/NvChad/starter ~/.config/nvim

# generated a ssh key if not exists
KEY_PATH="$HOME/.ssh/id_rsa"
if [ ! -f "$KEY_PATH" ]; then
    echo "SSH key not found. Generating a new one..."
    ssh-keygen -t rsa -b 4096 -N "" -f "$KEY_PATH"
    echo "New SSH key generated."
else
    echo "SSH key already exists. Doing nothing."
fi

echo -e "\n${GREEN}=== ✅ Setup completed successfully! ===${RESET}"
echo -e "📜 Log saved at: ${YELLOW}$LOGFILE${RESET}"

