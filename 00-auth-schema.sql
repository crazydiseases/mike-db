-- Create auth schema and extensions that GoTrue expects
CREATE SCHEMA IF NOT EXISTS auth;
CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- GoTrue will run its own migrations to create auth tables,
-- but it needs the schema to exist first.
