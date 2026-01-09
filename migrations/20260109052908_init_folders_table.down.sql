-- Migration to drop folders table
DROP INDEX IF EXISTS idx_folders_parent;
DROP INDEX IF EXISTS idx_folders_owner;
DROP TABLE IF EXISTS folders;