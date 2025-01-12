#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $SCRIPT_DIR/setup.sh

# $1 = module name
# everything else = arguments to module
# tush <module_name> <arguments>
interpret() {
  local module_name=$1
  module_file="$TUSH_PATH/modules/$module_name/main.sh"
  if [ -f $module_file ]; then
    # Execute the module script with arguments to tush
    source "$module_file" "$@"
  else
    echo "Unknown module: $1"
  fi
}

# At least 1 argument = interpret the command and exit
if [ $# -gt 0 ]; then
  interpret "$@"
  exit 0
fi

# Main loop if no arguments
while true
do
  echo -n "> "
  read input
  if [ -z "$input" ]; then
    continue
  elif [ "$input" = "exit" ]; then
    break
  fi
  interpret $input
done
