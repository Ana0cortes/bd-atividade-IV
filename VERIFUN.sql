CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(255),
    data_admissao DATE
);

-- Inserir registros na tabela funcionarios
INSERT INTO funcionarios (id_funcionario, nome, data_admissao) VALUES
(1, 'João Silva', '2023-01-15'),
(2, 'Maria Oliveira', '2023-03-20');

DELIMITER //

CREATE TRIGGER verificar_data_admissao
BEFORE INSERT ON funcionarios
FOR EACH ROW
BEGIN
    IF NEW.data_admissao <= CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: A data de admissão deve ser maior que a data atual.';
    END IF;
END //

DELIMITER ;