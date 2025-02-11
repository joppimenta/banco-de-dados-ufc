SELECT *
FROM leilao
WHERE status = 'Aberto' AND estado = 'Novo'
AND idleilao IN (
	SELECT idleilao
	FROM possuicategoria pc
	LEFT JOIN categoria c
	ON pc.idcategoria = c.idcategoria
	WHERE c.nome = 'Eletrônicos'
)