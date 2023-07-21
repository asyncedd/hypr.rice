#!/bin/bash

CONFIG_FILES="$HOME/.config/waybar/config.jsonc $HOME/.config/waybar/style.css"

trap "killall waybar" EXIT

while true; do
    waybar --config ~/.config/waybar/config.jsonc --style ~/.config/waybar/style.css&
    inotifywait -e create,modify $CONFIG_FILES
    killall waybar
done
