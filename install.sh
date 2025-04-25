#!/bin/sh

# Folders
mkdir ~/Archives/
mkdir ~/Games/
mkdir ~/Temps/
mkdir ~/Projects/
mkdir ~/Applications/

# Environment variables
sudo sed -i '$a XCURSOR_THEME=Qogir-cursors' /etc/environment
sudo sed -i '$a EDITOR="/usr/bin/helix"' /etc/environment

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

# Binaries
## puzzles-mines 20241230-1
sudo cp ~/arch/bin/mines/mines /usr/bin/
sudo cp ~/arch/bin/mines/mines.desktop /usr/share/applications/
sudo cp ~/arch/bin/mines/mines.svg /usr/share/pixmaps/

# GDM
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface clock-format '12h'
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface clock-show-weekday 'true'
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface show-battery-percentage 'true'
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface font-antialiasing 'rgba'
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface font-hinting 'full'
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface font-name 'Adwaita Sans 12'
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface document-font-name 'Adwaita Sans 12'
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface monospace-font-name 'Adwaita Mono 12'
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface cursor-theme 'Qogir-cursors'
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click 'true'
sudo -u gdm dbus-launch gsettings set org.gnome.settings-daemon.plugins.media-keys volume-step '5'
sudo -u gdm dbus-launch gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'nothing'

# Grub
#sudo unzip "~/arch/configs/grub/arch-linux.zip" -d /usr/share/grub/themes/
sudo cp ~/arch/configs/grub/grub /etc/default/
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Plymouth
sudo cp ~/arch/configs/plymouth/plymouthd.conf /etc/plymouth/

# Mkinitcpio
sudo cp ~/arch/configs/mkinitcpio/mkinitcpio.conf /etc/
sudo mkinitcpio -p linux

# Reflector
sudo cp ~/arch/configs/reflector/reflector.conf /etc/xdg/reflector/

# Pacman
sudo cp ~/arch/configs/pacman/pacman.conf /etc/

# Paru
cp -r ~/arch/configs/paru/ ~/.config/

# Arch-update
cp -r ~/arch/configs/arch-update/ ~/.config/

# Cargo
cp ~/arch/configs/cargo/config.toml ~/.cargo/

# Xdg-terminal-exec
cp ~/arch/configs/xdg-terminal-exec/xdg-terminals.list ~/.config/

# Alacritty
cp -r ~/arch/configs/alacritty/ ~/.config/

# Zellij
cp -r ~/arch/configs/zellij/ ~/.config/

# Fish
cp -r ~/arch/configs/fish/ ~/.config/

# Yazi
cp -r ~/arch/configs/yazi/ ~/.config/

# Helix
sudo ln -s $(which helix) /usr/bin/hx
sudo cp ~/arch/configs/helix/lldb_dap_rustc_primer.py /usr/local/etc/
cp -r ~/arch/configs/helix/ ~/.config/

# Zed
cp -r ~/arch/configs/zed/ ~/.config/

# Mpv
cp -r ~/arch/configs/mpv/ ~/.config/

# FTP
sudo cp ~/arch/configs/ftp/vsftpd.conf /etc/

# Zram
sudo cp ~/arch/configs/zram/zram-generator.conf /etc/systemd/

# Cursors theme
sudo cp ~/arch/configs/theme/index.theme /usr/share/icons/default/

# Templates
cp -a ~/arch/templates/. ~/Templates/
