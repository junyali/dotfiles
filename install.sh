#!/bin/bash

echo "junyali's dotfiles - hang tight..."

ISARCH=/etc/arch-release
if not [ -f "$ISARCH" ]; then
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
  yay
else
  echo -e "yay not found. please install yay first.\n"
fi

read -n1 -rep "wuld you like to install required packages? (y/n)" INST
if [[ $INST == "Y" || $INST == "y" ]]; then
  # yay installation goes here basically :p (oh boy its gunna be long)

  echo "packages have been installed"
fi
