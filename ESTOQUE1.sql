CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(255),
    preco_unitario DECIMAL(10, 2),
    categoria VARCHAR(255)
);

-- Criar tabela estoque
CREATE TABLE estoque (
    id_produto INT PRIMARY KEY,
    quantidade INT,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- Inserir registros na tabela produtos
INSERT INTO produtos (id_produto, nome, preco_unitario, categoria) VALUES
(1, 'Smartphone', 899.99, 'Eletrônicos'),
(2, 'Máquina de Lavar', 599.00, 'Eletrodomésticos'),
(3, 'Camiseta Casual', 29.99, 'Roupas'),
(4, 'Laptop', 1299.99, 'Eletrônicos'),
(5, 'Geladeira', 899.00, 'Eletrodomésticos');

-- Inserir registros na tabela estoque
INSERT INTO estoque (id_produto, quantidade) VALUES
(1, 15),
(2, 8),
(3, 50),
(4, 10),
(5, 5);

-- Criar a view estoque_critico
CREATE VIEW estoque_critico AS
SELECT p.nome AS nome_produto, e.quantidade
FROM produtos p
JOIN estoque e ON p.id_produto = e.id_produto
WHERE e.quantidade < 10;