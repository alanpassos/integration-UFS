ALTER TRIGGER [dbo].[TG_VENDAS_LOG_UPDATE] ON [dbo].[TB_VENDAS]
AFTER UPDATE
AS
	INSERT INTO TB_LOG_VENDAS (DT_LOG, TIPO_OPERACAO, CD_VENDA, CD_PRODUTO, DT_VENDA, QUANTIDADE_ANTIGA, VALOR_ANTIGO, QUANTIDADE_NOVA, VALOR_NOVO)
	SELECT GETDATE(), 'A', I.CD_VENDA, I.CD_PRODUTO, I.DT_VENDA, D.QUANTIDADE, D.VALOR, I.QUANTIDADE, I.VALOR FROM INSERTED I
	INNER JOIN DELETED D
	ON ( I.CD_VENDA = D.CD_VENDA )