CREATE PROCEDURE SP_CLASSIFICA_CLIENTE_EXE10 (@DATA DATETIME, @QUANTIDADE_PRODUTOS INT, 
												@MENSAGEM BIT OUTPUT) AS
IF (@DATA >= '2010/01/03' OR @QUANTIDADE_PRODUTOS > 50)
	BEGIN
		SET @MENSAGEM = 1
	END
ELSE
	BEGIN
		SET @MENSAGEM = 0
	END

DECLARE @MENSAGEM BIT
EXEC SP_CLASSIFICA_CLIENTE_EXE10 '2009/04/05', 60, @MENSAGEM OUTPUT
PRINT @MENSAGEM


ALTER PROCEDURE SP_COPIA_CLIENTE_EXE10 AS
DECLARE @CD_CLIENTE INT, @NM_CLIENTE VARCHAR(60), @CPF INT,
			 @DATA DATETIME, @QUANTIDADE INT, @RESULTADO BIT
DECLARE C_CURSOR_COPIA_CLIENTE_EXE10 CURSOR FOR
SELECT C.CD_CLIENTE, C.NM_CLIENTE, C.CPF, C.DT_INCLUSAO, SUM(V.QUANTIDADE) FROM TB_CLIENTE_EXE10 C
INNER JOIN TB_VENDAS_EXE10 V ON (C.CD_CLIENTE = V.CD_CLIENTE)
GROUP BY C.CD_CLIENTE, C.NM_CLIENTE, C.CPF, C.DT_INCLUSAO, V.QUANTIDADE

OPEN C_CURSOR_COPIA_CLIENTE_EXE10
FETCH C_CURSOR_COPIA_CLIENTE_EXE10 INTO @CD_CLIENTE, @NM_CLIENTE, @CPF, @DATA, @QUANTIDADE

WHILE (@@FETCH_STATUS = 0)
	BEGIN
		EXEC SP_CLASSIFICA_CLIENTE_EXE10 @DATA, @QUANTIDADE, @RESULTADO OUTPUT

		IF (@RESULTADO = 1)
			BEGIN
				INSERT INTO TB_CLIENTE_PARCEIRO_EXE10
				VALUES (@CD_CLIENTE, @NM_CLIENTE, @CPF, @DATA)  
			END
		ELSE
			BEGIN
				INSERT INTO TB_CLIENTE_ALVO_EXE10
				VALUES (@CD_CLIENTE, @NM_CLIENTE, @CPF, @DATA)
			END
			
		FETCH C_CURSOR_COPIA_CLIENTE_EXE10 INTO @CD_CLIENTE, @NM_CLIENTE, @CPF, @DATA, @QUANTIDADE
	END
CLOSE C_CURSOR_COPIA_CLIENTE_EXE10
DEALLOCATE C_CURSOR_COPIA_CLIENTE_EXE10

	INSERT INTO TB_CLIENTE_EXE10
	VALUES (001, 'JULIANO', 253698452, '2009/07/02'),  
		(002, 'FERNANDA', 254215352, '2010/11/05'),
		(003, 'CRISTIANO', 12565236, '2011/02/10'),
		(004, 'ROBERTA', 85423657, '2014/08/04')

INSERT INTO TB_CLIENTE_EXE10
VALUES (005, 'ANA', 256445152, '2008/07/02')  


INSERT INTO TB_VENDAS_EXE10 (DT_VENDA, CD_CLIENTE, CD_PRODUTO,
							QUANTIDADE, VALOR_TOTAL)
VALUES ('2011/04/09', 001, 5248, 10, 75.0),
		('2012/08/07', 003, 147, 40, 425.30),
		('2015/12/04', 004, 7852, 80, 1500.45),
		('2010/08/12', 002, 1782, 5, 750.80),
		('2010/09/02', 001, 4587, 70, 1100.30)

		
INSERT INTO TB_VENDAS_EXE10 (DT_VENDA, CD_CLIENTE, CD_PRODUTO,
							QUANTIDADE, VALOR_TOTAL)
VALUES ('2011/04/09', 005, 5248, 7, 75.0)



EXEC SP_COPIA_CLIENTE_EXE10

SELECT * FROM TB_CLIENTE_EXE10
SELECT * FROM TB_CLIENTE_PARCEIRO_EXE10
SELECT *FROM TB_CLIENTE_ALVO_EXE10
SELECT * FROM TB_VENDAS_EXE10



