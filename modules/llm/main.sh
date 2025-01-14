#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPT_DIR/config.sh # Remove these 2 lines if you don't have a config.sh
AI_PROMPT="${@:2}"

if [[ ! -v AI_API_KEY ]]; then
  echo "Set the variable \$AI_API_KEY to your OpenAI-compatible API's API key to use the llm module."
  echo "You also need jq if you haven't already installed it."
  exit 1
fi

AI_RESPONSE=$(
  curl -s https://openrouter.ai/api/v1/chat/completions \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $AI_API_KEY" \
    -d "{
    \"model\": \"$TUSHM_LLM_MODEL\",
    \"messages\": [
      {
        \"role\": \"user\",
        \"content\": \"$AI_PROMPT\"
      }
    ]
  }"
)
echo "$AI_RESPONSE" | jq -r '.choices[0].message.content'
