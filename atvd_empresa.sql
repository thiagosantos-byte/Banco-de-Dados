CREATE DATABASE empresa;
USE empresa;

CREATE TABLE funcionario (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(254),
  salario FLOAT,
  departamento VARCHAR(254),
  create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


INSERT INTO funcionario (nome, salario, departamento) VALUES
('Carlos', 3000, 'TI'),
('Maria', 4500, 'RH'),
('João', 5000, 'TI'),
('Ana', 3500, 'Financeiro'),
('Pedro', 2800, 'RH');


SELECT * FROM funcionario;

SELECT COUNT(*) AS total_funcionarios FROM funcionario;


SELECT * FROM funcionario WHERE departamento = 'TI';


SELECT COUNT(*) AS total_TI FROM funcionario WHERE departamento = 'TI';


SELECT * FROM funcionario WHERE salario > 4000;


SELECT COUNT(*) AS total_maior_4000 FROM funcionario WHERE salario > 4000;


INSERT INTO funcionario (nome, salario, departamento) VALUES ('Juliana', 4200, 'TI');


UPDATE funcionario SET salario = 3500 WHERE nome = 'Carlos';

UPDATE funcionario SET salario = salario * 1.10 WHERE departamento = 'RH';

DELETE FROM funcionario WHERE nome = 'Pedro';

SELECT * FROM funcionario ORDER BY salario DESC;

SELECT 
  AVG(salario) AS media_salarial,
  MAX(salario) AS maior_salario,
  MIN(salario) AS menor_salario
FROM funcionario;


UPDATE funcionario SET salario = salario * 1.05 WHERE departamento = 'TI' AND salario < 4000;


SELECT * FROM funcionario ORDER BY salario DESC;


