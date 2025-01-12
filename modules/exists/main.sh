#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPT_DIR/config.sh

EXPANDED_PATH=$(eval echo "$2")

if [ -e "$EXPANDED_PATH" ]; then
  echo $TUSHM_EXISTS_YES
else
  echo $TUSHM_EXISTS_NO
fi
