CREATE TABLE Usuario (
	idUsuario SERIAL PRIMARY KEY,
	Email VARCHAR(80) NOT NULL UNIQUE,
	Senha VARCHAR(80) NOT NULL,
	Nome VARCHAR(80) NOT NULL,
	CPF CHAR(11) NOT NULL UNIQUE,
	Tipo VARCHAR(20) CHECK (Tipo IN ('admin', 'convencional')),
	Cargo VARCHAR(20),
	UF CHAR(2),
	Cidade VARCHAR(50),
	CEP CHAR(8),
	Rua VARCHAR(70),
	Bairro VARCHAR(50),
	Numero INT,
	Complemento VARCHAR(70)
	);

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
