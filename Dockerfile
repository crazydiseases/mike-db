FROM supabase/postgres:15.8.1.060

COPY mike_schema.sql /docker-entrypoint-initdb.d/99-mike-schema.sql
