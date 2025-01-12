#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $SCRIPT_DIR/setup.sh

while true
do
  echo -n "> "
  read input
  module_file="$TUSH_PATH/modules/$input.sh"
  if [ -f $module_file ]; then
    source $module_file
  else
    echo "Unknown: $input"
  fi
done
