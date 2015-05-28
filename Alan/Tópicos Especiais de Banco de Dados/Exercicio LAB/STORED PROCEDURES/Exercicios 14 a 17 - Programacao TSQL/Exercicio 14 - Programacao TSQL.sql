/*
Criar uma função para calcular o IMPOSTO DE RENDA a ser pago em função de uma 
determinada Renda. A função deve apresentar como parâmetro de entrada a Renda. 
O retorno da função deve ser o imposto a ser pago. 
Considere as seguintes informações para cálculo do imposto:

*/

CREATE DATABASE AULA_08
USE AULA_08

ALTER FUNCTION IMPOSTO_DE_RENDA (@RENDA NUMERIC(10,2))
RETURNS NUMERIC(10,2)
AS
BEGIN

	DECLARE @IMPOSTO NUMERIC(10,2)
	IF(@RENDA <=1372.81)
		BEGIN
			SET @IMPOSTO = 0
		END
	ELSE
		BEGIN
			IF((@RENDA >=1372.82) AND (@RENDA <=2743.25))
				BEGIN
					SET @IMPOSTO = ((@RENDA * 15)/100) - 205.92
					
				END
			ELSE
				SET @IMPOSTO= ((@RENDA * 27.5)/100)  - 548.82
		END
   
   RETURN  @IMPOSTO
END


DECLARE @IMPOSTO NUMERIC(10,2)
EXEC @IMPOSTO = IMPOSTO_DE_RENDA 1372.82
PRINT @IMPOSTO