SELECT nome, COUNT(*) AS Num_Leiloes
FROM possuicategoria pc
LEFT JOIN categoria c
ON pc.idcategoria = c.idcategoria
GROUP BY nome
ORDER BY Num_Leiloes DESC