/*
Criar um procedimento para calcular o IMPOSTO DE RENDA a ser pago em fun��o de
uma determinada Renda. O procedimento deve apresentar como par�metro de entrada a
Renda, e como par�metro de sa�da o imposto a ser pago. Considere as seguintes
informa��es para c�lculo do imposto:
*/

CREATE PROCEDURE IMPOSTO_DE_RENDA 
(@RENDA NUMERIC(10,2), @IMPOSTO NUMERIC(10,2) OUTPUT) AS
IF(@RENDA <= 1372.81)
	BEGIN
		SET @IMPOSTO = 0
	END 
ELSE
	BEGIN 
		IF((@RENDA >=  1372.82) AND ( @RENDA <= 2743.25))
			BEGIN
				SET @IMPOSTO = ((@RENDA * 15)/100) - 205.92
			END
		ELSE 
			BEGIN
				SET @IMPOSTO = ((@RENDA * 27.5)/100)- 548.82
			END
	END

DECLARE @IMPOSTO NUMERIC(10,2)
EXEC IMPOSTO_DE_RENDA 2743.25,@IMPOSTO OUTPUT
PRINT @IMPOSTO
