#!/bin/sh
# Reload nginx every 6 hours to pick up renewed certs

nginx -g "daemon off;" &
NGINX_PID=$!

trap "kill $NGINX_PID; exit" TERM INT

while true; do
    sleep 6h
    echo "Reloading nginx..."
    nginx -s reload
done
