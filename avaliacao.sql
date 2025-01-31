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
