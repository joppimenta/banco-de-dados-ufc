SELECT
    u.Nome AS NomeUsuario,
    l.NomeProduto,
    l.Descricao AS DescricaoProduto,
    STRING_AGG(c.Nome, ', ') AS CategoriasProduto,
    l.DataHoraInicio,
    l.DataHoraFim,
    lc.Valor AS ValorLance,
    CASE
        WHEN l.idLanceGanhador = lc.idLance THEN 'Sim'
        ELSE 'Não'
    END AS LanceGanhador
FROM
    Lance lc
JOIN
    Usuario u ON lc.idUsuario = u.idUsuario
JOIN
    Leilao l ON lc.idLeilao = l.idLeilao
LEFT JOIN
    PossuiCategoria pc ON l.idLeilao = pc.idLeilao
LEFT JOIN
    Categoria c ON pc.idCategoria = c.idCategoria
WHERE
    u.Nome = :nome_usuario
GROUP BY
    u.Nome,
    l.NomeProduto,
    l.Descricao,
    l.DataHoraInicio,
    l.DataHoraFim,
    lc.Valor,
    lc.idLance,
    l.idLanceGanhador
ORDER BY
    l.DataHoraInicio;
