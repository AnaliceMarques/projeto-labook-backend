-- Active: 1682998351265@@127.0.0.1@3306

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL, 
    password TEXT NOT NULL,
    role TEXT NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL
);

INSERT INTO users (id, name, email, password, role)
VALUES
  -- tipo NORMAL e senha = joao123
	('u001', 'João', 'joão@email.com', '$2a$12$PjTGJscEb11/USRs3EIjQ.8h9eUvImB.MzGs2KtAF7K6llyfiY/5q', 'NORMAL'),

  -- tipo NORMAL e senha = maria123
	('u002', 'Maria', 'maria@email.com', '$2a$12$udqtqCxbTL0qnT3wxScd8Oj1CoN5Q5Pz8jWVFm.6V9loY8Kyl0csW', 'NORMAL'),

  -- tipo ADMIN e senha = 123456
	('u003', 'José', 'jose@email.com', '$2a$12$PUKHsLIJ2LHvzXRIZw5Yb./TJ5wMb7vKNHjQSpMb7aeVYdeGCGpta', 'ADMIN');

CREATE TABLE posts (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    creator_id TEXT NOT NULL,
    content TEXT NOT NULL,
    likes INTEGER DEFAULT (0) NOT NULL,
    dislikes INTEGER DEFAULT (0) NOT NULL,
    creates_at TEXT DEFAULT (DATETIME()) NOT NULL,
    updated_at TEXT DEFAULT (DATETIME()) NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

INSERT INTO posts (id, creator_id, content)
VALUES
    ('p001', 'u001', 'Sextou!'),
    ('p002', 'u002', 'Tudo posso naquele que me fortalece.');

CREATE TABLE likes_dislikes (
    user_id TEXT NOT NULL,
    post_id TEXT NOT NULL,
    like INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posts(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

INSERT INTO likes_dislikes (user_id, post_id, like)
VALUES
    ('u002', 'p001', 1),
    ('u003', 'p001', 1),
    ('u001', 'p002', 1),
    ('u003', 'p001', 0);

UPDATE posts
SET likes = 2, dislikes = 1
WHERE id = 'p001';

UPDATE posts
SET likes = 1
WHERE id = 'p002';




--Queries de deleção abaixo
DROP TABLE likes_dislikes;
DROP TABLE posts;
DROP TABLE users;