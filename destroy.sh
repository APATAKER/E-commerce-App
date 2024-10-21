#!/bin/sh
containers=$(docker ps -aq)

if [ -z "$containers" ]; then
    echo "No containers found to clean up"
    exit 0
else
    echo "Found containers, proceeding with cleanup..."
    echo "$containers" | xargs docker stop
    echo "$containers" | xargs docker rm
    echo "Cleanup complete"
fi
