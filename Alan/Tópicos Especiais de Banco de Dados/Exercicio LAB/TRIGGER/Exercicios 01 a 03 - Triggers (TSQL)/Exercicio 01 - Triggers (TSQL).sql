CREATE INDEX IDX_RG ON TB_ALUNO(RG)
CREATE INDEX IDX_TELEFONE ON TB_ALUNO(TELEFONE)
CREATE INDEX IDX_ENDERECO ON TB_ALUNO(ENDERECO)
CREATE INDEX IDX_PENDENCIA ON TB_LOG_PENDENCIAS(PENDENCIA)


-- PRIMEIRA QUEST�O TERMINAR
-------------------------------------------------------------------------------------------------------
-- TRIGGER  UPDATE INSERT E DELETE ONDE ATUALIZA A TABELA DE LOG DE ALUNO
-- ATUALIZADO
-------------------------------------------------------------------------------------------------------
ALTER TRIGGER TG_INSERT_ALUNO ON TB_ALUNO
AFTER INSERT, UPDATE, DELETE
AS
		DELETE TB_LOG_PENDENCIAS WHERE MATRICULA = (SELECT TOP 1 MATRICULA FROM inserted) 
		DELETE TB_LOG_PENDENCIAS WHERE MATRICULA = (SELECT TOP 1 MATRICULA FROM deleted)

		
		INSERT INTO TB_LOG_PENDENCIAS SELECT MATRICULA,NOME,'FALTA RG' FROM inserted WHERE RG IS NULL
		INSERT INTO TB_LOG_PENDENCIAS SELECT MATRICULA,NOME,'FALTA TELEFONE' FROM inserted WHERE TELEFONE IS NULL
		INSERT INTO TB_LOG_PENDENCIAS SELECT MATRICULA,NOME,'FALTA ENDERECO' FROM inserted WHERE ENDERECO IS NULL



-------------------------------------------------------------------------------------------------------
--------------------------/CONSULTAS E INSERTS/-----------------------------------------------------
-------------------------------------------------------------------------------------------------------

SELECT * FROM TB_ALUNO
SELECT * FROM TB_LOG_PENDENCIAS


INSERT INTO TB_ALUNO(MATRICULA,NOME,RG,ENDERECO) VALUES(10,'ALAN',1234,'NUMERO')

CREATE TABLE TB_AUX_ALUNO (
    MATRICULA INT NOT NULL PRIMARY KEY,
    NOME VARCHAR(50) NOT NULL,
    RG INT NULL,
    ENDERECO VARCHAR(100) NULL,
    TELEFONE VARCHAR (20) NULL,
)

INSERT INTO TB_AUX_ALUNO VALUES
(1,'JOAO',443,NULL,'222-3333'),
(2,'PEDRO',NULL,'RUA A','221-3333'),
(3,'PEDRO',435,'RUA B',NULL)


INSERT INTO TB_ALUNO 
SELECT * FROM TB_AUX_ALUNO

TRUNCATE TABLE TB_LOG_PENDENCIAS
TRUNCATE TABLE TB_ALUNO
TRUNCATE TABLE TB_AUX_ALUNO




SELECT * FROM TB_ALUNO
SELECT * FROM TB_LOG_PENDENCIAS
DELETE TB_ALUNO WHERE MATRICULA = 1
UPDATE TB_ALUNO SET RG = 1234 WHERE MATRICULA = 2