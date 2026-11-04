#!/bin/bash
set -euo pipefail

if [[ -z "${1:-}" ]]; then
    echo "Usage: $0 <name>" >&2
    exit 1
fi

echo "Hello, $1!"
