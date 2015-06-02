--------------------------------------------------------------------------------------------------------
-- TRIGGER PARA VALIDAR A FAIXA SALARIAL DE UM DETERMINADO FUNCIONARIO
--------------------------------------------------------------------------------------------------------
--------------------------------/ TRIGGER /-------------------------------------------------------------
DROP TRIGGER TG_INSERT_FUNCIONARIO
ALTER TRIGGER TG_INSERT_FUNCIONARIO ON TB_FUNCIONARIO
AFTER INSERT, UPDATE
AS
DECLARE @MATRICULA INT, @NOME VARCHAR(30), @CD_CARGO INT, @CD_ESCOLARIDADE INT,@SALARIO NUMERIC(10,2)
	DECLARE C_INSERT CURSOR FOR
	SELECT MATRICULA, NOME,CD_CARGO,CD_ESCOLARIDADE,SALARIO FROM inserted


	OPEN C_INSERT 
	FETCH C_INSERT  INTO @MATRICULA , @NOME , @CD_CARGO , @CD_ESCOLARIDADE ,@SALARIO 
	WHILE(@@FETCH_STATUS = 0)
	BEGIN
		DECLARE @MENOR_VALOR NUMERIC(10,2), @MAIOR_VALOR NUMERIC(10,2),@MENSAGEM_ERRO VARCHAR(50)
		SET @MENOR_VALOR  =(SELECT MENOR_VALOR 
							FROM TB_FAIXASALARIAL 
							WHERE CD_CARGO = @CD_CARGO AND  CD_ESCOLARIDADE = @CD_ESCOLARIDADE)
		SET @MAIOR_VALOR  =(SELECT MAIOR_VALOR
							FROM TB_FAIXASALARIAL 
							WHERE CD_CARGO = @CD_CARGO AND  CD_ESCOLARIDADE = @CD_ESCOLARIDADE)
		IF(@SALARIO < @MENOR_VALOR OR  @MAIOR_VALOR < @SALARIO)
			BEGIN
				SET @MENSAGEM_ERRO='FUNCIONARIO : '+ CONVERT(VARCHAR,(@MATRICULA))+' NAO ESTA DENTRO DA FAIXA SALARIAL';
				RAISERROR(@MENSAGEM_ERRO,1,1)
				ROLLBACK
				
			END
			FETCH C_INSERT  INTO @MATRICULA , @NOME , @CD_CARGO , @CD_ESCOLARIDADE ,@SALARIO 
	END
	CLOSE C_INSERT
	DEALLOCATE C_INSERT
----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
/*

 RAISERROR("MENSAGEM" 
 , 1 ---> SEVERIDADE 1 É UM ERRO MAS NÃO É UM ERRO FATAL
  ,1 ---> STATUS OU ESTADO, QU\NDO RECEBER A MENSAGEM DE ERRO PODER IDENTIFICAR O ESTADO 1 OU ESTADO 2 PARA SABER QUE O ERRO ACONTECEU EM CERTO PONTO DO CODIGO
  )		
 */
----------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM TB_FUNCIONARIO
SELECT * FROM TB_FAIXASALARIAL
TRUNCATE TABLE TB_FUNCIONARIO

-----------------------------------
-----------------------------------

INSERT INTO TB_FUNCIONARIO 
VALUES
(1,'ALAN',1,1,1000),
(2,'BRENDEL',1,2,1200),
(3,'BRENDEL',1,3,1400),
(4,'IURY',2,2,1000)

-----------------------------------
----------------------------------

INSERT INTO TB_FUNCIONARIO 
VALUES
(6,'LETICIA',3,1,6000)

------------------------------
-----------------------------
UPDATE TB_FUNCIONARIO SET SALARIO = 1000.0 WHERE MATRICULA IN (1,2)  



