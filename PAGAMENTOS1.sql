CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    cidade VARCHAR(255)
);

-- Criar tabela pagamentos
CREATE TABLE pagamentos (
    id_pagamento INT PRIMARY KEY,
    id_cliente INT,
    data_pagamento DATE,
    valor_pagamento DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Inserir registros na tabela clientes
INSERT INTO clientes (id_cliente, nome, endereco, cidade) VALUES
(1, 'João Silva', 'Rua A, 123', 'São Paulo'),
(2, 'Maria Oliveira', 'Avenida B, 456', 'Rio de Janeiro'),
(3, 'Carlos Pereira', 'Travessa C, 789', 'São Paulo');

-- Inserir registros na tabela pagamentos
INSERT INTO pagamentos (id_pagamento, id_cliente, data_pagamento, valor_pagamento) VALUES
(1, 1, '2023-01-15', 500.00),
(2, 2, '2023-02-28', 750.50),
(3, 1, '2023-03-10', 300.00),
(4, 3, '2023-04-05', 450.75);

-- Criar a view relatorio_pagamentos_cidade
CREATE VIEW relatorio_pagamentos_cidade AS
SELECT cidade, SUM(valor_pagamento) AS total_pagamentos
FROM clientes
JOIN pagamentos ON clientes.id_cliente = pagamentos.id_cliente
GROUP BY cidade;