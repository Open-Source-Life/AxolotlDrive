CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE profile_pictures (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL UNIQUE,
    file_id UUID NOT NULL,
    storage_path VARCHAR(1000) NOT NULL,
    storage_type VARCHAR(20) DEFAULT 'local',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (file_id) REFERENCES files(id) ON DELETE CASCADE
);