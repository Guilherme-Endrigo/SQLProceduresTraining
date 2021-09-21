CREATE PROCEDURE adicionar_usuario

@NomeCliente VARCHAR(60) NOT NULL,
@Email_cliente VARCHAR(256) NOT NULL,
@Telefone_cliente BIGINT NOT NULL

AS
BEGIN
INSERT INTO USUARIO(NomeCompletoCliente, EmailCliente, TelefoneCliente)
	VALUES (@NomeCliente, @Email_cliente, @Telefone_cliente)
END
GO

CREATE PROCEDURE encontrar_usuario_total_vendas

@IdCliente int

AS
BEGIN
SELECT 
a.IdCliente,
a.NomeCompletoCliente,
cast(sum(b.ValorVenda) AS FLOAT) AS VLR_VENDA
FROM USUARIO a
INNER JOIN VENDA b
ON a.IdCliente = b.IdCliente
WHERE a.IdCliente = @IdCliente
GROUP BY 
a.IdCliente,
a.NomeCompletoCliente
END
GO

CREATE PROCEDURE excluir_cliente

@IdCliente int

AS
BEGIN
DELETE FROM USUARIO WHERE IdCliente = @IdCliente
END
GO

CREATE PROCEDURE modifica_email_usuario

@IdCliente int,
@email_novo VARCHAR(256)

AS 
BEGIN 
UPDATE USUARIO SET EmailCliente = @email_novo
WHERE IdCliente = @IdCliente
END
GO