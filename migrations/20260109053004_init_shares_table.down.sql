-- Migration to drop shares table
DROP INDEX IF EXISTS idx_shares_token;
DROP TABLE IF EXISTS shares;