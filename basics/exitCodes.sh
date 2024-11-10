#!/bin/bash

command=htop

if command -v $command
then
  echo "$command is available, let's run it..."
else
  echo "$command is NOT available, let's install it..."
  sudo apt update && sudo apt install -y $command
fi

$command

if [ $? -eq 0 ]
then
  echo "The package was either already available, or installed correctly."
  echo "The command is available here:"
  which $command
else
  echo "$command failed to install"
fi
