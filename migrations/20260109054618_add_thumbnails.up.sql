CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TYPE thumbnail_size AS ENUM ('small', 'medium', 'large', 'original');

CREATE TABLE thumbnails (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    file_id UUID NOT NULL,
    size thumbnail_size NOT NULL,
    storage_path VARCHAR(1000) NOT NULL,
    width INTEGER,
    height INTEGER,
    size_bytes BIGINT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    FOREIGN KEY (file_id) REFERENCES files(id) ON DELETE CASCADE,
    UNIQUE(file_id, size)
);

CREATE INDEX idx_thumbnails_file ON thumbnails(file_id);