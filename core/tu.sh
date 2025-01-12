#!/usr/bin/env bash
source setup.sh
while true
do
  echo -n "> "
  read input
  source "$TUSH_PATH/modules/$input.sh"
done
