#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TUSH_PATH="$SCRIPT_DIR/../.."
if [ "$($TUSH_PATH/tu.sh bash echo hi)" == "hi" ]; then
  exit 0
else
  exit 1
fi
