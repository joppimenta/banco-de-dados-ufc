CREATE TABLE Lance (
    idLance SERIAL PRIMARY KEY,
    Valor DECIMAL(10,2) NOT NULL CHECK (valor > 0),
    DataHoralance TIMESTAMP NOT NULL,
    idUsuario INTEGER NOT NULL,
    idLeilao INTEGER NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES Usuario (idUsuario) ON DELETE SET NULL,
    FOREIGN KEY (idLeilao) REFERENCES Leilao (idLeilao) ON DELETE SET NULL
);

INSERT INTO Lance (Valor, DataHoraLance, idUsuario, idLeilao)
VALUES
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
