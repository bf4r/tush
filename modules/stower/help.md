# stower
Safely moves application config directories to a dots directory, creates the necessary structure, and stows them.

## Usage
```bash
stower <appname>
```

## Description
Takes an application name and:
1. Checks if GNU stow is installed
2. Creates ~/.dots/<appname> directory structure
3. Moves ~/.config/<appname> to ~/.dots/<appname>/.config/<appname>
4. Shows contents and asks for confirmation before moving
5. Runs stow to create the symlinks

## Requirements
- GNU stow must be installed

## Configuration
```bash
# The base directory for storing dotfiles
TUSHM_STOWER_DOTS_DIR="$HOME/.dots"
```
