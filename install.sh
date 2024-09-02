#!/bin/sh

# Folders
mkdir ~/Archives/
mkdir ~/Games/
mkdir ~/Temps/
mkdir ~/Projects/
mkdir ~/Applications/
mkdir ~/Documents/Ebooks/
mkdir ~/Documents/Books/
mkdir ~/Documents/Journals/
mkdir ~/Documents/Keys/
mkdir ~/Documents/Configs/
mkdir ~/Downloads/Torrents/
mkdir ~/Pictures/Artworks/
mkdir ~/Pictures/Wallpapers/
mkdir ~/Pictures/Memes/
mkdir ~/Pictures/Reacts/

# Environment Variables
sudo sed -i '$a CHROME_EXECUTABLE=/usr/bin/microsoft-edge-stable' /etc/environment
sudo sed -i '$a XCURSOR_THEME=Qogir-cursors' /etc/environment

# Aliases
alias -s lock="xdg-screensaver lock"
alias -s suspend="systemctl suspend"
alias -s update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias -s update-init="sudo mkinitcpio -p linux"
alias -s session-type="echo $XDG_SESSION_TYPE"
alias -s kernel-version="uname -sr"

# Fonts
#sudo unzip "$HOME/arch/fonts/Bookerly.zip" -d /usr/share/fonts/TTF/
sudo unzip "~/arch/fonts/Comic Sans.zip" -d /usr/share/fonts/TTF/
sudo unzip "~/arch/fonts/Google Sans.zip" -d /usr/share/fonts/TTF/
sudo unzip "~/arch/fonts/Google Sans Text.zip" -d /usr/share/fonts/TTF/
sudo unzip "~/arch/fonts/Gotham.zip" -d /usr/share/fonts/TTF/
sudo unzip "~/arch/fonts/Gotham Rounded.zip" -d /usr/share/fonts/TTF/
sudo unzip "~/arch/fonts/Montserrat.zip" -d /usr/share/fonts/TTF/
sudo unzip "~/arch/fonts/P22 Typewriter.zip" -d /usr/share/fonts/TTF/
sudo rm -f "/usr/share/fonts/TTF/Impact.TTF"
sudo unzip "~/arch/fonts/Impact.zip" -d /usr/share/fonts/TTF/

# Helix
sudo mv ~/arch/configs/helix/lldb_dap_rustc_primer.py /usr/local/etc/
cp -r ~/arch/configs/helix/ ~/.config/

# GDM Configs
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface cursor-theme 'Qogir-cursors'
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.sound event-sounds 'false'
sudo -u gdm dbus-launch gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'nothing'
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click 'true'

# Set GNOME Not Responding Timeout
gsettings set org.gnome.mutter check-alive-timeout 10000

# Disable GNOME Extension Version Validation
gsettings set org.gnome.shell disable-extension-version-validation true

# Disable Gnome Alert Sound
gsettings set org.gnome.desktop.sound event-sounds false

# Grub Theme
sudo unzip "~/arch/themes/grub/arch.zip" -d /usr/share/grub/themes/
sudo cp ~/arch/configs/grub/grub /etc/default/
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Plymouth Theme
#sudo unzip "~/arch/themes/plymouth/archlinux.zip" -d /usr/share/plymouth/themes/
sudo cp ~/arch/configs/mkinitcpio/mkinitcpio.conf /etc/
sudo plymouth-set-default-theme -R archlinux

# Pacman Config
sudo cp ~/arch/configs/pacman/pacman.conf /etc/

# zram Config
sudo cp ~/arch/configs/zram/zram-generator.conf /etc/systemd/

# FTP Config
sudo cp ~/arch/configs/ftp/vsftpd.conf /etc/

# Reflector Config
sudo cp ~/arch/configs/reflector/reflector.conf /etc/xdg/reflector/

# Neofetch Config
cp ~/arch/configs/neofetch/config.conf ~/.config/

# mpv Config
cp -r ~/arch/configs/mpv/ ~/.config/

# Template Files
cp -a ~/arch/templates/. ~/Templates/

# Sample Files
cp ~/arch/configs/sample/hack ~/.hack
sudo cp ~/arch/configs/sample/amogus.cow /usr/share/cows/
