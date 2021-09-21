CREATE PROCEDURE novo_favorito

@IdClienteFavorito int,
@IdCarroFavorito  int


AS
BEGIN
INSERT INTO FAVORITOS(IdCliente, IdCarro)
	VALUES (@IdClienteFavorito, @IdCarroFavorito);
END
GO

CREATE PROCEDURE encontrar_favorito

@IdFavoritado int 

AS
BEGIN
SELECT * FROM FAVORITOS
WHERE IdFavoritado = @IdFavoritado 
END
GO

CREATE PROCEDURE excluir_favorito

@IdFavoritado int

AS
BEGIN
DELETE FROM FAVORITOS WHERE IdFavoritado = @IdFavoritado
END
GO

CREATE PROCEDURE alterar_favorito

@IdFavoritado int,
@IdCarroFavoritado int

AS
BEGIN
UPDATE FAVORITOS
	SET IdCarro = @IdCarroFavoritado
	WHERE IdFavoritado = @IdFavoritado
END
GO