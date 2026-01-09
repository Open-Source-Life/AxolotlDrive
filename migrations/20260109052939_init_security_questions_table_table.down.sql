-- Migration to drop security_questions table
DROP INDEX IF EXISTS uq_security_questions_user;
DROP TABLE IF EXISTS security_questions;