-- Criar tabela Usuario primeiro
CREATE TABLE Usuario (
	idUsuario SERIAL PRIMARY KEY,
	Email VARCHAR(80) NOT NULL UNIQUE,
	Senha VARCHAR(80) NOT NULL,
	Nome VARCHAR(80) NOT NULL,
	CPF CHAR(11) NOT NULL UNIQUE,
	Tipo VARCHAR(20) NOT NULL CHECK (Tipo IN ('admin', 'convencional')),
	Cargo VARCHAR(20),
	UF CHAR(2),
	Cidade VARCHAR(50),
	CEP CHAR(8),
	Rua VARCHAR(70),
	Bairro VARCHAR(50),
	Numero INT,
	Complemento VARCHAR(70)
	);
    
-- Criar tabela Leilao sem a foreign key para idLanceGanhador
CREATE TABLE Leilao (
    idLeilao SERIAL PRIMARY KEY,
    NomeProduto VARCHAR(100) NOT NULL,
    Descricao TEXT,
    Status VARCHAR(20) NOT NULL,
    Estado VARCHAR(20) NOT NULL,
    DataHoraInicio TIMESTAMP NOT NULL,
    DataHoraFim TIMESTAMP NOT NULL,
    PrecoInicial DECIMAL(10,2) NOT NULL CHECK (PrecoInicial >= 0),
    idUsuarioCriador INTEGER NOT NULL,
    idLanceGanhador INTEGER,
    FOREIGN KEY (idUsuarioCriador) REFERENCES Usuario (idUsuario) ON DELETE CASCADE
);

-- Criar tabela Lance antes de adicionar a FK em Leilao
CREATE TABLE Lance (
    idLance SERIAL PRIMARY KEY,
    Valor DECIMAL(10,2) NOT NULL CHECK (Valor > 0),
    DataHoraLance TIMESTAMP NOT NULL,
    idUsuario INTEGER NOT NULL,
    idLeilao INTEGER NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES Usuario (idUsuario) ON DELETE CASCADE,
    FOREIGN KEY (idLeilao) REFERENCES Leilao (idLeilao) ON DELETE CASCADE
);

-- Adicionar a FK idLanceGanhador agora que a tabela Lance já existe
ALTER TABLE Leilao
ADD FOREIGN KEY (idLanceGanhador) REFERENCES Lance (idLance);

-- Criar tabela Categoria
CREATE TABLE Categoria (
    idCategoria SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL UNIQUE,
    Descricao TEXT
);

-- Criar tabela PossuiCategoria (relação entre Leilão e Categoria)
CREATE TABLE PossuiCategoria(
idLeilao INTEGER NOT NULL,
idCategoria INTEGER NOT NULL,
PRIMARY KEY (idLeilao, idCategoria),
FOREIGN KEY(idLeilao) REFERENCES Leilao (idLeilao),
FOREIGN KEY(idCategoria) REFERENCES Categoria (idCategoria)
); 

-- Criar tabela FormaDePagamento (formas aceitas para cada leilão)
CREATE TABLE FormaDePagamento(
idLeilao INTEGER NOT NULL,
NomeFormaDePagamento VARCHAR(30) NOT NULL,
PRIMARY KEY(idLeilao, NomeFormaDePagamento),
FOREIGN KEY(idLeilao) REFERENCES Leilao (idLeilao) ON DELETE CASCADE
);

-- Criar tabela Avaliacao
CREATE TABLE Avaliacao (
    idAvaliacao SERIAL PRIMARY KEY,
    Comentario TEXT,
    Titulo VARCHAR(100),
    Nota INT CHECK (Nota BETWEEN 1 AND 5),
    Funcao VARCHAR(50) NOT NULL CHECK (Funcao IN ('comprador', 'leiloeiro')),
    idUsuario INT NOT NULL,
    idLeilao INT NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (idLeilao) REFERENCES Leilao(idLeilao)
);

