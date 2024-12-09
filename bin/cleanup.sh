#!/bin/bash

rm -f ~/.nanorc

sed -i '/source ~\/\.dotfiles\/etc\/bashrc custom/d' ~/.bashrc

rm -rf ~/.TRASH
