CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(255),
    quantidade_estoque INT
);

-- Criar tabela vendas
CREATE TABLE vendas (
    id_venda INT PRIMARY KEY,
    data_venda DATETIME
);

-- Criar tabela itens_venda
CREATE TABLE itens_venda (
    id_item_venda INT PRIMARY KEY,
    id_venda INT,
    id_produto INT,
    quantidade INT,
    FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- Inserir registros na tabela produtos
INSERT INTO produtos (id_produto, nome, quantidade_estoque) VALUES
(1, 'Smartphone', 20),
(2, 'Laptop', 15);

-- Criar trigger para verificar quantidade em estoque ao inserir itens_venda
CREATE TRIGGER verificar_estoque
BEFORE INSERT ON itens_venda
FOR EACH ROW
BEGIN
    DECLARE estoque_atual INT;
    SELECT quantidade_estoque INTO estoque_atual FROM produtos WHERE id_produto = NEW.id_produto;

    IF NEW.quantidade > estoque_atual THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Produto fora de estoque.';
    END IF;
END;