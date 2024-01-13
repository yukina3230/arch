#!/bin/sh

# Folders
mkdir ~/Archives/
mkdir ~/Games/
mkdir ~/Temps/
mkdir ~/Projects/
mkdir ~/Applications/
mkdir ~/Documents/Ebooks/
mkdir ~/Documents/Journals/
mkdir ~/Documents/Novels/
mkdir ~/Documents/Keys/
mkdir ~/Documents/Cookies/
mkdir ~/Downloads/General/
mkdir ~/Downloads/Compressed/
mkdir ~/Downloads/Programs/
mkdir ~/Downloads/Torrents/
mkdir ~/Pictures/Icons/
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

# Activities Icon, GDM Logo & Cursors
#sudo cp ~/arch/icons/archlinux-icon.svg /usr/share/icons/
sudo cp ~/arch/icons/archlinux.svg /usr/share/icons/
sudo cp ~/arch/configs/gdm/gdm /etc/dconf/profile/
sudo mkdir /etc/dconf/db/gdm.d/
sudo cp ~/arch/configs/gdm/01-logo /etc/dconf/db/gdm.d/
sudo dconf update
sudo cp ~/arch/configs/cursors/index.theme /usr/share/icons/default/

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

# TLP Config
sudo cp ~/arch/configs/tlp/tlp.conf /etc/

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
