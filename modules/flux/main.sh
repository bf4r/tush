#!/usr/bin/env bash

source "$(dirname "$0")/config.sh"

if [ -z "$TUSHM_FLUX_API_KEY" ]; then
    echo "Error: API token not set in config.sh"
    exit 1
fi

mkdir -p "$TUSHM_FLUX_SAVE_PATH"

timestamp=$(date +%Y%m%d_%H%M%S)

# Make API request
response=$(curl --silent --show-error https://api.replicate.com/v1/models/black-forest-labs/flux-schnell/predictions \
    --request POST \
    --header "Authorization: Bearer $TUSHM_FLUX_API_KEY" \
    --header "Content-Type: application/json" \
    --header "Prefer: wait" \
    --data '{
        "input": {
            "prompt": "black forest gateau cake spelling out the words \"FLUX SCHNELL\", tasty, food photography, dynamic shot"
        }
    }')

image_url=$(echo "$response" | jq -r '.output[0]')

if [ -z "$image_url" ] || [ "$image_url" = "null" ]; then
    echo "Error: Failed to generate image"
    echo "API Response: $response"
    exit 1
fi

output_file="$TUSHM_FLUX_SAVE_PATH/flux_$timestamp.png"
curl --silent --show-error "$image_url" --output "$output_file"

if [ $? -eq 0 ]; then
    echo "Image saved to: $output_file"
else
    echo "Error: Failed to download image"
    exit 1
fi
