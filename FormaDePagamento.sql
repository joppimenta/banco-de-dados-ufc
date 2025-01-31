
CREATE TABLE FormaDePagamento(
idLeilao INTEGER NOT NULL,
NomeFormaDePagamento VARCHAR(20) NOT NULL,
PRIMARY KEY(idLeilao, NomeFormaDePagamento),
FOREIGN KEY(idLeilao) REFERENCES Leilao (idLeilao) ON DELETE CASCADE
);

