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
