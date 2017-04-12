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
sudo apt-get -y install mate-desktop-environment-extras caja-gksu caja-sendto mate-indicator-applet mate-icon-theme-faenza
# Remove substituted packages (commented out)
# sudo apt-get -y remove gcalctool gnome-screenshot gedit file-roller eog gnome-system-monitor gnome-system-log baobab gnome-terminal gnome-applets gnome-media gnome-power-manager gnome-screensaver
# Set default desktop for new users (fails)
# sudo /usr/lib/lightdm/lightdm-set-defaults -s mate
# Change MIME types and terminal emulator
# Folders:
sudo xdg-mime default caja-folder-handler.desktop inode/directory
# SSH sites:
sudo xdg-mime default caja-folder-handler.desktop x-scheme-handler/ssh
# FTP sites:
sudo xdg-mime default caja-folder-handler.desktop x-scheme-handler/ftp
# Images:
sudo xdg-mime default eom.desktop image/bmp
sudo xdg-mime default eom.desktop image/gif
sudo xdg-mime default eom.desktop image/jpeg
sudo xdg-mime default eom.desktop image/x-pcx
sudo xdg-mime default eom.desktop image/png
sudo xdg-mime default eom.desktop image/tiff
# Plain text:
sudo xdg-mime default pluma.desktop text/plain
sudo xdg-mime default pluma.desktop text/x-log
sudo xdg-mime default pluma.desktop application/x-perl
sudo xdg-mime default pluma.desktop application/javascript
sudo xdg-mime default pluma.desktop application/rdf+xml
# Wine plain text files:
sudo xdg-mime default pluma.desktop application/x-wine-extension-ini
sudo xdg-mime default pluma.desktop application/x-wine-extension-vbs
sudo xdg-mime default pluma.desktop text/x-csrc
sudo xdg-mime default pluma.desktop application/x-wine-extension-inf
# PDF:
sudo xdg-mime default atril.desktop application/pdf
# Default terminal emulator app:
sudo update-alternatives --install "$(which x-terminal-emulator)" x-terminal-emulator "$(which mate-terminal)" 30
sudo update-alternatives --set x-terminal-emulator "$(which mate-terminal)"
