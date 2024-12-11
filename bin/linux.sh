#!/bin/bash
# Check if OS is Linux
if [[ "$(uname)" != "Linux" ]]; then
  echo "Error: Not a Linux system" >> linuxsetup.log
  exit 1
fi

# Create the .TRASH directory if it doesn't exist
mkdir -p ~/.TRASH

# Backup current .nanorc if it exists
if [[ -f ~/.nanorc ]]; then
  mv ~/.nanorc ~/.bup_nano
  echo ".nanorc file renamed to .bup_nano" >> linuxsetup.log
fi

# Copy the custom nanorc to home directory
cp ./etc/.nanorc ~/.nanorc

# Modify .bashrc to source bashrc custom file
echo 'source ~/.dotfiles/etc/bashrc_custom' >> ~/.bashrc

