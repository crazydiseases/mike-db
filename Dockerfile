FROM postgres:15-bookworm

COPY 00-auth-schema.sql /docker-entrypoint-initdb.d/00-auth-schema.sql
