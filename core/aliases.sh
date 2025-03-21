#!/usr/bin/env bash
declare -A aliases=(
    ["clear"]="bash clear"
    ["c"]="clear"
    ["run"]="bash"
    ["exec"]="bash"
    ["exe"]="bash"
    ["wipe"]="clear"
    ["w"]="wipe"
    ["cmds"]="list"
    ["aliasesf"]="bash $EDITOR $TUSH_PATH/core/aliases.sh"
    ["alsf"]="aliasesf"
    ["print"]="bash echo"
    ["newm"]="new-module"
    ["als"]="aliases"
)
