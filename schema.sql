CREATE DATABASE IF NOT EXISTS mensan_society;
USE mensan_society;

-- Users / Members Table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    role ENUM('admin', 'member', 'applicant') DEFAULT 'applicant',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Dynamic Rooms/Sections Table
CREATE TABLE IF NOT EXISTS rooms (
    slug VARCHAR(50) PRIMARY KEY,
    room_number VARCHAR(20) NOT NULL,
    title VARCHAR(150) NOT NULL,
    content TEXT NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Library Books Table
CREATE TABLE IF NOT EXISTS books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Activities Table
CREATE TABLE IF NOT EXISTS activities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Membership Applications Table
CREATE TABLE IF NOT EXISTS applications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    introduction TEXT NOT NULL,
    status ENUM('pending', 'accepted', 'rejected') DEFAULT 'pending',
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample Initial Data
INSERT INTO rooms (slug, room_number, title, content) VALUES
('room-who', '01', 'Who Are the Mensan Elites Society?', '<p>We are a gathering of independent, high-minded individuals who have chosen discipline, clarity, and self-governance over noise and conformity.</p>'),
('room-institute', '02', 'The Mensan Elites Institute', '<p>The Institute is the Society center for learning and exchange where members refine their thinking.</p>'),
('room-vision', '03', 'Our Vision and Goal', '<p>To build a lasting society of self-governed minds.</p>'),
('room-member', '04', 'How to Be a Member', '<p>Membership begins with an introduction short account of who you are.</p>')
ON DUPLICATE KEY UPDATE title=VALUES(title);

INSERT INTO books (title, author, description) VALUES
('The Art of Mindful Governance', 'A. Vance', 'A deep dive into self-governance and conscious decision making.'),
('Cosmic Mindset and Order', 'L. K. Sterling', 'Exploring higher order civility and alignment with universal principles.');

INSERT INTO activities (title, description) VALUES
('Monthly High-Order Dialogue', 'A structured dialogue exploring philosophy, architecture, and technology.'),
('Annual Astral Conclave', 'The main gathering where members meet to share findings and align on core visions.');
