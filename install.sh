#!/bin/sh

# Create Folders
mkdir $HOME/Documents/Projects
mkdir $HOME/Documents/Themes
mkdir $HOME/Pictures/Icons
mkdir $HOME/Pictures/Memes
mkdir $HOME/Pictures/Artworks
mkdir $HOME/Pictures/Wallpapers
mkdir $HOME/Pictures/Screenshots

# Neofetch Config
cp -r $HOME/arch/arch-config/neofetch $HOME/.config

# Template Files
cp -a $HOME/arch/arch-template/. $HOME/Templates

# System Font
sudo cp -a "$HOME/arch/arch-font/Bookerly/." /usr/share/fonts/TTF
sudo cp -a "$HOME/arch/arch-font/Comic Sans/." /usr/share/fonts/TTF
sudo cp -a "$HOME/arch/arch-font/Google Sans (2020)/." /usr/share/fonts/TTF
sudo cp -a "$HOME/arch/arch-font/Google Sans Text (IO 2021)/." /usr/share/fonts/TTF
sudo cp -a "$HOME/arch/arch-font/Gotham/." /usr/share/fonts/TTF
sudo cp -a "$HOME/arch/arch-font/Gotham Rounded/." /usr/share/fonts/TTF
sudo cp -a "$HOME/arch/arch-font/Montserrat/." /usr/share/fonts/TTF
sudo cp -a "$HOME/arch/arch-font/P22Typewriter/." /usr/share/fonts/TTF
sudo cp -a "$HOME/arch/arch-font/TravelingTypewriter/." /usr/share/fonts/TTF

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

# Plymouth
sudo plymouth-set-default-theme archlinux
sudo cp $HOME/arch/arch-config/mkinitcpio/mkinitcpio.conf /etc
sudo mkinitcpio -p linux

# Grub Theme
sudo cp -r $HOME/arch/arch-grub/arch /usr/share/grub/themes
sudo cp $HOME/arch/arch-config/grub/grub /etc/default
sudo grub-mkconfig -o /boot/grub/grub.cfg

# TLP Config
sudo cp $HOME/arch/arch-config/tlp/tlp.conf /etc

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
