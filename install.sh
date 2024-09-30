#!/bin/sh

# Folders
mkdir ~/Archives/
mkdir ~/Games/
mkdir ~/Temps/
mkdir ~/Projects/
mkdir ~/Applications/

# Environment variables
sudo sed -i '$a XCURSOR_THEME=Qogir-cursors' /etc/environment

# Aliases
alias -s lock="xdg-screensaver lock"
alias -s logout="gnome-session-quit --logout --no-prompt"
alias -s suspend="systemctl suspend"

# Fonts
#sudo unzip "$HOME/arch/fonts/Bookerly.zip" -d /usr/share/fonts/TTF/
sudo unzip "~/arch/fonts/Comic Sans.zip" -d /usr/share/fonts/TTF/
sudo unzip "~/arch/fonts/Google Sans.zip" -d /usr/share/fonts/TTF/
sudo unzip "~/arch/fonts/Google Sans Text.zip" -d /usr/share/fonts/TTF/
sudo unzip "~/arch/fonts/Gotham.zip" -d /usr/share/fonts/TTF/
sudo unzip "~/arch/fonts/Gotham Rounded.zip" -d /usr/share/fonts/TTF/
sudo unzip "~/arch/fonts/Montserrat.zip" -d /usr/share/fonts/TTF/
sudo unzip "~/arch/fonts/P22 Typewriter.zip" -d /usr/share/fonts/TTF/
#sudo rm -f "/usr/share/fonts/TTF/Impact.TTF"
#sudo unzip "~/arch/fonts/Impact.zip" -d /usr/share/fonts/TTF/

# GDM
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface font-name 'Inter 12'
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface cursor-theme 'Qogir-cursors'
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.sound event-sounds 'false'
sudo -u gdm dbus-launch gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'nothing'
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click 'true'

# Set Gnome not responding timeout
gsettings set org.gnome.mutter check-alive-timeout 10000

# Disable Gnome Alert Sound
gsettings set org.gnome.desktop.sound event-sounds false

# Grub
#sudo unzip "~/arch/themes/grub/arch-linux.zip" -d /usr/share/grub/themes/
sudo cp ~/arch/configs/grub/grub /etc/default/
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Plymouth
#sudo unzip "~/arch/themes/plymouth/archlinux.zip" -d /usr/share/plymouth/themes/
sudo cp ~/arch/configs/mkinitcpio/mkinitcpio.conf /etc/
sudo plymouth-set-default-theme -R archlinux

# Reflector
sudo cp ~/arch/configs/reflector/reflector.conf /etc/xdg/reflector/

# Pacman
sudo cp ~/arch/configs/pacman/pacman.conf /etc/

# Paru
cp -r ~/arch/configs/paru/ ~/.config/

# Helix
sudo cp ~/arch/configs/helix/lldb_dap_rustc_primer.py /usr/local/etc/
cp -r ~/arch/configs/helix/ ~/.config/

# Mpv
cp -r ~/arch/configs/mpv/ ~/.config/

# FTP
sudo cp ~/arch/configs/ftp/vsftpd.conf /etc/

# Zram
sudo cp ~/arch/configs/zram/zram-generator.conf /etc/systemd/

# Templates
cp -a ~/arch/templates/. ~/Templates/

# Samples
cp ~/arch/samples/hack ~/.hack
sudo cp ~/arch/samples/amogus.cow /usr/share/cowsay/cows/
