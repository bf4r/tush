#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPT_DIR/setup.sh

aliasify() {
    source $SCRIPT_DIR/aliases.sh
    local cmd="${@:1}"
    local last_cmd=""
    
    # Keep replacing aliases until no more changes occur
    while [ "$cmd" != "$last_cmd" ]; do
        last_cmd="$cmd"
        
        local first_word=$(echo "$cmd" | awk '{print $1}')
        local remaining=$(echo "$cmd" | cut -d' ' -f2- )
        
        if [ "${aliases[$first_word]}" ]; then
            if [ -n "$remaining" ]; then
                cmd="${aliases[$first_word]}"
            fi
        fi
    done
    
    echo "$cmd"
}

# $1 = module name
# everything else = arguments to module
# tush <module_name> <arguments>
interpret() {
    # First expand any aliases
    local input="$*"
    local expanded_input=$(aliasify "$input")
    # Then process the module
    local module_name=$(echo "$expanded_input" | awk '{print $1}')
    local module_file="$TUSH_PATH/modules/$module_name/main.sh"
    
    if [ -f "$module_file" ]; then
        # Execute the module script with expanded arguments
        source "$module_file" $expanded_input
    else
        echo "Unknown module: $module_name"
    fi
}

# At least 1 argument = interpret the command and exit
if [ $# -gt 0 ]; then
    interpret "$@"
    exit 0
fi

# Main loop if no arguments
while true
do
    echo -n "> "
    read input
    if [ -z "$input" ]; then
        continue
    elif [ "$input" = "exit" ]; then
        break
    fi
    interpret $input
done

