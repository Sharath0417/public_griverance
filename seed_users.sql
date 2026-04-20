-- Insert Departments
INSERT INTO departments (dept_name, description)
VALUES (
        'Roads & Transport',
        'Maintenance of roads, street lights, and transport services'
    ),
    (
        'Water Supply',
        'Water connection, supply issues, and pipeline maintenance'
    ),
    (
        'Sanitation',
        'Garbage collection, sewage, and cleanliness'
    ),
    (
        'Electricity',
        'Power supply, meter issues, and street lighting'
    ) ON CONFLICT (dept_name) DO NOTHING;
-- Insert admin user (password: admin)
INSERT INTO users (
        email,
        full_name,
        password_hash,
        role,
        created_at,
        updated_at
    )
VALUES (
        'admin@example.com',
        'Admin User',
        '$2a$10$slYQmyNdGzin7olVG0zu2OPST9EwkIDANxHVvfNdR.v7kfz3AwPJa',
        'ADMIN',
        NOW(),
        NOW()
    ) ON CONFLICT (email) DO NOTHING;
-- Insert regular user (password: user)
INSERT INTO users (
        email,
        full_name,
        password_hash,
        role,
        created_at,
        updated_at
    )
VALUES (
        'user@example.com',
        'Test User',
        '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWDeYo5LH2DyWN0q',
        'CITIZEN',
        NOW(),
        NOW()
    ) ON CONFLICT (email) DO NOTHING;