#!/usr/bin/env bash
if [ $# == 1 ]; then
  # Display a list of modules with the second line of their help.md (short description)
  temp_file=$(mktemp)
  for dir in "$TUSH_PATH/modules"/*; do
      if [ -d "$dir" ]; then
          module_name=$(basename "$dir")
          if [ -f "$dir/help.md" ]; then
              # Extract second line and remove leading/trailing whitespace
              description=$(sed -n '2p' "$dir/help.md" | sed 's/^[ \t]*//;s/[ \t]*$//')
              # Write to temporary file
              echo "$module_name - $description" >> "$temp_file"
          fi
      fi
  done
  sort "$temp_file"
  rm "$temp_file"
fi
if [ $# == 2 ]; then
  cat "$TUSH_PATH/modules/$2/help.md"
fi

