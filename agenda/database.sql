CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL,
    role ENUM('admin', 'leader') NOT NULL DEFAULT 'leader',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS events (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    location VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    leader_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (leader_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Insert default admin user (password: admin)
-- Note: In production, passwords should be hashed. This is a simple MD5 for compatibility/simplicity in this context, 
-- but ideally should use password_hash() in PHP.
INSERT INTO users (username, password, name, role) VALUES 
('admin', 'admin', 'Administrador', 'admin');

CREATE TABLE IF NOT EXISTS departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO departments (name) VALUES 
('Jovens'),
('Desbravadores'),
('Música'),
('Escola Sabatina'),
('Ministério Pessoal'),
('Aventureiros');
