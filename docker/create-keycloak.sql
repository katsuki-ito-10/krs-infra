-- Keycloak専用ユーザ作成
DO $$
BEGIN
  IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'keycloak') THEN
    CREATE ROLE keycloak LOGIN PASSWORD 'keycloak';
  END IF;
END
$$;

-- Keycloak専用DB作成
DO $$
BEGIN
  IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'keycloak') THEN
    CREATE DATABASE keycloak OWNER keycloak TEMPLATE template0 ENCODING 'UTF8';
  END IF;
END
$$;

-- 権限付与
GRANT CONNECT ON DATABASE keycloak TO keycloak;