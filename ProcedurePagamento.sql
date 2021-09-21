
CREATE PROCEDURE nova_forma_pagamento

	@DesPagamentoNova varchar (25)

AS
BEGIN
INSERT INTO PAGAMENTO(DesPagamento)
	VALUES (@DesPagamentoNova)
END
GO


CREATE PROCEDURE encontrar_forma_Pagamento

AS
BEGIN
SELECT * FROM PAGAMENTO
END
GO


CREATE PROCEDURE excluir_forma_Pagamento

@IdPagamentoExcluir int

AS
BEGIN
DELETE FROM PAGAMENTO WHERE IdPagamento = @IdPagamentoExcluir
END
GO


CREATE PROCEDURE alterar_forma_Pagamento

@IdPagamentoAlter int,
@DesPagamentoNovo varchar(25)

AS
BEGIN
UPDATE PAGAMENTO
	SET DesPagamento = @DesPagamentoNovo
	WHERE IdPagamento = @IdPagamentoAlter
END
GO