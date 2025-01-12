#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPT_DIR/config.sh

if [ $# == 1 ]; then
  printf "%-20s %s\n" "MODULE" "STATUS"
  printf "%-20s %s\n" "------" "------"
  
  for module in $(ls -d "$TUSH_PATH/modules"/* | sort); do
    if [ -d "$module" ]; then
      module_name=$(basename "$module")
      test_script_path="$module/test.sh"
      if [ -f "$test_script_path" ]; then
        chmod 755 "$test_script_path"
        $test_script_path > /dev/null
        exit_code="$?"
        if [ "$exit_code" == 0 ]; then
          printf "%-20s %s\n" "$module_name" "Success"
        else
          printf "%-20s %s\n" "$module_name" "Failure"
        fi
      elif [ "$TUSHM_TESTALL_WARNING_MISSING_FILE" ]; then
        printf "%-20s %s\n" "$module_name" "Missing test.sh!"
      fi
    fi
  done
fi

