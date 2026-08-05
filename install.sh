#!/bin/bash

set -euo pipefail

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <host>"
    exit 1
fi

script_dir="$(dirname "$0")"

if [ ! -d "$script_dir/logs" ]; then
    mkdir $script_dir/logs
fi

if [ ! -f "$script_dir/logs/install.log" ]; then
    touch $script_dir/logs/install.log
fi

echo "Installing NixOS..."
nixos-install --flake $script_dir#$1 |& tee $script_dir/logs/install.log
echo "Install complete."
