#!/bin/sh

# Create Folders
mkdir $HOME/Documents/Cookies
mkdir $HOME/Documents/Docs
mkdir $HOME/Documents/Keys
mkdir $HOME/Documents/Projects
mkdir $HOME/Documents/Themes
mkdir $HOME/Pictures/Artworks
mkdir $HOME/Pictures/Icons
mkdir $HOME/Pictures/Memes
mkdir $HOME/Pictures/Screenshots
mkdir $HOME/Pictures/Wallpapers

# Neofetch Config
cp -r $HOME/arch/arch-config/neofetch $HOME/.config

# Template Files
cp -a $HOME/arch/arch-template/. $HOME/Templates

# System Font
sudo cp -a "$HOME/arch/arch-font/Google Sans (2020)/." /usr/share/fonts/OTF
sudo cp -a "$HOME/arch/arch-font/Google Sans Text (IO 2021)/." /usr/share/fonts/OTF

# Apps Theme
cp $HOME/arch/arch-theme/mumble-dark-nowshed.qbtheme $HOME/Documents/Themes

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

# Change Dock Icon Size
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 55

# Plymouth
sudo cp -r $HOME/arch/arch-plymouth/arch /usr/share/plymouth/themes
sudo plymouth-set-default-theme arch
sudo cp $HOME/arch/arch-config/mkinitcpio/mkinitcpio.conf /etc
sudo mkinitcpio -p linux

# Grub Theme
sudo cp -r $HOME/arch/arch-grub/ArchLinux /usr/share/grub/themes
sudo cp $HOME/arch/arch-config/grub/grub /etc/default
sudo grub-mkconfig -o /boot/grub/grub.cfg

# TLP Config
sudo cp $HOME/arch/arch-config/tlp/tlp.conf /etc

# Binaries
#5/10/21
sudo cp $HOME/arch/arch-bin/rx /usr/bin
#8/3/21
sudo cp $HOME/arch/arch-bin/4chan /usr/bin
#27/9/21
sudo cp $HOME/arch/arch-bin/mon /usr/bin

# Set Aliases
alias lock "xdg-screensaver lock"
funcsave lock
alias suspend "systemctl suspend"
funcsave suspend
alias update-grub "grub-mkconfig -o /boot/grub/grub.cfg"
funcsave update-grub
alias update-init "mkinitcpio -p linux"
funcsave update-init

# Sample Files
cp $HOME/arch/arch-config/sample/hack $HOME/.hack
sudo cp $HOME/arch/arch-config/sample/amogus.cow /usr/share/cows
