#!/bin/bash

# Setup the variables for the logging files

releaseFile=/etc/os-release
logFile=/var/log/updater.log
errorLog=/var/log/updater_errors.log

check_exit_status() {
  if [ $? -ne 0 ]
  then
    echo "An error occurred, please check the $errorLog file."
  fi
}

if grep -q "Arch" $releaseFile
then
  # The host is based on Arch, run the pacman update command
  sudo pacman -Syu 1>>$logFile 2>>$errorLog
  check_exit_status
fi

if grep -q "Ubuntu" $releaseFile || grep -q "Debian" $releaseFile || grep -q "Mint" $releaseFile
then
  # The host is Debian based, run the apt update command
  sudo apt update -y 1>>$logFile 2>>$errorLog
  check_exit_status

  sudo apt dist-upgrade -y 1>>$logFile 2>>$errorLog
  check_exit_status
fi

if grep -q "Cent" $releaseFile || grep -q "Fedora" $releaseFile || grep -q "RHEL" $releaseFile
then
  # The host is RHEL based, run the dnf update command
  sudo dnf update -y 1>>$logFile 2>>$errorLog
  check_exit_statusi

  sudo dnf upgrade -y 1>>$logFile 2>>$errorLog
  check_exit_status
fi
