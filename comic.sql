-- 03.06.24 | Gilberto Morales & Rafael Predebon

CREATE DATABASE comic;
USE comic;

CREATE TABLE Curso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    area VARCHAR(100)
);

CREATE TABLE Professor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    curso_id INT,
    area_atuacao VARCHAR(100),
    FOREIGN KEY (curso_id) REFERENCES Curso(id)
);

CREATE TABLE Instituicao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    sigla VARCHAR(10)
);

CREATE TABLE Projeto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    resumo TEXT,
    professor_responsavel_id INT,
    colaborador_id INT,
    instituicao_id INT,
    FOREIGN KEY (professor_responsavel_id) REFERENCES Professor(id),
    FOREIGN KEY (colaborador_id) REFERENCES Professor(id),
    FOREIGN KEY (instituicao_id) REFERENCES Instituicao(id)
);

INSERT INTO Curso (id, nome, area) VALUES
(1,"Ciência da Computação","Tecnologia"),
(2,"Sistemas de Informação","Tecnologia"),
(3,"Filosofia","Sociais");

INSERT INTO Professor (id, nome, email, curso_id, area_atuacao) VALUES
(1,"Alexandre Zamberlan","alexz@ufn.edu.br",1,"Tecnologia"),
(2,"Ana Paula","apc@ufn.edu.br",1,"Tecnologia"),
(3,"Sylvio Garcia","sylvio@ufn.edu.br",2,"Tecnologia"),
(4,"Mirkos Martins","mirkos@ufn.edu.br",1,"Tecnologia");

INSERT INTO Instituicao (id, nome, sigla) VALUES
(10,"Universidade Franciscana","UFN"),
(20,"Universidade Federal de Santa Maria","UFSM");

INSERT INTO Projeto (id, titulo, resumo, professor_responsavel_id, colaborador_id, instituicao_id) VALUES
(1,"Web Crawler","Trabalho do Zamba",1,NULL,10),
(2,"SirPerf","Sistema de perfusão",1,3,10),
(3,"OdontoTren","Sistema de gestão de atendimento",2,3,20),
(4,"Avida","Sistema de acompanhamento psiquiátrico",1,NULL,10);

SELECT Projeto.titulo FROM Projeto JOIN Instituicao ON Projeto.instituicao_id = Instituicao.id WHERE Instituicao.sigla = 'UFN';
SELECT Professor.nome FROM Professor LEFT JOIN Projeto ON Professor.id = Projeto.professor_responsavel_id WHERE Projeto.id IS NULL;
SELECT Projeto.titulo FROM Projeto JOIN Professor ON Projeto.professor_responsavel_id = Professor.id WHERE Professor.nome = 'Alexandre Zamberlan';
SELECT COUNT(*) AS total_projetos FROM Projeto;
SELECT titulo FROM Projeto WHERE colaborador_id IS NULL;
SELECT Projeto.titulo FROM Projeto JOIN Professor ON Projeto.professor_responsavel_id = Professor.id JOIN Curso ON Professor.curso_id = Curso.id WHERE Curso.area = 'Tecnologia';
SELECT Curso.nome AS curso, Projeto.titulo FROM Projeto JOIN Professor ON Projeto.professor_responsavel_id = Professor.id JOIN Curso ON Professor.curso_id = Curso.id ORDER BY Curso.nome;

