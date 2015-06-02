/*
Criar um procedimento SP_CLASSIFICA_CLIENTE para classificar um Cliente como
PARCEIRO ou ALVO. O procedimento deve receber como parâmetros de entrada a data
de inclusão do Cliente e a quantidade de produtos que um Cliente já comprou. O
procedimento deve apresentar um parâmetro de saída informando se o Cliente é
PARCEIRO ou ALVO. O cliente será classificado de acordo com a seguinte regra:

Se a data de inclusão do Cliente é maior ou igual a ‘01/03/2010’ ou a Quantidade de
Produtos já comprados pelo Cliente é maior que 50
 O Cliente é PARCEIRO
Caso Contrário o Cliente é ALVO.
*/

DROP PROCEDURE SP_CLASSIFICA_CLIENTE
ALTER PROCEDURE SP_CLASSIFICA_CLIENTE 
(@DATA_INCLUSAO DATE, @QUANTIDADE_PRODUTOS INT, @TIPO_CLIENTE BIT OUTPUT) AS
	IF(@DATA_INCLUSAO >= '20100301'  AND @QUANTIDADE_PRODUTOS > 50)
		BEGIN
			SET @TIPO_CLIENTE = 1
		END
	ELSE
		BEGIN
			SET @TIPO_CLIENTE = 0
		END

DECLARE @TIPO BIT
EXEC SP_CLASSIFICA_CLIENTE '20100302',51,@TIPO OUTPUT
PRINT @TIPO


/*
Criar um procedimento SP_COPIA_CLENTE utilizando cursores para varrer a tabela
TB_CLIENTE e, utilizando o procedimento desenvolvido da questão 1 e as informações
contidas na tabela TB_VENDAS, copiar as informações de um cliente para a tabela
TB_CLIENTE_ALVO ou para a tabela TB_CLIENTE_PARCEIRO de acordo com sua
classificação. A classificação do Cliente deve ser dada necessariamente pelo procedimento
da questão 1. 

*/


-- INSERINDO DADOS NO BANCO 
-- INSERINDO NA TABELA CLIENTE
SELECT * FROM TB_CLIENTE

INSERT INTO TB_CLIENTE VALUES
(1,'ALAN',1234,'20100301'),
(2,'BRENDEL',1235,'20100201'),
(3,'EDSON',1734,'20150301'),
(4,'IURY',1244,'20130301')

-- INSERINDO NA TABELA DE VENDAS


SELECT * FROM TB_VENDAS
INSERT INTO TB_VENDAS VALUES
(GETDATE(),1,123,90,150),
(GETDATE(),2,124,50,150),
(GETDATE(),3,153,50,150),
(GETDATE(),4,163,70,150)



-- FIM DA INSERÇÃO DE DADOS


-- INICIANDO O PROCEDIMENTO
SELECT * FROM TB_CLIENTE
CREATE PROCEDURE SP_COPIA_CLIENTE AS
DECLARE @CD_CLIENTE INT, @NM_CLIENTE VARCHAR(60),@CPF INT, @DATA_INCLUSAO DATETIME
DECLARE C_CLIENTE_COPIA CURSOR FOR
SELECT C.CD_CLIENTE,C.NM_CLIENTE,C.CPF,C.DT_INCLUSAO FROM TB_CLIENTE C

OPEN C_CLIENTE_COPIA
FETCH C_CLIENTE_COPIA INTO @CD_CLIENTE,@NM_CLIENTE,@CPF,@DATA_INCLUSAO
	WHILE(@@FETCH_STATUS = 0)
		BEGIN
			DECLARE @QUANTIDADE_PRODUTO INT, @DATA DATETIME, @TIPO_CLIENTE BIT, @ERROR INT, @ROWCOUNT INT

			SET @QUANTIDADE_PRODUTO = (SELECT SUM(QUANTIDADE) FROM TB_VENDAS WHERE CD_CLIENTE = @CD_CLIENTE)
			SET @DATA=(SELECT DT_INCLUSAO FROM TB_CLIENTE WHERE CD_CLIENTE = @CD_CLIENTE)

			EXEC SP_CLASSIFICA_CLIENTE @DATA,@QUANTIDADE_PRODUTO,@TIPO_CLIENTE OUTPUT
			IF(@TIPO_CLIENTE = 1)
				BEGIN
					INSERT INTO TB_CLIENTE_PARCEIRO VALUES (@CD_CLIENTE,@NM_CLIENTE,@CPF,@DATA_INCLUSAO)
						SELECT @ERROR = @@ERROR, @ROWCOUNT = @@ROWCOUNT
							IF(@ERROR = 0)
								BEGIN
									IF(@ROWCOUNT = 1)
										BEGIN
											PRINT 'INSERIDO COM SUCESSO TB_CLIENTE_PARCEIRO'
										END	
									ELSE
										BEGIN
											PRINT 'CLIENTE NÃO PODE SER INSERIDO'
										END
								END
							ELSE
								BEGIN
									PRINT 'ERRO AO TENTAR INSERIR'
								END
				END
			ELSE
				BEGIN
					INSERT INTO TB_CLIENTE_ALVO VALUES (@CD_CLIENTE,@NM_CLIENTE,@CPF,@DATA_INCLUSAO)
						SELECT @ERROR = @@ERROR, @ROWCOUNT = @@ROWCOUNT
							IF(@ERROR = 0)
								BEGIN
									IF(@ROWCOUNT = 1)
										BEGIN
											PRINT 'INSERIDO COM SUCESSO TB_CLIENTE_ALVO'
										END	
									ELSE
										BEGIN
											PRINT 'CLIENTE NÃO PODE SER INSERIDO'
										END
								END
							ELSE
								BEGIN
									PRINT 'ERRO AO TENTAR INSERIR'
								END
				END
				FETCH C_CLIENTE_COPIA INTO @CD_CLIENTE,@NM_CLIENTE,@CPF,@DATA_INCLUSAO
			END
CLOSE C_CLIENTE_COPIA
DEALLOCATE C_CLIENTE_COPIA


								
EXEC SP_COPIA_CLIENTE
					
DELETE TB_CLIENTE_PARCEIRO


