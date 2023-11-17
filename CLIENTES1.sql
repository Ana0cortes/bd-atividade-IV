-- Criar tabela clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    telefone VARCHAR(15)
);

-- Criar tabela pedidos
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Inserir registros na tabela clientes
INSERT INTO clientes (id_cliente, nome, email, telefone) VALUES
(1, 'João Silva', 'joao@email.com', '(11) 1234-5678'),
(2, 'Maria Oliveira', 'maria@email.com', '(22) 9876-5432'),
(3, 'Carlos Pereira', 'carlos@email.com', '(33) 8765-4321'),
(4, 'Ana Souza', 'ana@email.com', '(44) 5678-1234');

-- Inserir registros na tabela pedidos
INSERT INTO pedidos (id_pedido, id_cliente, data_pedido, valor_total) VALUES
(1, 1, '2023-01-15', 120.00),
(2, 2, '2023-02-28', 180.50),
(3, 1, '2023-03-10', 90.00),
(4, 3, '2023-04-05', 145.75);

-- Criar a view relatorio_pedidos_cliente
CREATE VIEW relatorio_pedidos_cliente AS
SELECT c.nome AS nome_cliente, COUNT(p.id_pedido) AS numero_pedidos, SUM(p.valor_total) AS valor_total_gasto
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.nome;