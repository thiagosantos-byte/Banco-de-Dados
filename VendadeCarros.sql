-- 1. Criar o banco de dados
CREATE DATABASE IF NOT EXISTS venda_carros;
USE venda_carros;

-- 2. Tabela Cliente (Entidade Principal)
CREATE TABLE clientes (
    id INT NOT NULL AUTO_INCREMENT,
    cpf VARCHAR(14) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (cpf) -- Garante que não haja CPFs duplicados
);

-- 3. Tabela Carros (Relacionada a Cliente - 1:N)
CREATE TABLE carros (
    id INT NOT NULL AUTO_INCREMENT,
    modelo VARCHAR(100) NOT NULL,
    cor VARCHAR(30) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    cliente_id INT, -- Chave estrangeira que liga ao cliente
    PRIMARY KEY (id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) -- Relacionamento 1xN
);

-- ==========================================
-- Exemplos de Uso (Opcional)
-- ==========================================

-- Inserir Clientes
INSERT INTO clientes (cpf, nome, email) VALUES 
('123.456.789-00', 'João Silva', 'joao@email.com'),
('987.654.321-11', 'Maria Souza', 'maria@email.com');

-- Inserir Carros vinculados aos clientes (cliente_id)
INSERT INTO carros (modelo, cor, preco, cliente_id) VALUES 
('Civic', 'Preto', 120000.00, 1), -- João comprou
('Corolla', 'Branco', 130000.00, 1), -- João comprou outro
('Mustang', 'Vermelho', 400000.00, 2); -- Maria comprou

-- Consulta para ver carros e seus respectivos donos
SELECT 
    c.nome AS Cliente,
    c.email AS Email,
    cr.modelo AS Carro,
    cr.cor AS Cor,
    cr.preco AS Preco
FROM clientes c
JOIN carros cr ON c.id = cr.cliente_id;
