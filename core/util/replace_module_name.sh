#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <module-name>"
    exit 1
fi

MODULE_NAME=$1
# Convert module name to uppercase with underscores
MODULE_NAME_UPPER=$(echo $MODULE_NAME | tr '[:lower:]-' '[:upper:]_')

if [ ! -d "$TUSH_PATH/templates/module" ]; then
    echo "Error: 'module' directory not found"
    exit 1
fi

# Replace placeholders in all files in the module directory
find module -type f -exec sed -i "s/<<MODULENAME>>/${MODULE_NAME}/g" {} \;
find module -type f -exec sed -i "s/<<MODULENAMEUPPER>>/${MODULE_NAME_UPPER}/g" {} \;

echo "Replacement completed successfully"
