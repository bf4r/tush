#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPT_DIR/config.sh

if [ $# -gt 1 ]; then
  module_name=$2
elif [ $# == 1 ]; then
  while true; do
    echo -n "Module name: "
    read module_name
    if [ -z "$module_name" ]; then
      continue
    else
      break
    fi
  done
fi

# Copy template folder
cp -r $TUSH_PATH/templates/module $TUSH_PATH/modules/$module_name

# Convert module name to uppercase with underscores for replacement
MODULE_NAME_UPPER=$(echo $module_name | tr '[:lower:]-' '[:upper:]_')

# Replace placeholders like <<MODULENAME>> and <<MODULENAMEUPPER>> with module-name and MODULE_NAME
find "$TUSH_PATH/modules/$module_name" -type f -exec sed -i "s/<<MODULENAME>>/${module_name}/g" {} \;
find "$TUSH_PATH/modules/$module_name" -type f -exec sed -i "s/<<MODULENAMEUPPER>>/${MODULE_NAME_UPPER}/g" {} \;

echo "Created new module $module_name at $TUSH_PATH/modules/$module_name"
