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
cp -r $HOME/arch/arch-configs/neofetch $HOME/.config

# Template Files
cp -a $HOME/arch/arch-templates/. $HOME/Templates

# Sample Files
cp $HOME/arch/arch-configs/sample/hack $HOME/.hack
sudo cp $HOME/arch/arch-configs/sample/amogus.cow /usr/share/cows

# System Font
sudo cp -a $HOME/arch/arch-fonts/GoogleSans/GoogleSansOTF/. /usr/share/fonts/OTF

# Apps Theme
cp $HOME/arch/arch-themes/mumble-dark-nowshed.qbtheme $HOME/Documents/Themes

# Shell Theme
sudo cp /usr/share/themes/Materia-dark/gnome-shell/gnome-shell.css /usr/share/themes/Materia-dark/gnome-shell/gnome-shell.css.bak
sudo cp $HOME/arch/arch-shell/gnome-shell.css /usr/share/themes/Materia-dark/gnome-shell
sudo cp /usr/share/gnome-shell/gnome-shell-theme.gresource /usr/share/gnome-shell/gnome-shell-theme.gresource.bak
sudo cp $HOME/arch/arch-shell/gnome-shell-theme.gresource /usr/share/gnome-shell

# GDM Icon & Cursor Theme
sudo cp $HOME/arch/arch-configs/gdm/00_org.gnome.shell.gschema.override /usr/share/glib-2.0/schemas
sudo glib-compile-schemas /usr/share/glib-2.0/schemas

# Activities Icon & GDM Logo
sudo cp $HOME/arch/arch-icons/archlinux-icon.svg /usr/share/icons
sudo cp $HOME/arch/arch-icons/archlinux.svg /usr/share/icons
sudo cp $HOME/arch/arch-configs/gdm/gdm /etc/dconf/profile
sudo mkdir /etc/dconf/db/gdm.d
sudo cp $HOME/arch/arch-configs/gdm/01-logo /etc/dconf/db/gdm.d
sudo dconf update

# Disable Gnome Alert Sound
gsettings set org.gnome.desktop.sound event-sounds false

# Plymouth
sudo cp -r $HOME/arch/arch-plymouth/arch /usr/share/plymouth/themes
sudo plymouth-set-default-theme arch
sudo cp $HOME/arch/arch-configs/mkinitcpio/mkinitcpio.conf /etc
sudo mkinitcpio -p linux

# Grub Theme
sudo cp -r $HOME/arch/arch-grub/ArchLinux /usr/share/grub/themes
sudo cp $HOME/arch/arch-configs/grub/grub /etc/default
sudo grub-mkconfig -o /boot/grub/grub.cfg
