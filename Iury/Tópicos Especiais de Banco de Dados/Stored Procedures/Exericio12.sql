SET DATEFORMAT YMD

CREATE TABLE TB_VENDAS_EXE12 (
	CD_VENDA INT NOT NULL IDENTITY(1,1),
	DT_VENDA DATETIME NOT NULL,
	MATRICULA INT NOT NULL,
	CD_PRODUTO INT NOT NULL,
	QUANTIDADE NUMERIC(10,2) NOT NULL 
)

INSERT INTO TB_VENDAS_EXE12 
VALUES ('2009-01-01', 10, 1001, 50.00),
		('2009-01-01', 10, 1002, 50.00),
		('2009-02-01', 10, 1001, 150.00),
		('2009-01-01', 30, 1001, 200.00),
		('2009-01-01', 30, 1001, 100.00),
		('2009-02-01', 30, 1001, 150.00),
		('2009-05-01', 40, 1002, 100.00),
		('2009-05-10', 40, 1002, 200.00),
		('2009-07-01', 40, 1001, 250.00)

CREATE TABLE TB_VENDAS_MENSAL_EXE12(
	
	MATRICULA INT NOT NULL,
	ANO INT NOT NULL,
	MES INT NOT NULL,
	MES_ATUAL NUMERIC(10,2),
	MES_ANTERIOR NUMERIC(10,2) NOT NULL,
	VARIACAO NUMERIC(6,6) NOT NULL
)

ALTER PROCEDURE SP_CALCULA_VALOR_MES_ATUAL_EXE12 (@MATRICULA INT, @MES INT, @ANO INT,
												 @VALOR NUMERIC(10,2) OUTPUT) AS

DECLARE @MATRICULA_A INT, @MES_A INT, @ANO_A INT, @QUANTIDADE_A NUMERIC(10,2), @QUANTIDADE_TOTAL NUMERIC(10,2) = 0.0
DECLARE C_CALCULO_TOTAL CURSOR FOR
SELECT V.MATRICULA, MONTH(V.DT_VENDA), YEAR(V.DT_VENDA), V.QUANTIDADE FROM TB_VENDAS_EXE12 V

OPEN C_CALCULO_TOTAL
FETCH C_CALCULO_TOTAL INTO @MATRICULA_A, @MES_A, @ANO_A, @QUANTIDADE_A

WHILE (@@FETCH_STATUS = 0)
	BEGIN
		IF (@MATRICULA_A = @MATRICULA AND @MES_A = @MES AND @ANO_A = @ANO)
			BEGIN
				
				SET @QUANTIDADE_TOTAL = @QUANTIDADE_TOTAL + @QUANTIDADE_A
			END

		FETCH C_CALCULO_TOTAL INTO @MATRICULA_A, @MES_A, @ANO_A, @QUANTIDADE_A
	END
SET @VALOR = @QUANTIDADE_TOTAL
CLOSE C_CALCULO_TOTAL
DEALLOCATE C_CALCULO_TOTAL 

ALTER PROCEDURE SP_CALCULA_VARIACAO_VENDA_EXE12 (@MATRICULA INT, @MES INT, @ANO INT, @QUANTIDADE NUMERIC(10,2),
												 @VALOR NUMERIC(10,2) OUTPUT, @QUANTIDADE_MES_ANTERIOR NUMERIC(10,2) OUTPUT) AS

SET @QUANTIDADE_MES_ANTERIOR = 0.0
DECLARE @MES_SP INT = @MES, @ANO_SP INT = @ANO
IF (@MES_SP = 1)
	BEGIN
		SET @MES_SP = 13
		SET @ANO_SP = @ANO_SP - 1
	END
DECLARE @MATRICULA_A INT, @MES_A INT, @ANO_A INT, @QUANTIDADE_A NUMERIC(10,2)
DECLARE C_CALCULO_VENDA CURSOR FOR
SELECT V.MATRICULA, MONTH(V.DT_VENDA), YEAR(V.DT_VENDA), V.QUANTIDADE FROM TB_VENDAS_EXE12 V

OPEN C_CALCULO_VENDA
FETCH C_CALCULO_VENDA INTO @MATRICULA_A, @MES_A, @ANO_A, @QUANTIDADE_A

