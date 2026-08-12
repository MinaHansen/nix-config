#!/bin/bash

script_dir="$(dirname "$0")"

cp -rpf "$script_dir/assets/hypr" ~/.config/
cp -rpf "$script_dir/assets/kitty" ~/.config/
cp -rpf "$script_dir/assets/fish" ~/.config/

hyprctl reload
