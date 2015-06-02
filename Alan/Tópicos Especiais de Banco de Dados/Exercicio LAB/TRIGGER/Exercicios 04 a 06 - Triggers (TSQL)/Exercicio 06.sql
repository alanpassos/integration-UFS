-----------------------------------------------------------------------
-- CRIACAO DO BANCO DE DADOS AULA 06 TRIGGER
-----------------------------------------------------------------------
CREATE DATABASE TRIGGER_AULA06
USE TRIGGER_AULA06
-----------------------------------------------------------------------
-----------------------------------------------------------------------
-------------------/CRIACAO DAS TABELAS/-------------------------------
CREATE TABLE TB_VENDAS (
   CD_VENDA INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
   DT_VENDA DATETIME NOT NULL,
   CD_PRODUTO INT NOT NULL,
   QUANTIDADE INT NOT NULL,
   VALOR NUMERIC(10,2) NOT NULL
)


CREATE TABLE TB_RESUMO_VENDAS (
   CD_PRODUTO INT NOT NULL,
   DT_VENDA DATETIME NOT NULL,
   QUANTIDADE INT NOT NULL,
   VALOR NUMERIC(10,2) NOT NULL,
   PRIMARY KEY (CD_PRODUTO, DT_VENDA)
)


/* Tabela para log de alterações na tabela de Vendas. As alterações podem
   ser de três tipos: (I - Inclusao, A - Alteracao, R - Remocao). O Log
   sempre armazena os valores antigos e os novos valores. Somente os 
   os atributos QUANTIDADE e VALOR podem ser alterados para uma venda. */

CREATE TABLE TB_LOG_VENDAS (
    CD_LOG 		INT IDENTITY (1,1) NOT NULL,
    DT_LOG 		DATETIME NOT NULL,     -- Data em que o log foi registrado
    TIPO_OPERACAO 	CHAR(1) CHECK (TIPO_OPERACAO IN ('I','A','R')),	
    CD_VENDA 		INT NULL,
    CD_PRODUTO 		INT NULL,
    DT_VENDA 		DATETIME NULL,
    QUANTIDADE_ANTIGA   INT NULL,
    VALOR_ANTIGO	NUMERIC(10,2) NULL,
    QUANTIDADE_NOVA	INT NULL,
    VALOR_NOVO		NUMERIC(10,2) NULL 
)