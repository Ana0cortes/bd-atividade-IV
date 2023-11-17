CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(255),
    cargo VARCHAR(255),
    salario DECIMAL(10, 2)
);

-- Criar tabela vendas
CREATE TABLE vendas (
    id_venda INT PRIMARY KEY,
    id_funcionario INT,
    data_venda DATE,
    valor_venda DECIMAL(10, 2),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);

-- Inserir registros na tabela funcionarios
INSERT INTO funcionarios (id_funcionario, nome, cargo, salario) VALUES
(1, 'João Silva', 'Vendedor', 2500.00),
(2, 'Maria Oliveira', 'Gerente', 3500.00),
(3, 'Carlos Pereira', 'Vendedor', 2700.00);

-- Inserir registros na tabela vendas
INSERT INTO vendas (id_venda, id_funcionario, data_venda, valor_venda) VALUES
(1, 1, '2023-01-15', 1200.00),
(2, 2, '2023-02-28', 1800.50),
(3, 1, '2023-03-10', 900.00),
(4, 3, '2023-04-05', 1450.75);

-- Criar a view relatorio_vendas_funcionario
CREATE VIEW relatorio_vendas_funcionario AS
SELECT f.nome AS nome_funcionario, COUNT(v.id_venda) AS numero_vendas, SUM(v.valor_venda) AS valor_total_vendas
FROM funcionarios f
LEFT JOIN vendas v ON f.id_funcionario = v.id_funcionario
GROUP BY f.nome;