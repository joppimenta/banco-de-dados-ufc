SELECT nome 
FROM usuario 
WHERE usuario.idusuario in (
	SELECT idusuario 
	FROM lance 
	WHERE  valor >= 5000
);
