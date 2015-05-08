ALTER FUNCTION SF_TO_CHAR (@Datetime DATETIME, @MASCARA VARCHAR(32))
RETURNS VARCHAR(32)
AS
BEGIN
    DECLARE @STRING_DATA VARCHAR(32)
    SET @STRING_DATA = @MASCARA
    IF (CHARINDEX ('YYYY',@STRING_DATA) > 0)
       SET @STRING_DATA = REPLACE(@STRING_DATA, 'YYYY',
                         DATENAME(YY, @Datetime))
    IF (CHARINDEX ('YY',@STRING_DATA) > 0)
       SET @STRING_DATA = REPLACE(@STRING_DATA, 'YY',
                         RIGHT(DATENAME(YY, @Datetime),2))
    IF (CHARINDEX ('Month',@STRING_DATA) > 0)
       SET @STRING_DATA = REPLACE(@STRING_DATA, 'Month',
                         DATENAME(MM, @Datetime))
    IF (CHARINDEX ('MM',@STRING_DATA) > 0)
       SET @STRING_DATA = REPLACE(@STRING_DATA, 'MM',
                  RIGHT('0'+CONVERT(VARCHAR,DATEPART(MM, @Datetime)),2))
    IF (CHARINDEX ('DD',@STRING_DATA) > 0)
       SET @STRING_DATA = REPLACE(@STRING_DATA, 'DD',
                         RIGHT('0'+DATENAME(DD, @Datetime),2))
   IF (CHARINDEX ('HH',@STRING_DATA) > 0)
       SET @STRING_DATA = REPLACE(@STRING_DATA, 'HH',
                         RIGHT('0'+DATENAME(HH, @Datetime),2))
   IF (CHARINDEX ('MI',@STRING_DATA) > 0)
       SET @STRING_DATA = REPLACE(@STRING_DATA, 'MI',
                     	 RIGHT('0'+DATENAME(MI, @Datetime),2))
	IF (CHARINDEX ('SS',@STRING_DATA) > 0)
       SET @STRING_DATA = REPLACE(@STRING_DATA, 'SS',
                          RIGHT('0'+DATENAME(SS, @Datetime),2))
RETURN @STRING_DATA
END