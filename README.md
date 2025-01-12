# tush
Tush is a modular CLI multitool written fully in bash.
## About

### Why?
I'm learning git and bash, so I'm remaking an old project.

### Purpose
- Centralizing bash scripts
- Having one place to execute them like commands
- Pulling your own repo with your own modules to easily and instantly having them again anywhere you want

## Compatibility and requirements
Runs on UNIX-like operating system with `bash` installed. Tested on NixOS.
Install dependencies of individual modules. A system for installing module dependencies is coming soon.
For now, you have to check which dependencies the module needs.

The base program does not have any dependencies besides [bash](https://www.gnu.org/software/bash/) and the [GNU coreutils](https://www.gnu.org/software/coreutils/). These are pre-installed on distributions of GNU/Linux.

## Installation
1. Clone the repository
```bash
# First change to a directory where you want the tush folder to be
# cd Downloads
# Clone the repository
git clone https://github.com/bf4r/tush
# Change into the tush directory
cd tush
```

2. Try tu.sh
```bash
# Executes the tu.sh script
./tu.sh
```
Exit with Ctrl+C or whatever terminates the program on your setup.

3. Setting up `tush` command alias
To use tush like `tush <input>` instead of `/path/to/tu.sh <input>`, add this line to your .bashrc or .zshrc or similar:
```bash
# Sets an alias in your shell so you can do tush <command> while you're in it
alias tush='~/Downloads/tush/tu.sh'
```
Replace ~/Downloads/tush with the path to your tush folder (the folder containing the tush repository).

## Usage
```bash
# One-time command execution
tush <module> <arguments>
```
or just:
```bash
# This will open tush in interactive mode
tush
```
