CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    tipo VARCHAR(255) NOT NULL  
);

INSERT INTO tb_categorias (nome, tipo) VALUES
("Tradicional", "Salgada"),
("Especial", "Salgada"),
("Premium", "Salgada"),
("Doce", "Doce"),
("Vegana", "Salgada");

CREATE TABLE tb_pizzas (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    tamanho VARCHAR(20) NOT NULL, -- Pequena / Média / Grande
    preco DECIMAL(6,2) NOT NULL,
    borda VARCHAR(255),           -- Catupiry, Cheddar, Sem borda
    categoriaid BIGINT,
    FOREIGN KEY (categoriaid) REFERENCES tb_categorias (id)
);

INSERT INTO tb_pizzas (nome, tamanho, preco, borda, categoriaid) VALUES
("Margherita", "Grande", 42.00, "Sem borda", 1),
("Calabresa", "Grande", 48.00, "Catupiry", 1),
("Frango com Catupiry", "Média", 55.00, "Catupiry", 2),
("Portuguesa", "Grande", 60.00, "Sem borda", 2),
("Quatro Queijos", "Média", 65.00, "Cheddar", 3),
("Chocolate", "Grande", 50.00, "Sem borda", 4),
("Romeu e Julieta", "Média", 47.00, "Sem borda", 4),
("Veggie", "Grande", 58.00, "Sem borda", 5);

-- Pizzas com preço maior que 45,00
SELECT * FROM tb_pizzas
WHERE preco > 45.00;

-- Pizzas com preço entre 50,00 e 100,00
SELECT * FROM tb_pizzas
WHERE preco BETWEEN 50.00 AND 100.00;

-- Pizzas que possuem a letra M no nome
SELECT * FROM tb_pizzas
WHERE nome LIKE "%M%";

-- INNER JOIN entre pizzas e categorias
SELECT p.nome, p.preco, p.tamanho, c.nome AS categoria, c.tipo
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoriaid = c.id;

-- INNER JOIN filtrando somente pizzas doces
SELECT p.nome, p.preco, p.tamanho, c.nome AS categoria
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoriaid = c.id
WHERE c.tipo = "Doce";