-- Inserção de dados na tabela Usuario
INSERT INTO Usuario (Email, Senha, Nome, CPF, Tipo, Cargo, UF, Cidade, CEP, Rua, Bairro, Numero, Complemento) VALUES
('marcelo.silva@email.com', 'Marcelo@123', 'Marcelo Silva', '12345678901', 'admin', 'geral', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('renata.oliveira@email.com', 'Renata@456', 'Renata Oliveira', '23456789012', 'admin',  'moderador', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('lucas.fernandes@email.com', 'Lucas@789', 'Lucas Fernandes', '34567890123', 'convencional', NULL, 'MG', 'Belo Horizonte', '30190010', 'Av. Afonso Pena', 'Centro', '500', NULL),
('camila.rodrigues@email.com', 'Camila@321', 'Camila Rodrigues', '45678901234', 'convencional', NULL, 'RS', 'Porto Alegre', '90010000', 'Rua dos Andradas', 'Centro Histórico', '800', NULL),
('gabriel.souza@email.com', 'Gabriel@654', 'Gabriel Souza', '56789012345', 'convencional', NULL, 'BA', 'Salvador', '40020030', 'Av. Sete de Setembro', 'Campo Grande', '300', 'Bloco B'),
('juliana.lima@email.com', 'Juliana@987', 'Juliana Lima', '67890123456', 'convencional', NULL, 'PR', 'Curitiba', '80010020', 'Rua XV de Novembro', 'Centro', '1200', 'Casa 5'),
('rafael.martins@email.com', 'Rafael@159', 'Rafael Martins', '78901234567', 'convencional', NULL, 'CE', 'Fortaleza', '60115000', 'Av. Beira Mar', 'Meireles', '450', NULL),
('amanda.costa@email.com', 'Amanda@753', 'Amanda Costa', '89012345678', 'convencional', NULL, 'PE', 'Recife', '50010030', 'Rua da Aurora', 'Boa Vista', '900', NULL),
('fernando.alves@email.com', 'Fernando@852', 'Fernando Alves', '90123456789', 'convencional', NULL, 'SC', 'Florianópolis', '88010030', 'Av. Hercílio Luz', 'Centro', '100', NULL),
('beatriz.santos@email.com', 'Beatriz@741', 'Beatriz Santos', '01234567890', 'convencional', NULL, 'GO', 'Goiânia', '74000000', 'Rua 9', 'Setor Oeste', '350', 'Apto 401');

-- Inserção de dados na tabela Leilao
INSERT INTO Leilao (NomeProduto, Descricao, Status, Estado, DataHoraInicio, DataHoraFim, PrecoInicial, idUsuarioCriador) VALUES
    ('iPhone 13', 'Celular Apple iPhone 13, 128GB, Azul', 'Aberto', 'Novo', '2024-01-01 10:00:00', '2024-02-01 10:00:00', 3500.00, 1),
    ('PlayStation 5', 'Console Sony PS5, Edição Digital', 'Aberto', 'Novo', '2024-01-05 15:00:00', '2024-02-05 15:00:00', 4500.00, 2),
    ('Smart TV 55"', 'Smart TV LED 55" 4K UHD, HDR', 'Encerrado', 'Semi-novo', '2023-12-15 12:00:00', '2024-01-15 12:00:00', 3000.00, 3),
    ('Notebook Dell', 'Notebook Dell Inspiron, i7, 16GB RAM, 512GB SSD', 'Aberto', 'Novo', '2024-01-10 18:00:00', '2024-02-10 18:00:00', 5500.00, 4),
    ('Bicicleta Aro 29', 'Mountain Bike Aro 29, Freios a Disco', 'Encerrado', 'Usado', '2023-12-20 09:00:00', '2024-01-20 09:00:00', 1200.00, 5),
    ('Relógio Smartwatch', 'Relógio Inteligente com Monitor Cardíaco', 'Aberto', 'Novo', '2024-01-02 08:00:00', '2024-02-02 08:00:00', 800.00, 6),
    ('Fone de Ouvido Bluetooth', 'Fone de Ouvido Bluetooth com Cancelamento de Ruído', 'Aberto', 'Novo', '2024-01-07 11:00:00', '2024-02-07 11:00:00', 600.00, 7),
    ('Câmera DSLR Canon', 'Câmera Fotográfica Canon EOS Rebel, Lente 18-55mm', 'Aberto', 'Usado', '2024-01-15 14:00:00', '2024-02-15 14:00:00', 2500.00, 8),
    ('Tablet Samsung', 'Tablet Samsung Galaxy Tab S6 Lite, 64GB', 'Aberto', 'Semi-novo', '2024-01-20 16:00:00', '2024-02-20 16:00:00', 1800.00, 9),
    ('Console Xbox Series X', 'Console Microsoft Xbox Series X, 1TB', 'Encerrado', 'Novo', '2023-12-10 13:00:00', '2024-01-10 13:00:00', 4800.00, 10);
    
    -- Inserção de dados na tabela Lance
INSERT INTO Lance (Valor, DataHoraLance, idUsuario, idLeilao) VALUES
    (3600.00, '2024-01-02 12:00:00', 2, 1),
    (4700.00, '2024-01-06 16:00:00', 3, 2),
    (3100.00, '2023-12-16 13:00:00', 4, 3),
    (5700.00, '2024-01-11 19:00:00', 5, 4),
    (1300.00, '2023-12-21 10:00:00', 6, 5),
    (850.00, '2024-01-03 09:00:00', 7, 6),
    (620.00, '2024-01-08 12:00:00', 8, 7),
    (2600.00, '2024-01-16 15:00:00', 9, 8),
    (1900.00, '2024-01-21 17:00:00', 10, 9),
    (5000.00, '2023-12-11 14:00:00', 1, 10);
    
-- Inserção de dados na tabela Categoria
INSERT INTO Categoria (Nome, Descricao) VALUES
 ('Eletrônicos', 'Dispositivos eletrônicos como celulares, computadores e acessórios.'),
    ('Moda', 'Roupas, calçados, acessórios e artigos de vestuário em geral.'),
    ('Automóveis', 'Carros, motos e veículos de diferentes tipos.'),
    ('Imóveis', 'Casas, apartamentos, terrenos e outros tipos de propriedades.'),
    ('Esportes e Lazer', 'Artigos esportivos, bicicletas, equipamentos de academia e lazer.'),
    ('Jogos e Consoles', 'Consoles, videogames e acessórios.'),
    ('Móveis e Decoração', 'Móveis para casa e escritório, além de artigos de decoração.'),
    ('Brinquedos', 'Jogos, brinquedos infantis e educativos.'),
    ('Instrumentos Musicais', 'Guitarras, pianos, violinos e outros instrumentos musicais.'),
    ('Eletrodomésticos', 'Geladeiras, fogões, máquinas de lavar e outros aparelhos domésticos.'),
    ('Fotografia e Filmagem', 'Câmeras, drones, lentes e acessórios.');

-- Inserção de dados na tabela PossuiCategoria
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
    
-- Inserção de dados na tabela FormaDePagamento
INSERT INTO FormaDePagamento (idLeilao, NomeFormaDePagamento) VALUES
	(1, 'Cartão de Crédito'),
    (1, 'Boleto Bancário'),
    (2, 'Pix'),
    (2, 'Transferência Bancária'),
    (3, 'Cartão de Crédito'),
    (4, 'Pix'),
    (5, 'Boleto Bancário'),
    (6, 'Transferência Bancária'),
    (7, 'Cartão de Débito'),
    (8, 'Pix'),
    (9, 'Cartão de Crédito'),
    (10, 'Boleto Bancário');
    
-- Inserção de dados na tabela Avaliacao
INSERT INTO Avaliacao (Comentario, Titulo, Nota, Funcao, idUsuario, idLeilao) VALUES
    ('Ótimo produto e vendedor confiável!', 'Muito satisfeito', 5, 'comprador', 2, 1),
    ('Entrega rápida e produto excelente.', 'Recomendo!', 4, 'comprador', 3, 2),
    ('O produto estava em bom estado, mas demorou um pouco para ser entregue.', 'Bom negócio', 3, 'comprador', 4, 3),
    ('Ótima experiência no leilão!', 'Tudo certo!', 5, 'leiloeiro', 1, 4),
    ('Achei o preço um pouco alto, mas o produto é de qualidade.', 'Satisfeito', 4, 'comprador', 5, 5),
    ('O processo foi fácil e bem organizado.', 'Muito profissional', 5, 'leiloeiro', 2, 6),
    ('Fiquei decepcionado com o tempo de entrega.', 'Demorou muito', 2, 'comprador', 6, 7),
    ('O leilão foi bem conduzido e sem problemas.', 'Ótima organização', 5, 'leiloeiro', 3, 8),
    ('Preço justo e negociação tranquila.', 'Muito bom!', 4, 'comprador', 9, 9),
    ('O leiloeiro foi muito atencioso e esclareceu todas as dúvidas.', 'Excelente experiência', 5, 'leiloeiro', 4, 10);