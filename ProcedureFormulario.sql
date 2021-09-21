CREATE PROCEDURE novo_formulario 

@IdConcessionariaCarroNovo int,
@IdMarcaCarroNovo int,
@ModeloCarroNovo varchar (60),
@DataCarroNovo Date,
@AdicionaisCarroNovo varchar(150)

AS
BEGIN
INSERT INTO FORMULARIO_CONTATO(IdModeloCarro, NomeCompleto, EmailContato, TelefoneContato, MensagemContato)
	VALUES (@IdConcessionariaCarroNovo, @IdMarcaCarroNovo, @ModeloCarroNovo, @DataCarroNovo, @AdicionaisCarroNovo);
END
GO

CREATE PROCEDURE encontrar_formulario

@carro int 

AS
BEGIN
SELECT * FROM FORMULARIO_CONTATO
WHERE IdModeloCarro = @carro
END
GO

CREATE PROCEDURE excluir_formulario

@contato int

AS
BEGIN
DELETE FROM FORMULARIO_CONTATO WHERE IdContato = @contato
END
GO


CREATE PROCEDURE alterar_formulario

@contato int,
@nova_mensagem varchar(500)

AS
BEGIN
UPDATE FORMULARIO_CONTATO
	SET MensagemContato = @nova_mensagem
	WHERE IdContato = @contato
END
GO
