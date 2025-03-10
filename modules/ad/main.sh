#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPT_DIR/config.sh

ad_print_random() {
    local -a items=("$@")
    local random_item=${items[$RANDOM % ${#items[@]}]}
    echo "$random_item"
}

action=$2
args=${@:3}

case "$action" in
    "help")
        echo "help: Show this help page"
        echo "go <place>: Go somewhere"
        echo "eat <food>: Eat something"
        echo "say <thing>: Say something"
        echo "sleep: Sleep"
        ;;
    "go")
        echo "Going to $args"
        ;;
    "eat")
        echo "Eating $args"
        ad_print_random "${TUSHM_AD_MESSAGES_EAT[@]}"
        ;;
    "say")
        echo "$TUSHM_AD_USER_NAME: $args"
        ;;
    "sleep")
        ad_print_random "${TUSHM_AD_MESSAGES_SLEEP[@]}"
        echo "* wait $TUSHM_AD_SLEEP_SECONDS seconds *"
        sleep $TUSHM_AD_SLEEP_SECONDS
        ad_print_random "${TUSHM_AD_MESSAGES_WAKEUP[@]}"
        ;;
esac
