#!/bin/sh
# certbot-renew.sh
# Safe loop to renew certificates every 12 hours

trap exit TERM

while true; do
    echo "Running certbot renew..."
    certbot renew --webroot -w /var/www/certbot --verbose --deploy-hook "echo 'Certificate renewed!'"
    sleep 12h &
    wait $!
done
