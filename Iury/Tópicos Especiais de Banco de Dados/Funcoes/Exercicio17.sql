ALTER FUNCTION SF_TO_DATE (@DATA VARCHAR(60), @MASCARA VARCHAR(60))
RETURNS DATETIME AS
	BEGIN
		
		DECLARE @HORA VARCHAR(2), @MINUTOS VARCHAR(2), @SEGUNDOS VARCHAR(2), @DIA VARCHAR(2), @MES VARCHAR(2), @ANO VARCHAR(4),
				@INDEXHORA INT, @INDEXMINUTOS INT, @INDEXSEGUNDOS INT, @INDEXDIA INT, @INDEXMES INT,
				@INDEXANO INT,
				@DATARETORNO VARCHAR(60),
				@DATAFINAL DATETIME
		
		SET @INDEXHORA = CHARINDEX('HH', @MASCARA)
		SET @INDEXMINUTOS = CHARINDEX('MI', @MASCARA)
		SET @INDEXSEGUNDOS = CHARINDEX('SS', @MASCARA) 
		SET @INDEXDIA = CHARINDEX('DD', @MASCARA)
		SET @INDEXMES = CHARINDEX('MM', @MASCARA)
		SET @INDEXANO = CHARINDEX('YYYY', @MASCARA)

		SET @HORA = dbo.SF_LPAD(SUBSTRING(@DATA, @INDEXHORA, 2), 2, '0')
		SET @MINUTOS = dbo.SF_LPAD(SUBSTRING(@DATA, @INDEXMINUTOS, 2), 2, '0')
		SET @SEGUNDOS = dbo.SF_LPAD(SUBSTRING(@DATA, @INDEXSEGUNDOS, 2), 2, '0')
		SET @DIA = dbo.SF_LPAD(SUBSTRING(@DATA, @INDEXDIA, 2), 2, '0')
		SET @MES = dbo.SF_LPAD(SUBSTRING(@DATA, @INDEXMES, 2), 2, '0')
		SET @ANO = SUBSTRING(@DATA, @INDEXANO, 4)

		SET @DATARETORNO = CONCAT(@ANO, @MES, @DIA,' ', @HORA,':', @MINUTOS,':', @SEGUNDOS)
		SET @DATAFINAL = CONVERT(DATETIME, @DATARETORNO, 0)
		RETURN @DATAFINAL

	END

	set language portuguese
	set dateformat ymd
	DECLARE @DATA DATETIME2 = '01/12/2014 12:44:13'
	EXEC @DATA = SF_TO_DATE '01/12/2014', 'DD/MM/YYYY'
	PRINT @DATA
