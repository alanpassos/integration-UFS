ALTER TRIGGER [dbo].[TG_VENDAS] ON [dbo].[TB_VENDAS]
AFTER INSERT, UPDATE
AS
	MERGE TB_RESUMO_VENDAS AS TARGET
	USING (SELECT DT_VENDA, CD_PRODUTO, SUM(QUANTIDADE), SUM(VALOR)
				FROM INSERTED GROUP BY DT_VENDA, CD_PRODUTO) AS SOURCE (DT_VENDA, CD_PRODUTO, QUANTIDADE, VALOR)
	ON ((SOURCE.DT_VENDA = TARGET.DT_VENDA) AND (SOURCE.CD_PRODUTO = TARGET.CD_PRODUTO))
	WHEN MATCHED THEN
		UPDATE SET 
			TARGET.QUANTIDADE += SOURCE.QUANTIDADE,
			TARGET.VALOR += SOURCE.VALOR
	WHEN NOT MATCHED BY TARGET THEN
		INSERT (CD_PRODUTO, DT_VENDA, QUANTIDADE, VALOR)
		VALUES (SOURCE.CD_PRODUTO, SOURCE.DT_VENDA, SOURCE.QUANTIDADE, SOURCE.VALOR)
	OUTPUT $action, Inserted.*, Deleted.*; 
		