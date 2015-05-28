----------------------------------------------------------------------------------
-- CRIACAO DO BANCO DE DADOS PARA A AULA EM LABORATÓRIO 4
----------------------------------------------------------------------------------
CREATE DATABASE TRIGGER_AULA_5

USE TRIGGER_AULA_5
-------------------------/ FIM DA CRIACAO DO BANCO/-------------------------------
----------------------------------------------------------------------------------
-- CRIACAO DAS TABLEAS 
----------------------------------------------------------------------------------
--------------------------/TB_FUNCIONARIO/----------------------------------------
CREATE TABLE TB_FUNCIONARIO(

MATRICULA INT NOT NULL,
NOME VARCHAR(45) NOT NULL,
DEPARTAMENTO VARCHAR(45) NOT NULL,
SALARIO NUMERIC(10,2) NULL,
GRATIFICACAO NUMERIC(10,2) NULL
)

ALTER TABLE TB_FUNCIONARIO ADD CONSTRAINT PK_TB_FUNCIONARIO PRIMARY KEY (MATRICULA)
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--------------------/CRIACAO DA TRIGGER/---------------------------------------

ALTER TRIGGER TG_CONTROLE_SALARIAL ON TB_FUNCIONARIO
AFTER UPDATE
AS
DECLARE @MENSAGEM_ERRO VARCHAR(45)
IF((SELECT  I.MATRICULA  
	FROM INSERTED I,DELETED D 
	WHERE ( I.MATRICULA = D.MATRICULA AND  
		  ((ISNULL(D.SALARIO,0)+ ISNULL(D.GRATIFICACAO,0)) * 1.3) < (ISNULL(I.SALARIO,0)+ISNULL(I.GRATIFICACAO,0)) )) IS NOT NULL)
	BEGIN
		SET @MENSAGEM_ERRO='FUNCIONARIO ESTA COM ALMENTO A MAIS DO PERMITIDO';
							RAISERROR(@MENSAGEM_ERRO,1,1)
					ROLLBACK
	END
	



------------------------/FIM DA TRIGGER/--------------------------------------

INSERT INTO TB_FUNCIONARIO VALUES
  (1,'ALAN','TI',100,10),
  (2,'BRENDEL','TI',200,NULL),
  (3,'EDSON','TI',400,100),
  (4,'IURY','TI',500,100)


SELECT * FROM TB_FUNCIONARIO

UPDATE TB_FUNCIONARIO SET GRATIFICACAO = 61 WHERE MATRICULA IN (2)

