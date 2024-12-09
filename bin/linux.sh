#!/bin/bash

#To check if the opperating system in linux
if [ "$(uname)" != "Linux" ]; then
	echo "Error. This script is designed to run with linux only." >> linuxsetup.log
	exit 1
fi

#Check the .TRASH directory
TRASH_DIR="$HOME/.TRASH"
if [ ! -d "$TRASH_DIR" ]; then
	mkdir "$TRASH_DIR"
	echo "Created $TRASH_DIR directory." >> linuxsetup.log
fi

#Check the .nanorc file
NANORC_FILE="$HOME/.nanorc"
if [ -f "$NANORC_FILE" ]; then
	mv "$NANORC_FILE" "$HOME/.bup_nanorc"
	echo "Renamed existing .nanorc to .bup_nanorc." >> linuxsetup.log
fi

#Overwrite the contents of etc/nanorc
DOTFILES_ETC="$HOME/.dotfiles"
if [ -f "$DOTFILES_ETC/.nanorc" ]; then
	cat "$DOTFILES_ETC/.nanorc" > "$NANORC_FILE"
	echo "Copied contents of $DOTFILES_ETC/.nanorc to $NANORC_FILE." >> linuxsetup.log 
else
	echo "Error: $DOTFILES_ETC/.nanorc not found." >> linuxsetup.log
	exit 1
fi

# Add statement for custom source command
BASHRC_FILE="$HOME/.bashrc"
CUSTOM_SOURCE="source /acct/mrhurst/.dotfiles/etc/bashrc_custom"
if ! grep -Fxq "$CUSTOM_SOURCE" "$BASHRC_FILE"; then
	echo "$CUSTOM_SOURCE" >> "$BASHRC_FILE"
	echo "Appended custom source command to $BASHRC_FILE." >> linuxsetup.log
fi

