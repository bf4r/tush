#!/usr/bin/env bash

if [ "$(tush help > /dev/null)" ]; then
  echo "Success"
else
  echo "Failure"
fi
