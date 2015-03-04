DROP DATABASE IF EXISTS Inquiro;
CREATE DATABASE Inquiro
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'C'
       LC_CTYPE = 'C'
       CONNECTION LIMIT = -1;
GRANT CONNECT, TEMPORARY ON DATABASE Inquiro TO public;

