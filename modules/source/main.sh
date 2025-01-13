#!/usr/bin/env bash

if [ -z "$2" ]; then
    echo "Usage: $1 input_file"
    exit 1
fi

if [ ! -f "$2" ]; then
    echo "Error: Input file '$2' not found"
    exit 1
fi

while IFS= read -r line; do
    "$TUSH_PATH/tu.sh" "$line"
done < "$2"
