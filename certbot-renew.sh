#!/bin/sh -u
# certbot-renew.sh
# Safe loop to renew certificates every 12 hours

while true; do
    certbot renew \
        --webroot -w /var/www/certbot \
        --verbose \
        --deploy-hook "echo 'Certificate renewed!'"
    sleep 12h
done
