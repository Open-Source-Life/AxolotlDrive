CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TYPE storage_type AS ENUM ('s3', 'local');

CREATE TABLE files (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    owner_id UUID NOT NULL,
    disk_id UUID UNIQUE NOT NULL,
    folder_id UUID,
    name VARCHAR(255) NOT NULL,
    size_bytes BIGINT NOT NULL,
    original_size_bytes BIGINT,
    mime VARCHAR(255),
    content_type VARCHAR(255),
    checksum VARCHAR(255),
    storage_type storage_type DEFAULT 'local',
    storage_path VARCHAR(1000) NOT NULL,
    bucket_name VARCHAR(255),
    region VARCHAR(100),
    encrypted_file_key BYTEA NOT NULL,
    file_key_nonce BYTEA NOT NULL,
    encryption_algorithm VARCHAR(50) DEFAULT 'AES-256-GCM',
    compression_type VARCHAR(20) DEFAULT 'none',
    is_compressed BOOLEAN DEFAULT FALSE,
    version INTEGER DEFAULT 1,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE,
    deleted_at TIMESTAMP WITH TIME ZONE,
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (folder_id) REFERENCES folders(id)
);

CREATE INDEX idx_files_owner ON files(owner_id);
CREATE INDEX idx_files_folder ON files(folder_id);
CREATE INDEX idx_files_storage_type ON files(storage_type);
CREATE INDEX idx_files_owner_storage ON files(owner_id, storage_type);