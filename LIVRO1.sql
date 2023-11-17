CREATE TABLE livros (
    id_livro INT PRIMARY KEY,
    titulo VARCHAR(255),
    autor VARCHAR(255),
    quantidade_estoque INT
);

-- Inserir registros na tabela livros
INSERT INTO livros (id_livro, titulo, autor, quantidade_estoque) VALUES
(1, 'Dom Casmurro', 'Machado de Assis', 10),
(2, 'Cem Anos de Solidão', 'Gabriel García Márquez', 8),
(3, '1984', 'George Orwell', 15),
(4, 'O Senhor dos Anéis', 'J.R.R. Tolkien', 12),
(5, 'Orgulho e Preconceito', 'Jane Austen', 7);

CREATE TABLE emprestimos (
    id_emprestimo INT PRIMARY KEY,
    id_livro INT,
    data_emprestimo DATETIME,
    data_devolucao DATETIME,
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);

-- Inserir registros na tabela emprestimos
INSERT INTO emprestimos (id_emprestimo, id_livro, data_emprestimo, data_devolucao) VALUES
(1, 1, '2023-11-16 10:00:00', '2023-11-23 10:00:00'),
(2, 3, '2023-11-17 14:30:00', '2023-11-24 14:30:00'),
(3, 2, '2023-11-18 12:45:00', '2023-11-25 12:45:00'),
(4, 4, '2023-11-19 08:15:00', '2023-11-26 08:15:00'),
(5, 5, '2023-11-20 17:20:00', '2023-11-27 17:20:00');

CREATE TRIGGER atualizar_estoque
AFTER INSERT ON emprestimos
FOR EACH ROW
UPDATE livros
SET quantidade_estoque = quantidade_estoque - 1
WHERE id_livro = NEW.id_livro;