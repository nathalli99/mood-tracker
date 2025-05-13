CREATE DATABASE moodtracker;
USE moodtracker;

CREATE TABLE users (
idUser INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
email VARCHAR(255) NOT NULL,
senha VARCHAR(255) NOT NULL,
dtCriacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE emotion (
idEmotion INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cor VARCHAR(45) NOT NULL,
descricao VARCHAR(255)
);

CREATE TABLE log (
idLog INT AUTO_INCREMENT,
fkUser INT,
fkEmotion INT,
anotacao VARCHAR(255),
dtRegistro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT pkLog PRIMARY KEY (idLog, fkUser, fkEmotion),
CONSTRAINT fkLogUser FOREIGN KEY (fkUser) REFERENCES users(idUser),
CONSTRAINT fkLogEmotion FOREIGN KEY (fkEmotion) REFERENCES emotion(idEmotion)
);

INSERT INTO emotion VALUES
(DEFAULT, 'alegria', 'FFC75F', ''),
(DEFAULT, 'confiança', '00DA82', ''),
(DEFAULT, 'medo', '008F7A', '' ),
(DEFAULT, 'surpresa', '0081CF', ''),
(DEFAULT, 'tristeza', '845EC2', ''),
(DEFAULT, 'nojo', 'D65DB1', ''),
(DEFAULT, 'raiva', 'FF6F91', ''),
(DEFAULT, 'expectativa', 'F2856D', '');