CREATE ROLE administrador

Grant select, insert, delete on avaliacao, categoria, formadepagamento,
lance, leilao, possuicategoria,usuario
to administrador 
with grant option

CREATE USER joao_pimenta WITH PASSWORD 'joao123'

GRANT administrador TO joao_pimenta
  
GRANT USAGE, SELECT, UPDATE ON SEQUENCE leilao_idleilao_seq TO joao_pimenta;

CREATE ROLE usuario_convencional

Grant select on avaliacao, categoria, formadepagamento,
lance, leilao, possuicategoria,usuario
to usuario_convencional
with grant option

CREATE USER fulano WITH PASSWORD 'fulanin'

GRANT usuario_convencional TO fulano
