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
    FOREIGN KEY (idUsuarioCriador) REFERENCES Usuario (idUsuario) ON DELETE SET NULL
);


INSERT INTO Leilao (NomeProduto, Descricao, Status, Estado, DataHoraInicio, DataHoraFim, PrecoInicial, idUsuarioCriador)
VALUES
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
