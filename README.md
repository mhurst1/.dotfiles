# My Dotfiles
These are my dotfile configuration files for different software in Bash.

## .nanorc
This is my custom .nanorc configuration for Nano.

## .bashrc
This is my custom .bashrc configuration for Bash.

This file contains custom settings for Bash shell, including: 
- Aliases for frequently used commands such as `cdd` (for `cd ..`), `lsa` (for `ls -A`), and others to enhance command-line efficiency.
- Environment variables for tools and libraries.
- Custom prompts and bash functions for creating tarballs or extracting them.
- Sourcing additional files, like the `.bashrc custom` file, to apply specific environment settings when starting new terminal sessions.

### ./bin/linux.sh
This script automates several setup tasks. It checks the operating system type and ensures that it's `Linux`. If it's not, the script logs an error and exits. It also creates a `.TRASH` directory in the home directory if it doesn't already exist, backs up any existing `.nanorc` file, and sets up a new `.nanorc` configuration by copying the contents of `./etc/nanorc`. Additionally, it adds a line to source the `bashrc custom` file in the user's `.bashrc`.

### ./bin/cleanup.sh
This script is meant to reverse the changes made by `linux.sh`. It does the following:
- Removes the `.nanorc` file from the home directory.
- Removes the line `source ~/.dotfiles/etc/bashrc custom` from the `.bashrc` file using the `sed` command.
- Deletes the `.TRASH` directory from the home directory.

This script ensures that any modifications made by the `linux.sh` script can be undone if necessary.

### ./Makefile
The Makefile automates the execution of tasks related to this repository. It contains two targets:
- **linux**: Runs the `./bin/linux.sh` script. This target is dependent on the `clean` target, which means it will first execute any cleanup steps before performing the setup tasks.
- **clean**: Runs the `./bin/cleanup.sh` script, which undoes the changes made by `linux.sh`.
