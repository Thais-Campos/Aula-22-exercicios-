CREATE DATABASE db_generation_game_online; -- CRIANDO BANCO DE DADOS 

USE db_generation_game_online; -- PARA USAR O BANCO QUE CRIAMOS

-- CRIANDO A TABELA CLASSES COM 2 ATRUBUTOS 
CREATE TABLE tb_classes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    habilidadeEspecial VARCHAR(255) NOT NULL
);

INSERT INTO tb_classes (nome, habilidadeEspecial) VALUES
("Deus da Guerra", "Força Titânica"),          
("Arqueiro Jötunn", "Flechas Rúnicas"),        
("Feiticeira Vanir", "Magia da Natureza"),     
("Sábio Imortal", "Conhecimento Proibido"),    
("Deus do Trovão", "Martelo Mjolnir");

CREATE TABLE tb_personagens (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    poderAtaque INT NOT NULL,
    poderDefesa INT NOT NULL,
    nivel INT NOT NULL,
    classeid BIGINT,
    FOREIGN KEY (classeid) REFERENCES tb_classes(id)
);

INSERT INTO tb_personagens (nome, poderAtaque, poderDefesa, nivel, classeid) VALUES
("Kratos", 3500, 2500, 50, 1),
("Atreus", 2000, 1500, 35, 2),
("Freya", 2600, 2200, 45, 3),
("Mímir", 500, 800, 20, 4),
("Thor", 4000, 2800, 55, 5);

SELECT * FROM tb_personagens
WHERE poderAtaque > 2000;

SELECT * FROM tb_personagens
WHERE poderDefesa BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens
WHERE nome LIKE "%C%";

SELECT p.nome, p.poderAtaque, p.poderDefesa, p.nivel, c.nome AS classe, c.habilidadeEspecial
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classeid = c.id;

SELECT p.nome, p.nivel, p.poderAtaque, c.nome AS classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classeid = c.id
WHERE c.nome = "Deus do Trovão";



