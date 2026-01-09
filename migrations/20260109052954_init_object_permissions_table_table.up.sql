CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TYPE object_type AS ENUM ('file', 'folder');
CREATE TYPE permission_type AS ENUM ('read', 'write', 'owner');

CREATE TABLE object_permissions (
    user_id UUID,
    object_id UUID NOT NULL,
    object_type object_type NOT NULL,
    permission permission_type NOT NULL,
    granted_by UUID,
    granted_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    expires_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    PRIMARY KEY (user_id, object_id, object_type),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (granted_by) REFERENCES users(id)
);

CREATE INDEX idx_object_permissions_user ON object_permissions(user_id);
CREATE INDEX idx_object_permissions_object ON object_permissions(object_id);