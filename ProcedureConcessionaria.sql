CREATE PROCEDURE nova_concessionaria 

	@CNPJNova bigint,
	@NomeConcessionariaNova varchar (60),
	@EnderecoConcessionariaNova varchar(60)

AS
BEGIN
INSERT INTO CONCESSIONARIA(CNPJ, NomeConcessionaria,EnderecoConcessionaria)
	VALUES (@CNPJNova, @NomeConcessionariaNova, @EnderecoConcessionariaNova)
END
GO


CREATE PROCEDURE encontrar_concessionaria

@BuscaCnpj bigint 

AS
BEGIN
SELECT * FROM CONCESSIONARIA
WHERE CNPJ = @BuscaCnpj
END
GO

CREATE PROCEDURE excluir_concessionaria

@CNPJExcluir bigint

AS
BEGIN
DELETE FROM CONCESSIONARIA WHERE CNPJ = @CNPJExcluir
END
GO

CREATE PROCEDURE alterar_concessionaria

@CNPJBusca bigint,
@NomeConcessionariaNovo varchar(150)

AS
BEGIN
UPDATE CONCESSIONARIA
	SET NomeConcessionaria = @NomeConcessionariaNovo
	WHERE Cnpj = @CNPJBusca
END
GO
