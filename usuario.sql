CREATE TABLE usuario (
	idusuario SERIAL PRIMARY KEY,
	email VARCHAR(80) NOT NULL,
	senha VARCHAR(80) NOT NULL,
	nome VARCHAR(80) NOT NULL,
	cpf CHAR(11) NOT NULL UNIQUE,
	tipo VARCHAR(10),
	uf CHAR(2),
	cidade VARCHAR(50),
	cep CHAR(8),
	rua VARCHAR(70),
	bairro VARCHAR(70),
	numero VARCHAR(10),
	complemento VARCHAR(70)
)

INSERT INTO usuario (email, senha, nome, cpf, tipo, uf, cidade, cep, rua, bairro, numero, complemento) VALUES
('marcelo.silva@email.com', 'Marcelo@123', 'Marcelo Silva', '12345678901', 'admin', 'SP', 'São Paulo', '01001000', 'Av. Paulista', 'Bela Vista', '1000', 'Sala 101'),
('renata.oliveira@email.com', 'Renata@456', 'Renata Oliveira', '23456789012', 'admin', 'RJ', 'Rio de Janeiro', '20040002', 'Rua da Assembleia', 'Centro', '200', 'Apto 202'),
('lucas.fernandes@email.com', 'Lucas@789', 'Lucas Fernandes', '34567890123', 'padrão', 'MG', 'Belo Horizonte', '30190010', 'Av. Afonso Pena', 'Centro', '500', NULL),
('camila.rodrigues@email.com', 'Camila@321', 'Camila Rodrigues', '45678901234', 'padrão', 'RS', 'Porto Alegre', '90010000', 'Rua dos Andradas', 'Centro Histórico', '800', NULL),
('gabriel.souza@email.com', 'Gabriel@654', 'Gabriel Souza', '56789012345', 'padrão', 'BA', 'Salvador', '40020030', 'Av. Sete de Setembro', 'Campo Grande', '300', 'Bloco B'),
('juliana.lima@email.com', 'Juliana@987', 'Juliana Lima', '67890123456', 'padrão', 'PR', 'Curitiba', '80010020', 'Rua XV de Novembro', 'Centro', '1200', 'Casa 5'),
('rafael.martins@email.com', 'Rafael@159', 'Rafael Martins', '78901234567', 'padrão', 'CE', 'Fortaleza', '60115000', 'Av. Beira Mar', 'Meireles', '450', NULL),
('amanda.costa@email.com', 'Amanda@753', 'Amanda Costa', '89012345678', 'padrão', 'PE', 'Recife', '50010030', 'Rua da Aurora', 'Boa Vista', '900', NULL),
('fernando.alves@email.com', 'Fernando@852', 'Fernando Alves', '90123456789', 'padrão', 'SC', 'Florianópolis', '88010030', 'Av. Hercílio Luz', 'Centro', '100', NULL),
('beatriz.santos@email.com', 'Beatriz@741', 'Beatriz Santos', '01234567890', 'padrão', 'GO', 'Goiânia', '74000000', 'Rua 9', 'Setor Oeste', '350', 'Apto 401');
