CREATE TABLE alunos (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(255),
    data_nascimento DATE,
    serie INT
);

-- Criar tabela matriculas
CREATE TABLE matriculas (
    id_matricula INT PRIMARY KEY,
    id_aluno INT,
    data_matricula DATE,
    status VARCHAR(255),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno)
);

-- Inserir registros na tabela alunos
INSERT INTO alunos (id_aluno, nome, data_nascimento, serie) VALUES
(1, 'João Silva', '2010-05-15', 5),
(2, 'Maria Oliveira', '2008-02-28', 8);

-- Criar trigger para verificar a idade ao inserir matriculas
CREATE TRIGGER verificar_idade
BEFORE INSERT ON matriculas
FOR EACH ROW
BEGIN
    DECLARE idade_aluno INT;
    SELECT YEAR(CURDATE()) - YEAR(a.data_nascimento) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(a.data_nascimento, '%m%d'))
    INTO idade_aluno
    FROM alunos a
    WHERE a.id_aluno = NEW.id_aluno;

    IF idade_aluno < NEW.serie THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: O aluno não atende aos requisitos de idade para a série.';
    END IF;
END