#!/bin/bash

set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <disk>"
    exit 1
fi

read -p "Are you sure you want to partition disk: $1" -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
fi

echo "Partitioning disk: $1"
parted -s "$1" mklabel gpt
parted -s "$1" mkpart root btrfs 512MB -8GB
parted -s "$1" mkpart swap linux-swap -8GB 100%
parted -s "$1" set 3 esp on

mkfs.btrfs -L nixos "$1"1
mkswap -L swap "$1"2
mkfs.fat -F 32 -n boot "$1"3

echo "Mounting partitions"
mount "$1"1 /mnt
mkdir -p /mnt/boot
mount "$1"3 /mnt/boot
swapon "$1"2

echo "Done"
