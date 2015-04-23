/*
As questões abaixo devem ser resolvidas com base no esquema do arquivo 
Exercicio 08
.sql
1.
A tabela TB_FAIXA
_
SALARIAL contém as faixas salariais válidas para um determinado 
cargo   e   escolaridade.   Criar   um   procedimento   armazenado   que,   dado   um   c
argo, 
escolaridade  e  salário,  verifique  se  o  salário  é  válido.  Observação:  Utilize  a  tabela 
TB_FAIXA_SALARIAL  no  procedimento  uma  vez  que  as  faixas  salariais  são  alteradas 
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
TB_FUNCIONARIO e, para cada funcionário, verificar, utilizando o procedimento criado 
na  questão  1,  se  o  salário  representa  um  salário  válido  para  o  cargo  e  escolaridade.  Se  o 
salário não for válido, deve ser incluído um registro na tabela TB_LOG_
FUNCIONARIO 
informando que o salário para o funcionário não é válido. 
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
				VALUES (@MATRICULA, 'SALÁRIO NÃO VÁLIDO', GETDATE()) 
			END

		FETCH C_ATUALIZA_LOG INTO @MATRICULA, @CARGO, @ESCOLARIDADE, @SALARIO
	END
CLOSE C_ATUALIZA_LOG
DEALLOCATE C_ATUALIZA_LOG

-----------------------TESTES DE VERIFICAÇÃO-----------------------------------------
INSERT INTO TB_FUNCIONARIO_2
VALUES (001, 'JOSÉ', 1, 1, 1100.0),
		(002, 'JULIANA', 2, 3, 1000.0),
		(003, 'WILSON', 3, 3, 3400.0),
		(004, 'ROMEU', 2, 1, 800.0)

SELECT * FROM TB_FUNCIONARIO_2
SELECT * FROM TB_FAIXASALARIAL
SELECT * FROM TB_LOG_FUNCIONARIO

EXEC SP_ATUALIZA_LOG_FUNCIONARIO
