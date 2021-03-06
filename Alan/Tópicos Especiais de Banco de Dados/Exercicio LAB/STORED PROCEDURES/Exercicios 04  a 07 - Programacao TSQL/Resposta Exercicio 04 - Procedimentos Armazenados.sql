1. Criar uma tabela TB_CLIENTE com a seguinte estrutura:

MATRICULA INT
NOME VARCHAR(40)
TELEFONE VARCHAR(10)

CREATE TABLE TB_CLIENTE (
	MATRICULA INT NOT NULL PRIMARY KEY,
	NOME VARCHAR(40) NOT NULL,
	TELEFONE VARCHAR(10)  NULL
)


2. Criar um procedimento armazenado, SP_INCLUI_CLIENTE, 
   para incluir um novo Cliente. O procedimento deve apresentar como 
   par�metros de entrada a Matr�cula, o Nome e o Telefone do 
   Cliente a ser inclu�do.

CREATE PROCEDURE SP_INCLUI_CLIENTE (@MATRICULA INT, @NOME VARCHAR(40),
				    @TELEFONE VARCHAR(10))
AS
INSERT INTO TB_CLIENTE (MATRICULA, NOME, TELEFONE)
VALUES (@MATRICULA, @NOME, @TELEFONE)

-- TESTE

EXEC SP_INCLUI_CLIENTE 1, 'JOAO', '234-8833'
EXEC SP_INCLUI_CLIENTE NULL, 'JOAO', '234-8833'
SELECT * FROM TB_CLIENTE


3. Criar um procedimento armazenado, SP_REMOVE_CLIENTE, 
   para remover um Cliente cadastrado. O procedimento deve 
   apresentar como par�metro de entrada a Matr�cula do Cliente a ser removido.

ALTER PROCEDURE SP_REMOVE_CLIENTE (@MATRICULA INT)
AS
DELETE FROM TB_CLIENTE
WHERE MATRICULA = @MATRICULA

-- TESTE
EXEC SP_REMOVE_CLIENTE 1


4. Alterar os procedimentos dos itens 2 e 3 para incluir um par�metro
   de sa�da a fim de informar o resultado da execu��o do procedimento.

ALTER PROCEDURE SP_INCLUI_CLIENTE (@MATRICULA INT, @NOME VARCHAR(40),
				    @TELEFONE VARCHAR(10),
				    @MENSAGEM VARCHAR(50) OUTPUT)
AS
INSERT INTO TB_CLIENTE (MATRICULA, NOME, TELEFONE)
VALUES (@MATRICULA, @NOME, @TELEFONE)
IF @@ERROR = 0 
    SET @MENSAGEM = 'CLIENTE INCLUIDO COM SUCESSO'
ELSE 
     SET @MENSAGEM = 'CLIENTE NAO INCLUIDO COM SUCESSO'

-- TESTE
DELETE FROM TB_CLIENTE
DECLARE @MENSAGEM VARCHAR(50)
EXEC SP_INCLUI_CLIENTE 1, 'JOAO', '234-8833', @MENSAGEM OUTPUT
PRINT @MENSAGEM

DECLARE @MENSAGEM VARCHAR(50)
EXEC SP_INCLUI_CLIENTE NULL, 'JOAO', '234-8833', @MENSAGEM OUTPUT
PRINT @MENSAGEM

SELECT * FROM TB_CLIENTE


5. Criar um procedimento armazenado, SP_ALTERA_CLIENTE, para alterar
   as informa��es (Nome e Telefone) de um Cliente cadastrado. 
   O procedimento deve apresentar como par�metros de entrada a Matr�cula,
   o Nome e o Telefone do Cliente.

ALTER PROCEDURE SP_ALTERA_CLIENTE (@MATRICULA INT, @NOME VARCHAR(40),
				    @TELEFONE VARCHAR(10),
				    @MENSAGEM VARCHAR(50) OUTPUT)
AS
BEGIN
DECLARE @ERRO INT,
	@ROWCOUNT INT

