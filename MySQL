-- CREATE
CREATE TABLE usuario (
  id INT PRIMARY KEY,
  name VARCHAR(254) NOT NULL,
  email VARCHAR(254) NOT NULL,
  cpf CHAR(14) NOT NULL
);

-- INSERT
INSERT INTO usuario (id, name, email, cpf) VALUES
(1, 'Andre',  'andre@gmail.com', '000.000.000-00'),
(2, 'Thiago',  'thiago@gmail.com', '000.000.000-00'),
(3, 'Joao',  'joao@gmail.com', '000.000.000-00'),
(4, 'Luis',  'luis@gmail.com', '000.000.000-00'),
(5, 'Miguel',  'miguel@gmail.com', '000.000.000-00'),
(6, 'Carlos',  'carlos@gmail.com', '000.000.000-00'),
(7, 'Ana',  'ana@gmail.com', '000.000.000-00'),
(8, 'Graziella','graziella@gmail.com', '000.000.000-00'),
(9, 'Esther',  'esther@gmail.com', '000.000.000-00'),
(10, 'Maria Clara',  'mariaclara@gmail.com', '000.000.000-00'),
(11, 'Emanuelle',  'emanuelle@gmail.com', '000.000.000-00'),
(12, 'Beatriz',  'beatriz@gmail.com', '000.000.000-00'),
(13, 'Silvana',  'silvana@gmail.com', '000.000.000-00'),
(14, 'Rita',  'rita@gmail.com', '000.000.000-00'), 
(15, 'Julianne',  'julianne@gmail.com', '000.000.000-00');

-- FETCH

SELECT * FROM usuario;

CREATE TABLE endereco (

id int,
usuario_id int,
bairro VARCHAR(200) NOT NULL,
cep CHAR(8) NOT NULL,
numero_casa CHAR(20) NOT NULL,
PRIMARY KEY (id),
foreign KEY (usuario_id) references usuario(id)

);

INSERT INTO  endereco VALUES ( 1, 1, 'Graça', '103', '41210000'); 
INSERT INTO endereco VALUES  (2,2, 'Stella Maris', '104', '41210005');
INSERT INTO endereco VALUES ( 3, 3, 'Cajazeiras', '105', '12345678' );
INSERT INTO endereco VALUES (4,4, 'Valeria', '420', '98765432');
-- FETCH 
SELECT * FROM endereco;


