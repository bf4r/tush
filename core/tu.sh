#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPT_DIR/setup.sh

aliasify() {
    source "$SCRIPT_DIR/aliases.sh"
    local input="$*"
    local first_word=$(echo "$input" | awk '{print $1}')
    local rest_of_input=$(echo "$input" | awk '{$1=""; print $0}' | sed 's/^ *//')
    
    if [ -z "$input" ]; then
        return
    fi
    
    # Find aliases until none exists
    if [ -n "${aliases[$first_word]}" ]; then
        aliasify "${aliases[$first_word]} $rest_of_input"
    else
        echo "$input"
    fi
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

