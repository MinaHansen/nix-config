#!/bin/bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <host>"
    exit 1
fi

script_dir="$(dirname "$0")"
hosts_dir="$script_dir/hosts"

if [ ! -f "$hosts_dir/$1.nix" ]; then
    echo "Host $1 not found."
    exit 1
fi

if [ ! -f "$hosts_dir/hardware-configuration.nix" ]; then
    echo "Generating hardware configuration..."
    nixos-generate-config --root /mnt --dir "$hosts_dir"
    rm "$hosts_dir/configuration.nix"
    git add "$hosts_dir/hardware-configuration.nix"
    echo "Hardware configuration generated."
fi

if [ ! -d "$script_dir/logs" ]; then
    mkdir $script_dir/logs
fi

if [ ! -f "$script_dir/logs/install.log" ]; then
    touch $script_dir/logs/install.log
fi

echo "Installing NixOS..."
nixos-install --flake $script_dir#$1 |& tee $script_dir/logs/install.log
echo "Install complete."
