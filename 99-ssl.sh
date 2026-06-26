#!/bin/bash
set -e
cat >> "$PGDATA/postgresql.conf" << EOF
ssl = on
ssl_cert_file = '/etc/ssl/certs/server.crt'
ssl_key_file = '/etc/ssl/private/server.key'
EOF
echo "SSL configuration written to $PGDATA/postgresql.conf"
