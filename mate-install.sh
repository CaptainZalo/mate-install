#!/bin/bash
# Installer script v0.1. Intended for Debian ARM-based SoC-distribution and GIRL v9.5.0. http://girl.software
# Check if Synaptic packagemanager is installed.
set -e
if ! hash apt-get 2>/dev/null; then
        echo "Sorry. This script requires a distribution with Synaptic package manager (Debian distributions)."
        exit 1
fi
# Check if script is ran in root context.
if [ "$(id -u)" -ne "0" ]; then
        echo "This script requires root."
        exit 1
fi
# Update repositories.
sudo apt-get -y update
# sudo apt-get install mate-desktop-environment-extras
# Install packages without dialogs
sudo apt-get -y install --no-install-recommends mate-desktop-environment-extras mate-archive-keyring caja-gksu caja-sendto mate-indicator-applet mate-media-gstreamer mate-icon-theme-faenza
# Remove substituted packages
sudo apt-get -y remove gcalctool gnome-screenshot gedit file-roller eog gnome-system-monitor gnome-system-log baobab gnome-terminal gnome-applets gnome-media gnome-power-manager gnome-screensaver
# Set default desktop for new users (fails)
# sudo /usr/lib/lightdm/lightdm-set-defaults -s mate
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
sudo update-alternatives --install "$(which x-terminal-emulator)" x-terminal-emulator "$(which mate-terminal)" 30
sudo update-alternatives --set x-terminal-emulator "$(which mate-terminal)"
