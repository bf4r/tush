#!/usr/bin/env bash

if [ $# == 2 ]; then
  test_script_path="$TUSH_PATH/modules/$2/test.sh"
  chmod 755 "$test_script_path"
  $test_script_path > /dev/null
  exit_code="$?"
  if [ "$exit_code" == 0 ]; then
    echo "Success"
  else
    echo "Failure"
  fi
else
  echo "Too many arguments."
fi
