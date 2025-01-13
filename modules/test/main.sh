#!/usr/bin/env bash

if [ $# == 2 ]; then
  test_script_path="$TUSH_PATH/modules/$2/test.sh"
  chmod 755 "$test_script_path"
  $test_script_path > /dev/null
  exit_code="$?"
  if [ "$exit_code" == 0 ]; then
    echo "Success ($exit_code)"
  else
    echo "Failure ($exit_code)"
  fi
else
  echo "Wrong number of arguments."
fi
