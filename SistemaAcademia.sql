-- Criar o Banco de Dados
CREATE DATABASE SistemaAcademia;
USE SistemaAcademia;

-- 1. Tabela Instrutores (Entidade Forte)
CREATE TABLE Instrutores (
    id_instrutor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50)
);

-- 2. Tabela Treinos (Entidade Forte - Relacionada ao Instrutor)
CREATE TABLE Treinos (
    id_treino INT PRIMARY KEY AUTO_INCREMENT,
    nome_treino VARCHAR(100) NOT NULL,
    nivel_dificuldade VARCHAR(20),
    id_instrutor INT,
    -- Um instrutor cria vários treinos
    FOREIGN KEY (id_instrutor) REFERENCES Instrutores(id_instrutor)
);

-- 3. Tabela Alunos (Entidade Forte)
CREATE TABLE Alunos (
    matricula INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
);

-- 4. Tabela Associativa Aluno_Treino (Resolve M:N)
CREATE TABLE Aluno_Treino (
    matricula INT,
    id_treino INT,
    data_inicio DATE,
    PRIMARY KEY (matricula, id_treino),
    FOREIGN KEY (matricula) REFERENCES Alunos(matricula),
    FOREIGN KEY (id_treino) REFERENCES Treinos(id_treino)
);
