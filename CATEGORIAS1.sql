CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY,
    nome_categoria VARCHAR(255),
    descricao VARCHAR(255)
);

-- Criar tabela produtos
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(255),
    preco_unitario DECIMAL(10, 2),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- Inserir registros na tabela categorias
INSERT INTO categorias (id_categoria, nome_categoria, descricao) VALUES
(1, 'Eletrônicos', 'Produtos eletrônicos diversos'),
(2, 'Eletrodomésticos', 'Eletrodomésticos para casa'),
(3, 'Roupas', 'Vestuário para todas as estações');

-- Inserir registros na tabela produtos
INSERT INTO produtos (id_produto, nome, preco_unitario, id_categoria) VALUES
(1, 'Smartphone', 899.99, 1),
(2, 'Máquina de Lavar', 599.00, 2),
(3, 'Camiseta Casual', 29.99, 3),
(4, 'Laptop', 1299.99, 1),
(5, 'Geladeira', 899.00, 2);

-- Criar a view relatorio_produtos_categoria
CREATE VIEW relatorio_produtos_categoria AS
SELECT nome_categoria, COUNT(id_produto) AS quantidade_produtos
FROM categorias
LEFT JOIN produtos ON categorias.id_categoria = produtos.id_categoria
GROUP BY nome_categoria;