
CREATE TABLE FormaDePagamento(
idLeilao INTEGER NOT NULL,
NomeFormaDePagamento VARCHAR(20) NOT NULL,
PRIMARY KEY(idLeilao, NomeFormaDePagamento),
FOREIGN KEY(idLeilao) REFERENCES Leilao (idLeilao) ON DELETE CASCADE
);

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


