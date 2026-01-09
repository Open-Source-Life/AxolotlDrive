-- Migration to create security_questions table
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE security_questions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL,
    question VARCHAR(500) NOT NULL,
    answer_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE UNIQUE INDEX uq_security_questions_user ON security_questions(user_id, question);