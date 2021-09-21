CREATE PROCEDURE adicionar_venda

@IdCliente int,
@IdCarro int,
@IdformaPagamento int,
@valor BIGINT,
@DataVenda DATE

AS
BEGIN
INSERT INTO VENDA(IdCliente, IdCarro, IdFormaDePagamento, ValorVenda, DataVenda)
	VALUES (@IdCliente, @IdCarro, @IdformaPagamento, @valor, @DataVenda)
END
GO
-- Verificação do valor somado de um determinado cliente para cada descrição de pagamento
-- Esse cliente pagou quanto por boleto? Quanto por cartão? etc..

CREATE PROCEDURE selecionar_tipoPagamento_cliente

@IdCliente int

AS
BEGIN
SELECT 
a.IdCliente
,b.DesPagamento
,CAST(SUM(a.ValorVenda) AS FLOAT) AS VLR_VENDA
FROM VENDA a
INNER JOIN PAGAMENTO b
ON a.IdFormaDePagamento = b.IdPagamento
WHERE IdCliente = @IdCliente
GROUP BY 
a.IdCliente
,b.DesPagamento
END
GO

CREATE PROCEDURE cancelar_venda

@IdContrato int 

AS
BEGIN
DELETE FROM VENDA WHERE IdContrato = @IdContrato
END
GO

CREATE PROCEDURE arruma_DataVenda

@IdContrato int,
@nova_data DATE

AS 
BEGIN 
UPDATE VENDA SET DataVenda = @nova_data
WHERE IdContrato = @IdContrato
END
GO