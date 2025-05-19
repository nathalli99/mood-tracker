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
diaSemana VARCHAR(45),
anotacao VARCHAR(255),
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

INSERT INTO log (fkUser, fkEmotion, anotacao, intensidade, diaSemana, dtRegistro) VALUES
(1, 6, 'Tive vontade de evitar algo ou alguém.', 3, 'Terça-feira', '2025-04-01 09:10:00'),
(1, 7, 'Fiquei irritado com uma situação no trabalho.', 4, 'Quarta-feira', '2025-04-02 10:15:00'),
(1, 3, 'Fiquei com medo de dar algo errado.', 4, 'Quinta-feira', '2025-04-03 08:45:00'),
(1, 3, 'Ansiedade com o futuro.', 5, 'Sexta-feira', '2025-04-04 09:00:00'),
(1, 8, 'Fiquei com expectativa sobre um evento.', 3, 'Sábado', '2025-04-05 11:00:00'),
(1, 8, 'Pensei no que pode acontecer.', 2, 'Domingo', '2025-04-06 14:25:00'),
(1, 5, 'Senti saudade e tristeza.', 4, 'Segunda-feira', '2025-04-07 13:00:00'),
(1, 6, 'Evitei falar com alguém.', 3, 'Terça-feira', '2025-04-08 16:00:00'),
(1, 1, 'Me senti bem comigo mesmo.', 4, 'Quarta-feira', '2025-04-09 18:30:00'),
(1, 2, 'Confiei no meu julgamento.', 4, 'Quinta-feira', '2025-04-10 19:40:00'),
(1, 4, 'Fui surpreendido por uma notícia.', 3, 'Sexta-feira', '2025-04-11 08:20:00'),
(1, 5, 'Fiquei desanimado com o clima.', 2, 'Sábado', '2025-04-12 09:00:00'),
(1, 3, 'Tive receio de como seria meu dia.', 3, 'Domingo', '2025-04-13 07:55:00'),
(1, 1, 'Me senti muito alegre pela manhã.', 5, 'Segunda-feira', '2025-04-14 09:05:00'),
(1, 2, 'Confiança nas minhas escolhas.', 5, 'Terça-feira', '2025-04-15 11:10:00'),
(1, 4, 'Surpresa com um convite inesperado.', 4, 'Quarta-feira', '2025-04-16 12:00:00'),
(1, 5, 'Senti tristeza por estar sozinho.', 4, 'Quinta-feira', '2025-04-17 13:15:00'),
(1, 6, 'Desconforto com o ambiente.', 3, 'Sexta-feira', '2025-04-18 14:10:00'),
(1, 7, 'Raiva por um atraso injusto.', 5, 'Sábado', '2025-04-19 15:30:00'),
(1, 8, 'Antecipei possíveis problemas.', 3, 'Domingo', '2025-04-20 16:00:00'),
(1, 1, 'Dia produtivo e feliz.', 5, 'Segunda-feira', '2025-04-21 09:30:00'),
(1, 2, 'Senti segurança no que fiz.', 4, 'Terça-feira', '2025-04-22 10:00:00'),
(1, 4, 'Surpresa agradável ao reencontrar alguém.', 4, 'Quarta-feira', '2025-04-23 11:45:00'),
(1, 5, 'Lembranças me deixaram triste.', 3, 'Quinta-feira', '2025-04-24 12:20:00'),
(1, 6, 'Evitei uma conversa difícil.', 4, 'Sexta-feira', '2025-04-25 14:00:00'),
(1, 7, 'Raiva ao perder tempo no trânsito.', 4, 'Sábado', '2025-04-26 15:10:00'),
(1, 8, 'Previ possíveis desafios.', 3, 'Domingo', '2025-04-27 16:20:00'),
(1, 1, 'Felicidade por um elogio recebido.', 5, 'Segunda-feira', '2025-04-28 17:30:00'),
(1, 2, 'Confiando nas pessoas ao meu redor.', 4, 'Terça-feira', '2025-04-29 18:40:00'),
(1, 3, 'Preocupação com uma conversa importante.', 4, 'Quarta-feira', '2025-04-30 19:00:00');


SHOW TABLES;

SELECT * FROM users;
SELECT * FROM emotion;
SELECT * FROM log;

SELECT u.nome AS Usuário,
	l.diaSemana AS Dia,
    l.dtRegistro AS Dataa,
	e.nome AS Emoção,
    l.anotacao AS Anotação
FROM log AS l
JOIN users AS u
ON l.fkUser = u.idUser
JOIN emotion AS e
ON l.fkEmotion = e.idEmotion;


