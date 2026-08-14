#!/bin/bash
set -euo pipefail

BASE_URL="http://127.0.0.1/cafe"

retry_curl() {
    local path="$1"
    local url="${BASE_URL}${path}"

    for attempt in $(seq 1 12); do
        echo "Checking ${url}, attempt ${attempt}/12"

        if curl --fail --silent --show-error \
            --max-time 10 \
            "${url}" \
            > /dev/null; then
            return 0
        fi

        sleep 5
    done

    echo "Validation failed: ${url}"
    return 1
}

retry_curl "/health.php"
retry_curl "/"
retry_curl "/menu.php"
retry_curl "/orderHistory.php"

echo "Deployment validation passed"
curl --fail --silent "${BASE_URL}/version.php"
echo
