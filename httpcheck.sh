#!/bin/bash

set -euo pipefail

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <URL>" >&2
    exit 1
fi

url="$1"

code=$(curl -s -o /dev/null -w "%{http_code}" --max-time 5 "$url") || code=000

echo "$url returned $code"

if [[ "$code" =~ ^[23][0-9]{2}$ ]]; then
    exit 0
else
    echo "Error: HTTP request failed or returned an unsuccessful status code." >&2
    exit 1
fi
