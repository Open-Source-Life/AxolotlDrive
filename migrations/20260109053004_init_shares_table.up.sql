CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE shares (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    object_id UUID NOT NULL,
    object_type VARCHAR(50) NOT NULL,
    token VARCHAR(255) UNIQUE NOT NULL,
    permission VARCHAR(50) NOT NULL,
    shared_by_id UUID,
    shared_with_id UUID,
    expires_at TIMESTAMP WITH TIME ZONE,
    max_downloads INTEGER,
    current_downloads INTEGER DEFAULT 0,
    password_hash VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    deleted_at TIMESTAMP WITH TIME ZONE,
    FOREIGN KEY (shared_by_id) REFERENCES users(id),
    FOREIGN KEY (shared_with_id) REFERENCES users(id)
);

CREATE INDEX idx_shares_token ON shares(token);
CREATE INDEX idx_shares_expires ON shares(expires_at);