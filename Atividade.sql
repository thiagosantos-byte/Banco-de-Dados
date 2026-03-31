
CREATE TABLE Cursos (
    id INT PRIMARY KEY,
    nome_curso VARCHAR(50)
);

CREATE TABLE Alunos (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    idade INT,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES Cursos(id)
);



INSERT INTO Cursos (id, nome_curso) VALUES 
(1, 'TI'), (2, 'Direito'), (3, 'Medicina'), (4, 'Design');

INSERT INTO Alunos (id, nome, idade, id_curso) VALUES 
(1, 'Ana', 22, 1), (2, 'Bruno', 19, 1), (3, 'Carla', 25, 2),
(4, 'Diego', 21, 1), (5, 'Elena', 30, 3), (6, 'Fabio', 18, NULL);




SELECT A.nome, C.nome_curso FROM Alunos A INNER JOIN Cursos C ON A.id_curso = C.id;


SELECT A.nome, C.nome_curso FROM Alunos A LEFT JOIN Cursos C ON A.id_curso = C.id;


SELECT C.nome_curso, COUNT(A.id) FROM Cursos C LEFT JOIN Alunos A ON C.id = A.id_curso GROUP BY C.nome_curso;


SELECT C.nome_curso FROM Cursos C JOIN Alunos A ON C.id = A.id_curso GROUP BY C.nome_curso HAVING COUNT(A.id) > 1;


SELECT A.nome FROM Alunos A LEFT JOIN Cursos C ON A.id_curso = C.id WHERE C.id IS NULL;


SELECT C.nome_curso, COUNT(A.id) AS qtd FROM Cursos C LEFT JOIN Alunos A ON C.id = A.id_curso GROUP BY C.nome_curso;


SELECT C.nome_curso, AVG(A.idade) FROM Cursos C JOIN Alunos A ON C.id = A.id_curso GROUP BY C.nome_curso;


SELECT A.nome, C.nome_curso FROM Alunos A JOIN Cursos C ON A.id_curso = C.id ORDER BY A.nome ASC;


SELECT id_curso, COUNT(*) FROM Alunos GROUP BY id_curso;

SELECT C.nome_curso FROM Cursos C LEFT JOIN Alunos A ON C.id = A.id_curso GROUP BY C.nome_curso HAVING COUNT(A.id) < 3;


SELECT C.nome_curso, MAX(A.idade) FROM Cursos C JOIN Alunos A ON C.id = A.id_curso GROUP BY C.nome_curso;


SELECT C.nome_curso, MIN(A.idade) FROM Cursos C JOIN Alunos A ON C.id = A.id_curso GROUP BY C.nome_curso;

SELECT A.nome FROM Alunos A JOIN Cursos C ON A.id_curso = C.id WHERE C.nome_curso = 'TI';


SELECT C.nome_curso, COUNT(A.id) AS total FROM Cursos C LEFT JOIN Alunos A ON C.id = A.id_curso GROUP BY C.nome_curso ORDER BY total DESC;


SELECT C.nome_curso, SUM(A.idade) FROM Cursos C JOIN Alunos A ON C.id = A.id_curso GROUP BY C.nome_curso;


SELECT C.nome_curso FROM Cursos C JOIN Alunos A ON C.id = A.id_curso GROUP BY C.nome_curso HAVING AVG(A.idade) > 20;

SELECT nome FROM Alunos; 


SELECT COUNT(*) FROM Cursos;


SELECT A.nome AS Aluno, C.nome_curso AS Curso FROM Alunos AS A JOIN Cursos AS C ON A.id_curso = C.id;


SELECT C.nome_curso, COUNT(A.id) as total_alunos
FROM Cursos C
LEFT JOIN Alunos A ON C.id = A.id_curso
GROUP BY C.nome_curso;
