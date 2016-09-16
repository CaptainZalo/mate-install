#!/bin/bash
# Old installscript
# sudo apt-get install mate-desktop-environment-extras
# Install packages without dialogs
sudo apt-get install --no-install-recommends mate-desktop-environment mate-desktop-environment-extra mate-archive-keyring caja-gksu caja-sendto mate-indicator-applet mate-media-gstreamer mate-icon-theme-faenza
# Remove substituted packages
sudo apt-get remove gcalctool gnome-screenshot gedit file-roller eog gnome-system-monitor gnome-system-log baobab gnome-terminal gnome-applets gnome-media gnome-power-manager gnome-screensaver
# Set default desktop for new users
sudo /usr/lib/lightdm/lightdm-set-defaults -s mate
# Change MIME types
# Folders:
xdg-mime default caja-folder-handler.desktop inode/directory
# SSH sites:
xdg-mime default caja-folder-handler.desktop x-scheme-handler/ssh
# FTP sites:
xdg-mime default caja-folder-handler.desktop x-scheme-handler/ftp
# Images:
xdg-mime default eom.desktop image/bmp
xdg-mime default eom.desktop image/gif
xdg-mime default eom.desktop image/jpeg
xdg-mime default eom.desktop image/x-pcx
xdg-mime default eom.desktop image/png
xdg-mime default eom.desktop image/tiff
# Plain text:
xdg-mime default pluma.desktop text/plain
xdg-mime default pluma.desktop text/x-log
xdg-mime default pluma.desktop application/x-perl
xdg-mime default pluma.desktop application/javascript
xdg-mime default pluma.desktop application/rdf+xml
# If you want for Wine plain text files:
xdg-mime default pluma.desktop application/x-wine-extension-ini
xdg-mime default pluma.desktop application/x-wine-extension-vbs
xdg-mime default pluma.desktop text/x-csrc
xdg-mime default pluma.desktop application/x-wine-extension-inf
# PDF:
xdg-mime default atril.desktop application/pdf
# Change default terminal emulator appli
update-alternatives --install "$(which x-terminal-emulator)" x-terminal-emulator "$(which mate-terminal)" 30
update-alternatives --set x-terminal-emulator "$(which mate-terminal)"
