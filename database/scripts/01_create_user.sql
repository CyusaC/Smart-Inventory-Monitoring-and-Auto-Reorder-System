-- =====================================
-- 01_create_user.sql
-- =====================================

CREATE USER smart_inventory
IDENTIFIED BY smartinventory
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON users;

GRANT CONNECT, RESOURCE TO smart_inventory;
GRANT CREATE VIEW, CREATE SEQUENCE, CREATE PROCEDURE, CREATE TRIGGER TO smart_inventory;
