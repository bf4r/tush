#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $SCRIPT_DIR/../../core/aliases.sh

for key in "${!aliases[@]}"; do
    echo "$key -> ${aliases[$key]}"
done
