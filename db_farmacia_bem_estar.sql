CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    tipo VARCHAR(255) NOT NULL    
);

INSERT INTO tb_categorias (nome, tipo) VALUES
("Medicamento Controlado", "Medicamento"),
("Medicamento Comum", "Medicamento"),
("Cosméticos", "Beleza"),
("Higiene Pessoal", "Higiene"),
("Suplementos", "Nutrição");

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(6,2) NOT NULL,
    fabricante VARCHAR(255),
    estoque INT NOT NULL,
    categoriaid BIGINT,
    FOREIGN KEY (categoriaid) REFERENCES tb_categorias(id)
);

INSERT INTO tb_produtos (nome, preco, fabricante, estoque, categoriaid) VALUES
("Paracetamol 750mg", 12.90, "EMS", 300, 2),
("Dipirona 1g", 9.50, "Medley", 500, 2),
("Cetoconazol Shampoo", 58.00, "NaturaLabs", 120, 3),
("Creatina Monohidratada", 89.90, "Growth Supplements", 80, 5),
("Protetor Solar FPS 50", 65.00, "La Roche", 60, 3),
("Vitamina C 1g", 39.90, "Sundown", 200, 5),
("Sabonete Antisséptico", 7.99, "Protex", 400, 4),
("Rivotril 2mg", 120.00, "Roche", 40, 1);


SELECT * FROM tb_produtos
WHERE preco > 50.00;

SELECT * FROM tb_produtos
WHERE preco BETWEEN 5.00 AND 60.00;

SELECT * FROM tb_produtos
WHERE nome LIKE "%C%";

SELECT p.nome, p.preco, p.estoque, c.nome AS categoria, c.tipo
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoriaid = c.id;

SELECT p.nome, p.preco, p.fabricante, c.nome AS categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoriaid = c.id
WHERE c.nome = "Cosméticos";
