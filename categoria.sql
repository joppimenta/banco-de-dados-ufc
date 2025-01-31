CREATE TABLE Categoria (
    idCategoria SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL UNIQUE,
    Descricao TEXT
);

INSERT INTO Categoria (Nome, Descricao) VALUES
    ('Eletrônicos', 'Dispositivos eletrônicos como celulares, computadores e acessórios.'),
    ('Moda', 'Roupas, calçados, acessórios e artigos de vestuário em geral.'),
    ('Automóveis', 'Carros, motos e veículos de diferentes tipos.'),
    ('Imóveis', 'Casas, apartamentos, terrenos e outros tipos de propriedades.'),
    ('Esportes e Lazer', 'Artigos esportivos, bicicletas, equipamentos de academia e lazer.'),
    ('Colecionáveis', 'Itens raros e de coleção, como moedas, selos e action figures.'),
    ('Móveis e Decoração', 'Móveis para casa e escritório, além de artigos de decoração.'),
    ('Brinquedos', 'Jogos, brinquedos infantis e educativos.'),
    ('Instrumentos Musicais', 'Guitarras, pianos, violinos e outros instrumentos musicais.'),
    ('Eletrodomésticos', 'Geladeiras, fogões, máquinas de lavar e outros aparelhos domésticos.');
