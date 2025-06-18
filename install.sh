#!/bin/bash

echo "junyali's dotfiles - hang tight..."

ISARCH=/etc/arch-release
if [ ! -f "$ISARCH" ]; then
  echo -e "junyali's dotfiles is only available for arch releases :(\n"
  exit
fi

read -n1 -rep "would you like to update your system first? (y/n)" UPD
if [[ $UPD == "Y" || $UPD == "y" ]]; then
  sudo pacman -Syu --noconfirm
fi

HASYAY=/sbin/yay
if [ -f "$HASYAY" ]; then
  echo -e "yay found. continuing...\n"
else
  echo -e "yay not found. please install yay first.\n"
fi

read -n1 -rep "would you like to install required packages? (y/n)" INST
if [[ $INST == "Y" || $INST == "y" ]]; then
  # yay installation goes here basically :p (oh boy its gunna be long)
  yay -S --noconfirm zsh fastfetch kitty ttf-jetbrains-mono-nerd

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

  git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git /tmp/pokemon-colorscripts
  cd /tmp/pokemon-colorscripts && sudo ./install.sh

  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  echo "packages have been installed"
fi

read -n1 -rep "would you like to install the double-minegrub menu theme? (y/n)" MGT
if [[ $MGT == "Y" || $MGT == "y" ]]; then
  git clone https://github.com/Lxtharia/double-minegrub-menu.git /tmp/double-minegrub-menu
  cd /tmp/double-minegrub-menu && sudo ./install.sh
fi

read -n1 -rep "would you like to copy config files (WARNING: WILL OVERWRITE EXISTING FILES)? (y/n)" CPC
if [[ $CPC == "Y" || $CPC == "y" ]]; then
  ln -sf ./.config/kitty ~/.config/kitty
  ln -sf ./.config/zsh/.zshrc ~/.zshrc
fi

