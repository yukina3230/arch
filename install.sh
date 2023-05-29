#!/bin/sh

# Create Folders
mkdir $HOME/Documents/Archive/
mkdir $HOME/Documents/Ebooks/
mkdir $HOME/Documents/Journals/
mkdir $HOME/Documents/Projects/
mkdir $HOME/Pictures/Icons/
mkdir $HOME/Pictures/Memes/
mkdir $HOME/Pictures/Artworks/
mkdir $HOME/Pictures/Wallpapers/

# Set Aliases
alias -s lock="xdg-screensaver lock"
alias -s suspend="systemctl suspend"
alias -s update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias -s update-init="sudo mkinitcpio -p linux"
alias -s session-type="echo $XDG_SESSION_TYPE"

# System Fonts
sudo cp -a "$HOME/arch/font/Bookerly/." /usr/share/fonts/TTF/
sudo cp -a "$HOME/arch/font/Comic Sans/." /usr/share/fonts/TTF/
sudo cp -a "$HOME/arch/font/Google Sans (2020)/." /usr/share/fonts/TTF/
sudo cp -a "$HOME/arch/font/Google Sans Text (IO 2021)/." /usr/share/fonts/TTF/
sudo cp -a "$HOME/arch/font/Gotham/." /usr/share/fonts/TTF/
sudo cp -a "$HOME/arch/font/Gotham Rounded/." /usr/share/fonts/TTF/
sudo cp -a "$HOME/arch/font/Montserrat/." /usr/share/fonts/TTF/
sudo cp -a "$HOME/arch/font/P22 Typewriter/." /usr/share/fonts/TTF/

# Activities Icon & GDM Logo
sudo cp $HOME/arch/icon/archlinux-icon.svg /usr/share/icons/
sudo cp $HOME/arch/icon/archlinux.svg /usr/share/icons/
sudo cp $HOME/arch/config/gdm/gdm /etc/dconf/profile/
sudo mkdir /etc/dconf/db/gdm.d/
sudo cp $HOME/arch/config/gdm/01-logo /etc/dconf/db/gdm.d/
sudo dconf update

# Disable GNOME Shell's version check
gsettings set org.gnome.shell disable-extension-version-validation true

# Disable Gnome Alert Sound
gsettings set org.gnome.desktop.sound event-sounds false

# Grub Theme
sudo cp -r $HOME/arch/grub/archlinux/ /usr/share/grub/themes/
sudo cp $HOME/arch/config/grub/grub /etc/default/
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Plymouth Theme
#sudo cp -r $HOME/arch/plymouth/archlinux /usr/share/plymouth/themes/
sudo cp $HOME/arch/config/mkinitcpio/mkinitcpio.conf /etc/
sudo plymouth-set-default-theme -R archlinux

# zram Config
sudo cp $HOME/arch/config/zram/zram-generator.conf /etc/systemd/

# TLP Config
sudo cp $HOME/arch/config/tlp/tlp.conf /etc/

# Reflector Config
sudo cp $HOME/arch/config/reflector/reflector.conf /etc/xdg/reflector/

# Neofetch Config
cp $HOME/arch/config/neofetch/config.conf $HOME/.config/

# mpv Config
cp -r $HOME/arch/config/mpv/ $HOME/.config/

# Template Files
cp -a $HOME/arch/template/. $HOME/Templates/

# Sample Files
cp $HOME/arch/config/sample/hack $HOME/.hack
sudo cp $HOME/arch/config/sample/amogus.cow /usr/share/cows/
