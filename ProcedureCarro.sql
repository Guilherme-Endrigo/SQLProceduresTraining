CREATE PROCEDURE novo_carro 

@IdConcessionariaCarroNovo int,
@IdMarcaCarroNovo int,
@ModeloCarroNovo varchar (60),
@DataCarroNovo int,
@AdicionaisCarroNovo varchar(150)

AS
BEGIN
INSERT INTO CARRO(IdConcessionariaCarro, IdMarcaCarro, ModeloCarro, DataCarro, AdicionaisCarro)
	VALUES (@IdConcessionariaCarroNovo, @IdMarcaCarroNovo, @ModeloCarroNovo, @DataCarroNovo, @AdicionaisCarroNovo);
END
GO

CREATE PROCEDURE encontrar_carro 

@carroModelo varchar (60) 

AS
BEGIN
SELECT * FROM FORMULARIO_CONTATO
WHERE IdModeloCarro like '% @carroModelo %' 
--caso tenha parte do nome
END
GO

CREATE PROCEDURE excluir_carro

@Idcarro int

AS
BEGIN
DELETE FROM CARRO WHERE IdCarro = @Idcarro
END
GO

CREATE PROCEDURE alterar_carro

@Idcarro int,
@AdicionaisCarro varchar(150)

AS
BEGIN
UPDATE CARRO
	SET AdicionaisCarro = @AdicionaisCarro
	WHERE IdCarro = @Idcarro
END
GO
