FROM postgres:15-bookworm

COPY 00-auth-schema.sh /docker-entrypoint-initdb.d/00-auth-schema.sh
RUN chmod +x /docker-entrypoint-initdb.d/00-auth-schema.sh

# Generate self-signed SSL certificate for encrypted connections
RUN apt-get update -qq && apt-get install -y openssl && rm -rf /var/lib/apt/lists/* \
    && openssl req -new -x509 -days 3650 -nodes \
       -subj "/CN=mike-db" \
       -keyout /etc/ssl/private/server.key \
       -out /etc/ssl/certs/server.crt \
    && chmod 600 /etc/ssl/private/server.key \
    && chown postgres:postgres /etc/ssl/private/server.key /etc/ssl/certs/server.crt

# Enable SSL via postgres command options
CMD ["postgres", \
     "-c", "ssl=on", \
     "-c", "ssl_cert_file=/etc/ssl/certs/server.crt", \
     "-c", "ssl_key_file=/etc/ssl/private/server.key"]
