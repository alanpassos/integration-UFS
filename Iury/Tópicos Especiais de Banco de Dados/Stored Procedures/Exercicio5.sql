/*1.Criar um procedimento para calcular o IMPOSTO DE RENDA a ser pago em  função de uma  determinada  Renda.  O  procedimento  deve  
apresentar  como  parâmetro  de  entrada  a Renda,  e  como  parâmetro  de  saída  o  imposto  a  ser  pago.  Considere  as  seguintes
informações para cálculo do imposto:

Rendimentos do Trabalho: 15% e 27,5% conforme tabela progressiva mensal abaixo reproduzida: 
*/


ALTER PROCEDURE SP_CALCULAR_IMPOSTO_RENDA (@RENDA NUMERIC(10,2), @PAGAMENTO NUMERIC(10,2) OUTPUT) AS
IF (@RENDA < 1372.82) 
BEGIN
	SET @PAGAMENTO = 0
END
ELSE IF ((@RENDA >= 1372.82) AND (@RENDA <= 2743.25))
BEGIN
	SET @PAGAMENTO = (@RENDA * 0.15) - 205.92
END
ELSE
BEGIN
	SET @PAGAMENTO = (@RENDA * 0.275) - 548.82
END

DECLARE @PAGAMENTO NUMERIC(10,2)
EXEC SP_CALCULAR_IMPOSTO_RENDA 1372.81, @PAGAMENTO OUTPUT
PRINT @PAGAMENTO


DECLARE @PAGAMENTO NUMERIC(10,2)
EXEC SP_CALCULAR_IMPOSTO_RENDA 1372.82, @PAGAMENTO OUTPUT
PRINT @PAGAMENTO


DECLARE @PAGAMENTO NUMERIC(10,2)
EXEC SP_CALCULAR_IMPOSTO_RENDA 2743.26, @PAGAMENTO OUTPUT
PRINT @PAGAMENTO