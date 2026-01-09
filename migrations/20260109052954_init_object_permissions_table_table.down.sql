-- Migration to drop object_permissions table
DROP TABLE IF EXISTS object_permissions;
DROP TYPE IF EXISTS permission_type;
DROP TYPE IF EXISTS object_type;