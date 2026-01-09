CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TYPE activity_type AS ENUM ('file_upload', 'file_download', 'file_delete', 'file_share', 'folder_create', 'folder_delete', 'login', 'logout', 'profile_update');

CREATE TABLE activity_logs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL,
    activity_type activity_type NOT NULL,
    object_id UUID,
    object_type VARCHAR(50),
    ip_address INET,
    user_agent TEXT,
    metadata JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE INDEX idx_activity_logs_user ON activity_logs(user_id);
CREATE INDEX idx_activity_logs_type ON activity_logs(activity_type);
CREATE INDEX idx_activity_logs_created_at ON activity_logs(created_at);