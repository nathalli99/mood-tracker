CREATE DATABASE moodtracker;
USE moodtracker;

CREATE TABLE users (
  idUser INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
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
  intensidade TINYINT NOT NULL CHECK (intensidade BETWEEN 1 AND 5),
  dtRegistro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT pkLog PRIMARY KEY (idLog, fkUser, fkEmotion),
  CONSTRAINT fkLogUser FOREIGN KEY (fkUser) REFERENCES users(idUser),
  CONSTRAINT fkLogEmotion FOREIGN KEY (fkEmotion) REFERENCES emotion(idEmotion)
);

INSERT INTO users (nome, email, senha) VALUES
('Nathalli', 'nathalli@email.com', 'Abracadabra9');

INSERT INTO emotion VALUES
(DEFAULT, 'Alegria', '#FFC75F', 'É quando nos sentimos bem, satisfeitos e felizes com nós mesmos ou com o que vivemos.'),
(DEFAULT, 'Confiança', '#00DA82', 'Quando acreditamos que algo ou alguém é seguro e que não vai nos causar mal.'),
(DEFAULT, 'Medo', '#008F7A', 'Sensação de insegurança ou receio diante de algo que pode nos machucar.'),
(DEFAULT, 'Surpresa', '#0081CF', 'Reação que temos quando algo inesperado acontece.'),
(DEFAULT, 'Tristeza', '#845EC2', 'Sensação de desânimo ou perda. Pode ser causada por algo ruim ou por uma falta.'),
(DEFAULT, 'Nojo', '#D65DB1', 'Rejeição ou vontade de evitar algo ou alguém que nos incomoda.'),
(DEFAULT, 'Raiva', '#FF6F91', 'É quando nos sentimos irritados ou ofendidos, principalmente se achamos que foi de propósito.'),
(DEFAULT, 'Antecipação', '#F2856D', 'Expectativa que criamos antes de algo acontecer, com base no que sabemos ou já vivemos.');

INSERT INTO log (fkUser, fkEmotion, intensidade, dtRegistro) VALUES
(1, 6, 3, '2025-04-01 09:10:00'),
(1, 7, 4, '2025-04-02 10:15:00'),
(1, 3, 4, '2025-04-03 08:45:00'),
(1, 3, 5, '2025-04-04 09:00:00'),
(1, 8, 3, '2025-04-05 11:00:00'),
(1, 8, 2, '2025-04-06 14:25:00'),
(1, 5, 4, '2025-04-07 13:00:00'),
(1, 6, 3, '2025-04-08 16:00:00'),
(1, 1, 4, '2025-04-09 18:30:00'),
(1, 2, 4, '2025-04-10 19:40:00'),
(1, 4, 3, '2025-04-11 08:20:00'),
(1, 5, 2, '2025-04-12 09:00:00'),
(1, 3, 3, '2025-04-13 07:55:00'),
(1, 1, 5, '2025-04-14 09:05:00'),
(1, 2, 5, '2025-04-15 11:10:00'),
(1, 4, 4, '2025-04-16 12:00:00'),
(1, 5, 4, '2025-04-17 13:15:00'),
(1, 6, 3, '2025-04-18 14:10:00'),
(1, 7, 5, '2025-04-19 15:30:00'),
(1, 8, 3, '2025-04-20 16:00:00'),
(1, 1, 5, '2025-04-21 09:30:00'),
(1, 2, 4, '2025-04-22 10:00:00'),
(1, 4, 4, '2025-04-23 11:45:00'),
(1, 5, 3, '2025-04-24 12:20:00'),
(1, 6, 4, '2025-04-25 14:00:00'),
(1, 7, 4, '2025-04-26 15:10:00'),
(1, 8, 3, '2025-04-27 16:20:00'),
(1, 1, 5, '2025-04-28 17:30:00'),
(1, 2, 4, '2025-04-29 18:40:00'),
(1, 3, 4, '2025-04-30 19:00:00');

SHOW TABLES;

SELECT * FROM users;
SELECT * FROM emotion;
SELECT * FROM log;

SELECT u.nome AS Usuário,
    l.dtRegistro AS Dataa,
	e.nome AS Emoção
FROM log AS l
JOIN users AS u
ON l.fkUser = u.idUser
JOIN emotion AS e
ON l.fkEmotion = e.idEmotion;

SELECT 
    e.nome AS emocao,
    ROUND(AVG(l.intensidade), 2) AS media_intensidade
FROM log l
JOIN emotion e ON l.fkEmotion = e.idEmotion
WHERE l.fkUser = 1
GROUP BY e.nome
ORDER BY media_intensidade DESC;

SELECT 
    e.nome AS emocao,
    COUNT(*) AS total
FROM log l
JOIN emotion e ON l.fkEmotion = e.idEmotion
WHERE l.fkUser = 1
  AND MONTH(l.dtRegistro) = MONTH(NOW())
  AND YEAR(l.dtRegistro) = YEAR(NOW())
GROUP BY e.nome;

CREATE VIEW vw_log_dia AS
SELECT 
    l.idLog,
    u.nome AS usuario,
    e.nome AS emocao,
    l.intensidade,
    l.dtRegistro,
    CASE WEEKDAY(l.dtRegistro)
        WHEN 0 THEN 'Segunda-feira'
        WHEN 1 THEN 'Terça-feira'
        WHEN 2 THEN 'Quarta-feira'
        WHEN 3 THEN 'Quinta-feira'
        WHEN 4 THEN 'Sexta-feira'
        WHEN 5 THEN 'Sábado'
        WHEN 6 THEN 'Domingo'
    END AS diaSemana
FROM log AS l
JOIN users AS u ON l.fkUser = u.idUser
JOIN emotion AS e ON l.fkEmotion = e.idEmotion;

SELECT * FROM vw_log_dia;
