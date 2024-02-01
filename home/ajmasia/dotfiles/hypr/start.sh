!#/usr/bin env bash

swww init &

# set wallpaper
swww img ~/.local/share/wallpapers/001_sonoma-macos.jpeg &

# lauch waybar
$HOME/.config/waybar/launch &

# lauch gammastep
gammastep-indicator &

udiskie --smart-tray &
