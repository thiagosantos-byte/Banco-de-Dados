-- Criar o banco de dados (opcional)
CREATE DATABASE StreamingFilmes;
USE StreamingFilmes;

-- 1. Tabela Filmes
CREATE TABLE Filmes (
    id_filme INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    genero VARCHAR(50),
    ano_lancamento INT,
    PRIMARY KEY (id_filme)
);

-- 2. Tabela Atores
CREATE TABLE Atores (
    id_ator INT NOT NULL AUTO_INCREMENT,
    nome_completo VARCHAR(150) NOT NULL,
    PRIMARY KEY (id_ator)
);

-- 3. Tabela de Relacionamento N:N (Filmes-Atores)
CREATE TABLE Filme_Ator (
    id_filme INT NOT NULL,
    id_ator INT NOT NULL,
    PRIMARY KEY (id_filme, id_ator),
    FOREIGN KEY (id_filme) REFERENCES Filmes(id_filme),
    FOREIGN KEY (id_ator) REFERENCES Atores(id_ator)
);

-- 4. Tabela Usuarios
CREATE TABLE Usuarios (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (id_usuario)
);

-- 5. Tabela Avaliações (Relaciona Usuário com Filme)
CREATE TABLE Avaliacoes (
    id_avaliacao INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_filme INT NOT NULL,
    nota INT NOT NULL CHECK (nota >= 0 AND nota <= 10),
    comentario TEXT,
    PRIMARY KEY (id_avaliacao),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_filme) REFERENCES Filmes(id_filme),
    UNIQUE KEY (id_usuario, id_filme) -- Evita que um usuário avalie o mesmo filme duas vezes
