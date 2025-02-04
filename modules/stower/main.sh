#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$SCRIPT_DIR/config.sh"

if ! command -v stow &> /dev/null; then
    echo "Error: GNU stow is not installed"
    echo "Please install stow to use this script"
    exit 1
fi

if [ $# -ne 2 ]; then
    echo "Error: Please provide an application name"
    echo "Usage: tush stower <appname>"
    exit 1
fi

appname="$2"
config_path="$HOME/.config/$appname"
dots_path="$TUSHM_STOWER_DOTS_DIR/$appname/.config"

if [ ! -d "$config_path" ]; then
    echo "Error: Config directory $config_path does not exist"
    exit 1
fi

if ! mkdir -p "$dots_path"; then
    echo "Error: Failed to create directory $dots_path"
    exit 1
fi

echo "Contents of $config_path:"
ls -la "$config_path"

read -p "Move $config_path to $dots_path? (y/n) " -n 1 -r
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Operation cancelled"
    exit 0
fi

if ! mv "$config_path" "$dots_path"; then
    echo "Error: Failed to move $config_path to $dots_path"
    exit 1
fi

echo "Successfully moved $config_path to $dots_path"

cd "$TUSHM_STOWER_DOTS_DIR" || {
    echo "Error: Failed to change to directory $TUSHM_STOWER_DOTS_DIR"
    exit 1
}

if ! stow "$appname"; then
    echo "Error: Failed to stow $appname"
    exit 1
fi

echo "Successfully stowed $appname"
