#!/bin/sh

# Create Folders
mkdir $HOME/Documents/Archive
mkdir $HOME/Documents/Ebooks
mkdir $HOME/Documents/Journals
mkdir $HOME/Documents/Projects
mkdir $HOME/Pictures/Icons
mkdir $HOME/Pictures/Memes
mkdir $HOME/Pictures/Artworks
mkdir $HOME/Pictures/Wallpapers
mkdir $HOME/Pictures/Screenshots

# System Font
sudo cp -a "$HOME/arch/arch-font/Bookerly/." /usr/share/fonts/TTF
sudo cp -a "$HOME/arch/arch-font/Comic Sans/." /usr/share/fonts/TTF
sudo cp -a "$HOME/arch/arch-font/Google Sans (2020)/." /usr/share/fonts/TTF
sudo cp -a "$HOME/arch/arch-font/Google Sans Text (IO 2021)/." /usr/share/fonts/TTF
sudo cp -a "$HOME/arch/arch-font/Gotham/." /usr/share/fonts/TTF
sudo cp -a "$HOME/arch/arch-font/Gotham Rounded/." /usr/share/fonts/TTF
sudo cp -a "$HOME/arch/arch-font/Montserrat/." /usr/share/fonts/TTF
sudo cp -a "$HOME/arch/arch-font/P22 Typewriter/." /usr/share/fonts/TTF

# Activities Icon & GDM Logo
sudo cp $HOME/arch/arch-icon/archlinux-icon.svg /usr/share/icons
sudo cp $HOME/arch/arch-icon/archlinux.svg /usr/share/icons
sudo cp $HOME/arch/arch-config/gdm/gdm /etc/dconf/profile
sudo mkdir /etc/dconf/db/gdm.d
sudo cp $HOME/arch/arch-config/gdm/01-logo /etc/dconf/db/gdm.d
sudo dconf update

# Disable GNOME Shell's version check
gsettings set org.gnome.shell disable-extension-version-validation true

# Disable Gnome Alert Sound
gsettings set org.gnome.desktop.sound event-sounds false

# Grub Theme
sudo cp -r $HOME/arch/arch-grub/archlinux /usr/share/grub/themes
sudo cp $HOME/arch/arch-config/grub/grub /etc/default
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Plymouth Theme
#sudo cp -r $HOME/arch/arch-plymouth/archlinux /usr/share/plymouth/themes
sudo cp $HOME/arch/arch-config/mkinitcpio/mkinitcpio.conf /etc/mkinitcpio.conf
sudo plymouth-set-default-theme -R archlinux

# Binary Files
# anonfile v1.0.0
cp $HOME/arch/arch-bin/anonfile $HOME/.local/bin

# Neofetch Config
cp $HOME/arch/arch-config/neofetch/config.conf $HOME/.config

# TLP Config
sudo cp $HOME/arch/arch-config/tlp/tlp.conf /etc

# Reflector Config
sudo cp $HOME/arch/arch-config/reflector/reflector.conf /etc/xdg/reflector

# Set Aliases
alias -s lock="xdg-screensaver lock"
alias -s suspend="systemctl suspend"
alias -s update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias -s update-init="sudo mkinitcpio -p linux"

# Template Files
cp -a $HOME/arch/arch-template/. $HOME/Templates

# Sample Files
cp $HOME/arch/arch-config/sample/hack $HOME/.hack
sudo cp $HOME/arch/arch-config/sample/amogus.cow /usr/share/cows
