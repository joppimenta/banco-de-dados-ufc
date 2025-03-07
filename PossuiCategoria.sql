CREATE TABLE PossuiCategoria(
idLeilao INTEGER NOT NULL,
idCategoria INTEGER NOT NULL,
PRIMARY KEY (idLeilao, idCategoria),
FOREIGN KEY(idLeilao) REFERENCES Leilao (idLeilao),
FOREIGN KEY(idCategoria) REFERENCES Categoria (idCategoria)
); 

INSERT INTO PossuiCategoria (idLeilao, idCategoria) VALUES
    (1, 1),  -- iPhone 13 → Eletrônicos
    (2, 1),  -- PlayStation 5 → Eletrônicos
    (3, 10),  -- Smart TV 55" → Eletrodomésticos
    (4, 1),  -- Notebook Dell → Eletrônicos
    (5, 5),  -- Bicicleta Aro 29 → Esportes e Lazer
    (6, 1),  -- Relógio Smartwatch → Eletrônicos
    (7, 1),  -- Fone de Ouvido Bluetooth → Eletrônicos
    (8, 11),  -- Câmera DSLR Canon → Fotografia e Filmagem
    (9, 10),  -- Tablet Samsung → Eletrodomésticos
    (10, 6); -- Console Xbox Series X → Jogos e Consoles
