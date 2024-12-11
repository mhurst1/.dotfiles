#!/bin/bash
# Remove the .nanorc file
rm -f ~/.nanorc

# Remove the line from .bashrc that sources bashrc_custom
sed -i '/source ~\/.dotfiles\/etc\/bashrc_custom/d' ~/.bashrc

# Remove the .TRASH directory
rm -rf ~/.TRASH

