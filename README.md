# tush
Tush is a modular CLI multitool written fully in bash.

## Quickstart
1. Install [git](https://git-scm.com/downloads/linux) (you might have it already)
2. Install [bash](https://www.gnu.org/software/bash/) (you probably have it)
3. Run the following in your Linux terminal to install tush:
```bash
git clone https://github.com/bf4r/tush
cd tush
echo "alias tush='$(pwd)/tu.sh" >> ~/.bashrc
source ~/.bashrc
tush
```
To use it again later, use `tush` for interactive mode or `tush <command>` for one-time use.

## Quick note
You can move the created `tush` directory wherever you want.

Feel free to explore the modules directory to see what is being run.

## Help
Inside tush interactive mode **or** prefixed with `tush`, you can run:
- `list` to see a list of modules
- `help` to see a list with short descriptions of what they do
- `help <command>` to see the full help page for a command

## About

### Purpose
- Centralizing bash scripts
- Having one place to execute them like commands
- Pulling your own repo with your own modules to easily and instantly having them again anywhere you want

## Compatibility and requirements
Runs on Linux-based operating systems with `bash` installed. Tested on NixOS.
Install dependencies of individual modules.
Dependencies (outside of Bash and GNU coreutils) for each module are listed in `deps.txt` inside the module folder. (e.g. [/modules/llm/deps.txt](https://github.com/bf4r/tush/tree/master/modules/llm/deps.txt))
If the deps.txt file doesn't exist, no dependencies other than bash and GNU coreutils are required.

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
