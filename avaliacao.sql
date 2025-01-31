CREATE TABLE Avaliacao (
    idAvaliacao SERIAL PRIMARY KEY,
    Comentario TEXT,
    Titulo VARCHAR(100),
    Nota INT CHECK (Nota BETWEEN 1 AND 5),
    Funcao VARCHAR(50),
    idUsuario INT NOT NULL,
    idLeilao INT NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (idLeilao) REFERENCES Leilao(idLeilao)
);

