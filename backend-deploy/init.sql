CREATE DATABASE IF NOT EXISTS portfolio_db;
USE portfolio_db;

CREATE TABLE projects (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  tech_stack VARCHAR(255),
  link VARCHAR(255)
);

INSERT INTO projects (title, description, tech_stack, link)
VALUES
('Portfolio Website', 'Personal portfolio built with React, Node, and Docker', 'React, Node.js, Docker', 'https://mahipalgugloth.me'),
('LocalHunt', 'Platform to discover and support local businesses', 'React, Express, MySQL', 'https://localhunt.dev'),
('AI Resume Builder', 'Resume builder using Google Gemini and Vertex AI', 'Next.js, Vertex AI, Firebase', 'https://ai-resume.dev');
