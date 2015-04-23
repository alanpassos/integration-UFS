/*
As quest�es abaixo devem ser resolvidas com base no esquema do arquivo 
Exercicio 08
.sql
1.
A tabela TB_FAIXA
_
SALARIAL cont�m as faixas salariais v�lidas para um determinado 
cargo   e   escolaridade.   Criar   um   procedimento   armazenado   que,   dado   um   c
argo, 
escolaridade  e  sal�rio,  verifique  se  o  sal�rio  �  v�lido.  Observa��o:  Utilize  a  tabela 
TB_FAIXA_SALARIAL  no  procedimento  uma  vez  que  as  faixas  salariais  s�o  alteradas 
constantemente
*/

CREATE PROCEDURE SP_VALIDA_CARGO_ESCOLARIDADE_SALARIO (@CARGO INT, @ESCOLARIDADE INT,
								@SALARIO NUMERIC(10,2), @MENSAGEM BIT OUTPUT) AS
DECLARE @SP_CARGO INT, @SP_ESCOLARIDADE INT, @SP_MINIMO NUMERIC (10,2), @SP_MAXIMO NUMERIC (10,2)
DECLARE C_CURSOR CURSOR FOR
SELECT F.CD_CARGO, F.CD_ESCOLARIDADE, F.MENOR_VALOR, F.MAIOR_VALOR FROM TB_FAIXASALARIAL F

OPEN C_CURSOR
FETCH C_CURSOR INTO @SP_CARGO, @SP_ESCOLARIDADE, @SP_MINIMO, @SP_MAXIMO

WHILE (@@FETCH_STATUS = 0)
	BEGIN
		IF (@CARGO = @SP_CARGO AND @ESCOLARIDADE = @SP_ESCOLARIDADE)
			BEGIN
				IF (@SALARIO >= @SP_MINIMO AND @SALARIO <= @SP_MAXIMO)
				BEGIN
					SET @MENSAGEM = 1
				END
			ELSE
				BEGIN
					SET @MENSAGEM = 0
				END
			END
			FETCH C_CURSOR INTO @SP_CARGO, @SP_ESCOLARIDADE, @SP_MINIMO, @SP_MAXIMO
		END
CLOSE C_CURSOR
DEALLOCATE C_CURSOR

DECLARE @MENSAGEM BIT
EXEC SP_VALIDA_CARGO_ESCOLARIDADE_SALARIO 1, 2, 1200.0, @MENSAGEM OUTPUT
PRINT @MENSAGEM 


/*
2.
Criar   um   procedimento   armazenado   utilizando   cursores   para   percorrer
a   tabela 
TB_FUNCIONARIO e, para cada funcion�rio, verificar, utilizando o procedimento criado 
na  quest�o  1,  se  o  sal�rio  representa  um  sal�rio  v�lido  para  o  cargo  e  escolaridade.  Se  o 
sal�rio n�o for v�lido, deve ser inclu�do um registro na tabela TB_LOG_
FUNCIONARIO 
informando que o sal�rio para o funcion�rio n�o � v�lido. 
*/
CREATE PROCEDURE SP_ATUALIZA_LOG_FUNCIONARIO AS
DECLARE @MATRICULA INT, @CARGO INT, @ESCOLARIDADE INT, @SALARIO NUMERIC(10,2), @RESULTADO BIT
DECLARE C_ATUALIZA_LOG CURSOR FOR
SELECT F.MATRICULA, F.CD_CARGO, F.CD_ESCOLARIDADE, F.SALARIO FROM TB_FUNCIONARIO_2 F

OPEN C_ATUALIZA_LOG
FETCH C_ATUALIZA_LOG INTO @MATRICULA, @CARGO, @ESCOLARIDADE, @SALARIO

WHILE (@@FETCH_STATUS = 0)
	BEGIN
		EXEC SP_VALIDA_CARGO_ESCOLARIDADE_SALARIO @CARGO, @ESCOLARIDADE, @SALARIO, @RESULTADO OUTPUT
		IF (@RESULTADO = 0)
			BEGIN
				INSERT INTO TB_LOG_FUNCIONARIO
				VALUES (@MATRICULA, 'SAL�RIO N�O V�LIDO', GETDATE()) 
			END

		FETCH C_ATUALIZA_LOG INTO @MATRICULA, @CARGO, @ESCOLARIDADE, @SALARIO
	END
CLOSE C_ATUALIZA_LOG
DEALLOCATE C_ATUALIZA_LOG

-----------------------TESTES DE VERIFICA��O-----------------------------------------
INSERT INTO TB_FUNCIONARIO_2
VALUES (001, 'JOS�', 1, 1, 1100.0),
		(002, 'JULIANA', 2, 3, 1000.0),
		(003, 'WILSON', 3, 3, 3400.0),
		(004, 'ROMEU', 2, 1, 800.0)

SELECT * FROM TB_FUNCIONARIO_2
SELECT * FROM TB_FAIXASALARIAL
SELECT * FROM TB_LOG_FUNCIONARIO

EXEC SP_ATUALIZA_LOG_FUNCIONARIO
