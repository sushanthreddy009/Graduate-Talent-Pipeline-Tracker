CREATE DATABASE IF NOT EXISTS mthree_tracker;
USE mthree_tracker;

CREATE TABLE graduates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    domain VARCHAR(50),
    cohort VARCHAR(50),
    college VARCHAR(100),
    gender VARCHAR(10),
    join_date DATE
);

CREATE TABLE certifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    grad_id INT,
    cert_name VARCHAR(100),
    platform VARCHAR(50),
    date_completed DATE,
    is_verified TINYINT(1),
    FOREIGN KEY (grad_id) REFERENCES graduates(id)
);

CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    grad_id INT,
    title VARCHAR(100),
    description TEXT,
    technologies VARCHAR(255),
    duration VARCHAR(50),
    completion_date DATE,
    complexity INT,
    score INT,
    FOREIGN KEY (grad_id) REFERENCES graduates(id)
);

CREATE TABLE performance_reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    grad_id INT,
    reviewer_name VARCHAR(100),
    rating INT,
    feedback TEXT,
    review_date DATE,
    sentiment_tag VARCHAR(20),
    FOREIGN KEY (grad_id) REFERENCES graduates(id)
);

CREATE TABLE engagement (
    id INT AUTO_INCREMENT PRIMARY KEY,
    grad_id INT,
    week_no INT,
    attendance_percent INT,
    doubts_asked INT,
    doubts_answered INT,
    activity_level VARCHAR(20),
    activeness_rating FLOAT,
    FOREIGN KEY (grad_id) REFERENCES graduates(id)
);

CREATE TABLE readiness_scores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    grad_id INT,
    score DECIMAL(5,2),
    recommendation TEXT,
    generated_on DATE,
    FOREIGN KEY (grad_id) REFERENCES graduates(id)
);
