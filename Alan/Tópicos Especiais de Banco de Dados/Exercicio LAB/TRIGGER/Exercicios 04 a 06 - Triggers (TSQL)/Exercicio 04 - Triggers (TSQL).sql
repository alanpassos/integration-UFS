----------------------------------------------------------------------------------
-- CRIACAO DO BANCO DE DADOS PARA A AULA EM LABORATÓRIO 4
----------------------------------------------------------------------------------
CREATE DATABASE TRIGGER_AULA_4

USE TRIGGER_AULA_4
-------------------------/ FIM DA CRIACAO DO BANCO/-------------------------------
----------------------------------------------------------------------------------
-- CRIACAO DAS TABLEAS 
----------------------------------------------------------------------------------
--------------------------/TB_FUNCIONARIO/----------------------------------------
CREATE TABLE TB_FUNCIONARIO(

MATRICULA INT NOT NULL,
NOME VARCHAR(45) NOT NULL,
SALARIO NUMERIC(10,2) NULL,
GRATIFICACAO NUMERIC(10,2) NULL
)

ALTER TABLE TB_FUNCIONARIO ADD CONSTRAINT PK_TB_FUNCIONARIO PRIMARY KEY (MATRICULA)
----------------------------------------------------------------------------------
-------------------------/TB_LOG_AUMENTO_FUNCIONARIO/-----------------------------
CREATE TABLE TB_LOG_AUMENTO_FUNCIONARIO(
MATRICULA  INT NOT NULL,
NOME VARCHAR(45) NOT NULL,
DATA DATETIME NOT NULL,
SALARIO_INTEGRAL_ANTIGO NUMERIC(10,2) NULL,
SALARIO_INTEGRAL_NOVO NUMERIC(10,2) NULL
)

----------------------------------------------------------------------------------
-------------------/CRIACAO DA TRIGGER/-----------------------------------------
----------------------------------------------------------------------------------
ALTER TRIGGER TG_AUMENTO_FUNCIONARIO ON TB_FUNCIONARIO
AFTER UPDATE
AS
  
	  INSERT INTO TB_LOG_AUMENTO_FUNCIONARIO
	  SELECT D.MATRICULA,D.NOME, GETDATE(),(ISNULL(D.SALARIO,0)+ISNULL(D.GRATIFICACAO,0 )) , (ISNULL(I.SALARIO,0)+ISNULL(I.GRATIFICACAO,0)) 
	  FROM DELETED D, INSERTED I
	  WHERE I.MATRICULA = D.MATRICULA AND ((ISNULL(D.SALARIO,0)+ISNULL(D.GRATIFICACAO,0 )) < (ISNULL(I.SALARIO,0)+ISNULL(I.GRATIFICACAO,0))) 
  

  INSERT INTO TB_FUNCIONARIO VALUES
  (1,'ALAN',100,30),
  (2,'BRENDEL',200,50),
  (3,'EDSON',400,100),
  (4,'IURY',500,130)

  UPDATE TB_FUNCIONARIO SET SALARIO = 9,gratificacao = 50 WHERE MATRICULA IN (4,2)
  UPDATE TB_FUNCIONARIO SET SALARIO = 9WHERE MATRICULA IN (2,1)

  SELECT * FROM TB_FUNCIONARIO
  SELECT * FROM TB_LOG_AUMENTO_FUNCIONARIO

  TRUNCATE TABLE TB_FUNCIONARIO  

  TRUNCATE TABLE TB_LOG_AUMENTO_FUNCIONARIO