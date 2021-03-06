ALTER FUNCTION SF_TO_CHAR (@DATA DATETIME, @MASCARA VARCHAR(60)) 
RETURNS VARCHAR(60) AS
	BEGIN
		DECLARE @HORA INT, @MINUTOS INT, @SEGUNDOS INT, @DIA INT, @MES INT, @NOMEMES VARCHAR(20), @ANOYY VARCHAR(2), @ANOYYYY INT, @DATACONVERTIDA VARCHAR(60)

		SET @HORA = DATEPART(HH, @DATA)
		SET @MINUTOS = DATEPART(MI, @DATA)
		SET @SEGUNDOS = DATEPART(SS, @DATA)
		SET @DIA = DAY(@DATA)
		SET @MES = MONTH(@DATA)
		SET  @NOMEMES = DATENAME(MM, @DATA)
		SET @ANOYY = SUBSTRING(LTRIM(STR(YEAR(@DATA))), 3, 4)
		SET @ANOYYYY = YEAR(@DATA)
		
		SET @DATACONVERTIDA = @MASCARA
		SET @DATACONVERTIDA = REPLACE(@DATACONVERTIDA, 'DD', dbo.SF_LPAD(@DIA, 2, '0'))
		SET @DATACONVERTIDA = REPLACE(@DATACONVERTIDA, 'MM', dbo.SF_LPAD(@MES, 2, '0'))
		SET @DATACONVERTIDA = REPLACE(@DATACONVERTIDA, 'Month', @NOMEMES)
		SET @DATACONVERTIDA = REPLACE (@DATACONVERTIDA, 'YYYY', @ANOYYYY)
		SET @DATACONVERTIDA = REPLACE(@DATACONVERTIDA, 'YY', dbo.SF_LPAD(@ANOYY, 2, '0') )
		SET @DATACONVERTIDA = REPLACE(@DATACONVERTIDA, 'HH', dbo.SF_LPAD(@HORA, 2, '0'))
		SET @DATACONVERTIDA = REPLACE(@DATACONVERTIDA, 'MI', dbo.SF_LPAD(@MINUTOS, 2, '0'))
		SET @DATACONVERTIDA = REPLACE(@DATACONVERTIDA, 'SS', dbo.SF_LPAD(@SEGUNDOS, 2, '0'))
		
		RETURN @DATACONVERTIDA
	END

DECLARE @DATA VARCHAR(60)
DECLARE @DATAHOJE DATETIME = '20150323'
EXEC @DATA =  SF_TO_CHAR '20150323', 'DD DIA MM/YYYY'
PRINT @DATA