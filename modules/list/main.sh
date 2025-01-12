#!/usr/bin/env bash
ls -d "$TUSH_PATH/modules/"* | xargs -n1 basename
