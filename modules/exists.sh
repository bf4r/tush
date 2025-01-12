#!/usr/bin/env bash
source $TUSH_CONFIG_PATH/exists/config.sh
if [ -e "$2" ]; then
  echo $TUSHM_EXISTS_YES
else
  echo $TUSHM_EXISTS_NO
fi