WHILE (@@FETCH_STATUS = 0)
	BEGIN
		IF (@MATRICULA_A = @MATRICULA AND @MES_A = (@MES_SP - 1) AND @ANO_A = @ANO_SP)
			BEGIN
				
				SET @QUANTIDADE_MES_ANTERIOR = @QUANTIDADE_MES_ANTERIOR + @QUANTIDADE_A
			END

		FETCH C_CALCULO_VENDA INTO @MATRICULA_A, @MES_A, @ANO_A, @QUANTIDADE_A
	END

IF (@QUANTIDADE_MES_ANTERIOR <> 0.0)
	SET @VALOR = (@QUANTIDADE - @QUANTIDADE_MES_ANTERIOR) / @QUANTIDADE_MES_ANTERIOR
ELSE
	SET @VALOR = 0.0

CLOSE C_CALCULO_VENDA
DEALLOCATE C_CALCULO_VENDA 

DECLARE @VALOR NUMERIC(10,2), @QUANTIDADE numeric(10,2)
EXEC SP_CALCULA_VARIACAO_VENDA_EXE12 10, 02, 2009, 150, @VALOR OUTPUT, @QUANTIDADE OUTPUT
PRINT @QUANTIDADE
PRINT @VALOR



ALTER PROCEDURE SP_POVOA_TABELA AS
DECLARE @MATRICULA_SP INT, @ANO_SP INT, @MES_SP INT, @QUANTIDADE_SP NUMERIC(10,2),
							 @MES_ATUAL_SP NUMERIC (10,2), @MES_ANTERIOR_SP NUMERIC(10,2), @VARIACAO NUMERIC(10,2), 
								@VALOR_MES_ATUAL NUMERIC(10,2), @VALOR_MES_ANTERIOR NUMERIC(10,2)
DECLARE @MATRICULA_AUX INT, @MES_AUX INT, @ANO_AUX INT
DECLARE C_SP_POVOA CURSOR FOR
SELECT V.MATRICULA, MONTH(V.DT_VENDA), YEAR(V.DT_VENDA), V.QUANTIDADE FROM TB_VENDAS_EXE12 V

OPEN C_SP_POVOA
FETCH C_SP_POVOA INTO @MATRICULA_SP, @MES_SP, @ANO_SP, @QUANTIDADE_SP
SET @MATRICULA_AUX = @MATRICULA_SP
SET @MES_AUX = 0
SET @ANO_AUX = 0
WHILE (@@FETCH_STATUS = 0)
	BEGIN
		IF (@MATRICULA_SP = @MATRICULA_AUX AND @MES_SP = @MES_AUX)
			BEGIN
				PRINT 'VALOR J� PRESENTE'
			END
		ELSE 
			BEGIN
			EXEC SP_CALCULA_VALOR_MES_ATUAL_EXE12 @MATRICULA_SP, @MES_SP, @ANO_SP, @VALOR_MES_ATUAL OUTPUT
				EXEC SP_CALCULA_VARIACAO_VENDA_EXE12 @MATRICULA_SP, @MES_SP, @ANO_SP, @QUANTIDADE_SP, @VARIACAO OUTPUT, 
														@VALOR_MES_ANTERIOR OUTPUT
	
				--SELECT @MATRICULA_SP AS 'MATRICULA', @ANO_SP AS 'ANO', @MES_SP AS 'MES', @VALOR_MES_ATUAL AS 'MES ATUAL', 
					--					@VALOR_MES_ANTERIOR AS 'MES ANTERIOR', @VARIACAO AS 'VARIACAO'

				INSERT INTO TB_VENDAS_MENSAL_EXE12 
				VALUES (@MATRICULA_SP, @ANO_SP, @MES_SP, @VALOR_MES_ATUAL, @VALOR_MES_ANTERIOR, @VARIACAO)
				
				SET @MATRICULA_AUX = @MATRICULA_SP
				SET @MES_AUX = @MES_SP
				SET @ANO_AUX = @ANO_SP
			END

		FETCH C_SP_POVOA INTO @MATRICULA_SP, @MES_SP, @ANO_SP, @QUANTIDADE_SP

	END
CLOSE C_SP_POVOA
DEALLOCATE C_SP_POVOA


SELECT * FROM TB_VENDAS_EXE12
SELECT * FROM TB_VENDAS_MENSAL_EXE12

EXEC SP_POVOA_TABELA
SELECT * FROM TB_VENDAS_EXE12
SELECT * FROM TB_VENDAS_MENSAL_EXE12

DELETE FROM TB_VENDAS_MENSAL_EXE12

