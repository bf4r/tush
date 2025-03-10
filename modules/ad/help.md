# ad
Text adventure game.

## Usage
```bash
ad <action> [args]
```

## Example
```bash
ad help
```

## Configuration
```bash
# Array of string messages to print when going to sleep
TUSHM_AD_MESSAGES_SLEEP=("Good night!" "Sweet dreams!")
# Array of string messages to print when waking up
TUSHM_AD_MESSAGES_WAKEUP=("Rise and shine!" "Hello, World!")
# Array of string messages to print when eating food
TUSHM_AD_MESSAGES_EAT=("Yum yum" "Mmm...")
# How long to sleep for each time
TUSHM_AD_SLEEP_SECONDS=20
# The name of the user, printed when saying things
TUSHM_AD_USER_NAME=""
```
