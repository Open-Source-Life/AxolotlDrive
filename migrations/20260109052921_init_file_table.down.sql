-- Migration to drop files table
DROP INDEX IF EXISTS idx_files_folder;
DROP INDEX IF EXISTS idx_files_owner;
DROP TABLE IF EXISTS files;