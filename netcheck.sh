#!/bin/bash

set -euo pipefail

if [[ $# -lt 1 ]]; then
    echo "Error: Please provide a hostname." >&2
    exit 1
fi

host="$1"

if ping -c 1 -W 2 "$host" >/dev/null 2>&1; then
    echo "$host is reachable"
    exit 0
else
    echo "$host is NOT reachable" >&2
    exit 1
fi