UPDATE TB_CLIENTE 
SET NOME = @NOME,
    TELEFONE = @TELEFONE
WHERE MATRICULA = @MATRICULA
SELECT @ERRO = @@ERROR, @ROWCOUNT = @@ROWCOUNT
IF @ERRO = 0  
    BEGIN
	IF @ROWCOUNT = 1
	    SET @MENSAGEM = 'CLIENTE ALTERADO COM SUCESSO'	   	
	ELSE
	    SET @MENSAGEM = 'MATRICULA INVALIDA'
    END	
ELSE 
     SET @MENSAGEM = 'ERRO AO ALTERAR CLIENTE'
END

-- TESTE
DECLARE @MENSAGEM VARCHAR(50)
EXEC SP_ALTERA_CLIENTE 3, 'JOAO R', '234-8555', @MENSAGEM OUTPUT
PRINT @MENSAGEM

SELECT * FROM TB_CLIENTE



6. Alterar o procedimento SP_ALTERA_CLIENTE para adicionar a seguinte
   funcionalidade: Se o valor do par�metro passado 
   for nulo (NULL) o atributo correspondente n�o deve ser modificado.

-- Solucao 1.

ALTER PROCEDURE SP_ALTERA_CLIENTE (@MATRICULA INT, @NOME VARCHAR(40),
				    @TELEFONE VARCHAR(10),
				    @MENSAGEM VARCHAR(50) OUTPUT)
AS
BEGIN
DECLARE @ERRO INT,
	@ROWCOUNT INT

UPDATE TB_CLIENTE 
SET NOME = CASE 
	     WHEN @NOME IS NULL THEN NOME
	     ELSE @NOME
	   END,
    TELEFONE = CASE
		  WHEN @TELEFONE IS NULL THEN TELEFONE
		  ELSE @TELEFONE
		END
WHERE MATRICULA = @MATRICULA
SELECT @ERRO = @@ERROR, @ROWCOUNT = @@ROWCOUNT
IF @@ERROR = 0  
    BEGIN
	IF @ROWCOUNT = 1
	    SET @MENSAGEM = 'CLIENTE ALTERADO COM SUCESSO'	   	
	ELSE
	    SET @MENSAGEM = 'MATRICULA INVALIDA'
    END	
ELSE 
     SET @MENSAGEM = 'ERRO AO ALTERAR CLIENTE'
END


DECLARE @MENSAGEM VARCHAR(50)
EXEC SP_ALTERA_CLIENTE 1, NULL, NULL, @MENSAGEM OUTPUT
PRINT @MENSAGEM

SELECT * FROM TB_CLIENTE


-- Solucao 2.

ALTER PROCEDURE SP_ALTERA_CLIENTE (@MATRICULA INT, @NOME VARCHAR(40),
				    @TELEFONE VARCHAR(10),
				    @MENSAGEM VARCHAR(50) OUTPUT)
AS
BEGIN
DECLARE @ERRO INT,
	@ROWCOUNT INT

UPDATE TB_CLIENTE 
SET NOME = ISNULL(@NOME,NOME),
    TELEFONE = ISNULL(@TELEFONE,TELEFONE)
WHERE MATRICULA = @MATRICULA
SELECT @ERRO = @@ERROR, @ROWCOUNT = @@ROWCOUNT
IF @@ERROR = 0  
    BEGIN
	IF @ROWCOUNT = 1
	    SET @MENSAGEM = 'CLIENTE ALTERADO COM SUCESSO'	   	
	ELSE
	    SET @MENSAGEM = 'MATRICULA INVALIDA'
    END	
ELSE 
     SET @MENSAGEM = 'ERRO AO ALTERAR CLIENTE'
END


DECLARE @MENSAGEM VARCHAR(50)
EXEC SP_ALTERA_CLIENTE 1, NULL, '4433-3333', @MENSAGEM OUTPUT
PRINT @MENSAGEM

SELECT * FROM TB_CLIENTE
