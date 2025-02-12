SELECT 
    u.Nome AS NomeUsuario,
    l.NomeProduto,
    l.Descricao AS DescricaoProduto,
    STRING_AGG(c.Nome, ', ') AS CategoriasProduto,
    l.DataHoraInicio,
    l.DataHoraFim,
    lc.Valor AS ValorLanceFinal,
    ug.Nome AS NomeUsuarioGanhador
FROM 
    Lance lc
JOIN 
    Usuario u ON lc.idUsuario = u.idUsuario
JOIN 
    Leilao l ON lc.idLeilao = l.idLeilao
LEFT JOIN 
    Categoria cl ON l.idLeilao = l.idLeilao
LEFT JOIN 
    Categoria c ON cl.idCategoria = c.idCategoria
LEFT JOIN 
    Usuario ug ON l.idLanceGanhador = lc.idLance AND lc.idUsuario = ug.idUsuario
WHERE 
    u.idUsuario = 3 --aqui você pode por o id do usuario que quer verificar os lances
GROUP BY 
    u.Nome, l.NomeProduto, l.Descricao, l.DataHoraInicio, l.DataHoraFim, lc.Valor, ug.Nome
ORDER BY 
    l.DataHoraInicio;
