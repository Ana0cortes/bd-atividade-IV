CREATE TABLE contas (
    id_conta INT PRIMARY KEY,
    nome VARCHAR(255),
    saldo DECIMAL(10, 2)
);

-- Inserir registros na tabela contas
INSERT INTO contas (id_conta, nome, saldo) VALUES
(1, 'Conta Corrente', 5000.00),
(2, 'Conta Poupança', 10000.00),
(3, 'Carteira', 200.00);

-- Criar tabela transacoes
CREATE TABLE transacoes (
    id_transacao INT PRIMARY KEY,
    id_conta INT,
    tipo VARCHAR(10),
    valor DECIMAL(10, 2),
    FOREIGN KEY (id_conta) REFERENCES contas(id_conta)
);

-- Inserir registros na tabela transacoes
INSERT INTO transacoes (id_transacao, id_conta, tipo, valor) VALUES
(1, 1, 'entrada', 1000.00),
(2, 2, 'saida', 500.00),
(3, 3, 'entrada', 50.00);


CREATE TRIGGER atualizar_saldo
AFTER INSERT ON transacoes
FOR EACH ROW
UPDATE contas
SET saldo = 
    CASE
        WHEN NEW.tipo = 'entrada' THEN saldo + NEW.valor
        WHEN NEW.tipo = 'saida' THEN saldo - NEW.valor
    END
WHERE id_conta = NEW.id_conta;