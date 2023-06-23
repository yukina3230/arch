#!/bin/sh

# Folders
mkdir $HOME/Archives/
mkdir $HOME/Games/
mkdir $HOME/Temps/
mkdir $HOME/Projects/
mkdir $HOME/Applications/
mkdir $HOME/Documents/Ebooks/
mkdir $HOME/Documents/Journals/
mkdir $HOME/Documents/Novels/
mkdir $HOME/Documents/Keys/
mkdir $HOME/Documents/Cookies/
mkdir $HOME/Downloads/General/
mkdir $HOME/Downloads/Compressed/
mkdir $HOME/Downloads/Programs/
mkdir $HOME/Downloads/Torrents/
mkdir $HOME/Pictures/Icons/
mkdir $HOME/Pictures/Artworks/
mkdir $HOME/Pictures/Wallpapers/
mkdir $HOME/Pictures/Memes/
mkdir $HOME/Pictures/Reacts/

# Aliases
alias -s lock="xdg-screensaver lock"
alias -s suspend="systemctl suspend"
alias -s update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias -s update-init="sudo mkinitcpio -p linux"
alias -s session-type="echo $XDG_SESSION_TYPE"

# Fonts
#sudo unzip "$HOME/arch/fonts/Bookerly.zip" -d /usr/share/fonts/TTF/
sudo unzip "$HOME/arch/fonts/Comic Sans.zip" -d /usr/share/fonts/TTF/
sudo unzip "$HOME/arch/fonts/Google Sans.zip" -d /usr/share/fonts/TTF/
sudo unzip "$HOME/arch/fonts/Google Sans Text.zip" -d /usr/share/fonts/TTF/
sudo unzip "$HOME/arch/fonts/Gotham.zip" -d /usr/share/fonts/TTF/
sudo unzip "$HOME/arch/fonts/Gotham Rounded.zip" -d /usr/share/fonts/TTF/
sudo unzip "$HOME/arch/fonts/Montserrat.zip" -d /usr/share/fonts/TTF/
sudo unzip "$HOME/arch/fonts/P22 Typewriter.zip" -d /usr/share/fonts/TTF/
sudo rm -f "/usr/share/fonts/TTF/Impact.TTF"
sudo unzip "$HOME/arch/fonts/Impact.zip" -d /usr/share/fonts/TTF/

# Activities Icon, GDM Logo & Cursors
sudo cp $HOME/arch/icons/archlinux-icon.svg /usr/share/icons/
sudo cp $HOME/arch/icons/archlinux.svg /usr/share/icons/
sudo cp $HOME/arch/configs/gdm/gdm /etc/dconf/profile/
sudo mkdir /etc/dconf/db/gdm.d/
sudo cp $HOME/arch/configs/gdm/01-logo /etc/dconf/db/gdm.d/
sudo dconf update
sudo cp $HOME/arch/configs/cursors/index.theme /usr/share/icons/default/

# Set GNOME Not Responding Timeout
gsettings set org.gnome.mutter check-alive-timeout 10000

# Disable GNOME Extension Version Validation
gsettings set org.gnome.shell disable-extension-version-validation true

# Disable Gnome Alert Sound
gsettings set org.gnome.desktop.sound event-sounds false

# Grub Theme
sudo unzip "$HOME/arch/themes/grub/arch.zip" -d /usr/share/grub/themes/
sudo cp $HOME/arch/configs/grub/grub /etc/default/
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Plymouth Theme
#sudo unzip "$HOME/arch/themes/plymouth/archlinux.zip" -d /usr/share/plymouth/themes/
sudo cp $HOME/arch/configs/mkinitcpio/mkinitcpio.conf /etc/
sudo plymouth-set-default-theme -R archlinux

# Pacman Config
sudo cp $HOME/arch/configs/pacman/pacman.conf /etc/

# zram Config
sudo cp $HOME/arch/configs/zram/zram-generator.conf /etc/systemd/

# TLP Config
sudo cp $HOME/arch/configs/tlp/tlp.conf /etc/

# Reflector Config
sudo cp $HOME/arch/configs/reflector/reflector.conf /etc/xdg/reflector/

# Neofetch Config
cp $HOME/arch/configs/neofetch/config.conf $HOME/.config/

# mpv Config
cp -r $HOME/arch/configs/mpv/ $HOME/.config/

# Template Files
cp -a $HOME/arch/templates/. $HOME/Templates/

# Sample Files
cp $HOME/arch/configs/sample/hack $HOME/.hack
sudo cp $HOME/arch/configs/sample/amogus.cow /usr/share/cows/
