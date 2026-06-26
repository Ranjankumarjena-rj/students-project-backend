-- Run this on your MySQL server before deploying the app

CREATE DATABASE IF NOT EXISTS studentsdb;

USE studentsdb;

CREATE TABLE IF NOT EXISTS students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    course VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample data
INSERT INTO students (name, email, phone, course) VALUES
('Rajan Kumar', 'rajan@example.com', '9876543210', 'Computer Science'),
('Priya Sharma', 'priya@example.com', '9123456789', 'Information Technology'),
('Amit Patel', 'amit@example.com', '9988776655', 'MBA');
