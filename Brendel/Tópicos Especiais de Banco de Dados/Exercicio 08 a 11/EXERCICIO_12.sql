CREATE TABLE "TB_VENDAS" (
	"CD_VENDAS" INT NOT NULL DEFAULT NULL,
	"MATRICULA" INT NOT NULL DEFAULT NULL,
	"CD_PRODUTO" INT NOT NULL DEFAULT NULL,
	"QUANTIDADE" INT NOT NULL DEFAULT NULL,
	PRIMARY KEY ("CD_VENDAS")
)
;
CREATE TABLE "TB_VENDAS_MENSAL" (
	"MATRICULA" INT NOT NULL DEFAULT NULL,
	"ANO" INT NOT NULL DEFAULT NULL,
	"MES" INT NOT NULL DEFAULT NULL,
	"QUANTIDADE_MES_ATUAL" INT NULL DEFAULT NULL,
	"QUANTIDADE_MES_ANTERIOR" INT NULL DEFAULT NULL,
	"VARIACAO" INT NULL DEFAULT NULL,
	PRIMARY KEY ("MATRICULA")
)
;
-------------------------
ALTER PROCEDURE SP_QUANTIDADE_MES(@MES INT, @ANO INT, @MATRICULA INT, @QUANTIDADETOTAL NUMERIC(10,2) OUTPUT) AS

SET @QUANTIDADETOTAL = (SELECT SUM(V.QUANTIDADE) FROM TB_VENDAS V
WHERE MONTH(V.DT_VENDA) = @MES AND V.MATRICULA = @MATRICULA AND YEAR(V.DT_VENDA) = @ANO)

IF(@QUANTIDADETOTAL IS NULL)
BEGIN
	SET @QUANTIDADETOTAL = 0
END
--------------------------------------

ALTER PROCEDURE SP_MES_ANTERIOR(@MES INT, @ANO INT,  @RETORNO_MES INT OUTPUT, @RETORNO_ANO INT OUTPUT) AS                                               
SET @RETORNO_MES = @MES
SET @RETORNO_ANO = @ANO
IF(@MES > 1)
BEGIN
	SET @RETORNO_MES -= 1
END
ELSE
BEGIN
	SET @RETORNO_MES = 12
	SET @RETORNO_ANO -= 1
END


-----------------------------------

CREATE PROCEDURE SP_POVOA_VENDA_MENSAL AS                                                  
                                                                                           
                                             
                                                                                           
DECLARE @MESANTERIOR INT
DECLARE @ANOANTERIOR INT
DECLARE @QUANTIDADEMESANTERIOR INT
DECLARE @QUANTIDADEMESATUAL INT                                                            
                                                                                                                                                              
DECLARE @MATRICULA INT                                                                  
DECLARE @MESATUAL INT
DECLARE @ANOATUAL INT
DECLARE @VARIACAO NUMERIC (10,2)
                                                                  
                                                                                           
DECLARE C_VENDA CURSOR FOR                                                                 
	SELECT V.MATRICULA, MONTH(V.DT_VENDA), YEAR(V.DT_VENDA) FROM TB_VENDAS V
	GROUP BY MONTH(V.DT_VENDA), V.MATRICULA, YEAR(V.DT_VENDA)
OPEN C_VENDA                                                                        
FETCH C_VENDA INTO @MATRICULA, @MESATUAL, @ANOATUAL    
                                                                                    
WHILE(@@FETCH_STATUS = 0)                                                               
	BEGIN                                                                            
		EXEC SP_QUANTIDADE_MES @MESATUAL, @ANOATUAL, @MATRICULA, @QUANTIDADEMESATUAL OUTPUT
	
		EXEC SP_MES_ANTERIOR @MESATUAL, @ANOATUAL, @MESANTERIOR OUTPUT, @ANOANTERIOR OUTPUT
		
		EXEC SP_QUANTIDADE_MES @MESANTERIOR, @ANOANTERIOR, @MATRICULA, @QUANTIDADEMESANTERIOR OUTPUT	
		
		
		SET @VARIACAO = 0	
		IF(@QUANTIDADEMESANTERIOR <> 0)
		BEGIN
			SET @VARIACAO = (@QUANTIDADEMESATUAL - @QUANTIDADEMESANTERIOR)
			SET @VARIACAO /= @QUANTIDADEMESANTERIOR
		END
		
		INSERT INTO TB_VENDAS_MENSAL VALUES (@MATRICULA, @ANOATUAL, @MESATUAL, @QUANTIDADEMESATUAL, @QUANTIDADEMESANTERIOR, @VARIACAO )                                                                                                                                        
		FETCH C_VENDA INTO  @MATRICULA, @MESATUAL, @ANOATUAL   
	END            
CLOSE C_VENDA     
DEALLOCATE C_VENDA
            
			                                                                           