#!/bin/bash

releaseFile=/etc/os-release

if grep -q "Arch" $releaseFile
then
  # The host is based on Arch, run the pacman update command
  sudo pacman -Syu
fi

if grep -q "Ubuntu" $releaseFile || grep -q "Debian" $releaseFile || grep -q "Mint" $releaseFile
then
  # The host is Debian based, run the apt update command
  sudo apt update
  sudo apt dist-upgrade
fi

if grep -q "Cent" $releaseFile || grep -q "Fedora" $releaseFile || grep -q "RHEL" $releaseFile
then
  # The host is RHEL based, run the dnf update command
  sudo dnf update
  sudo dnf upgrade
fi
