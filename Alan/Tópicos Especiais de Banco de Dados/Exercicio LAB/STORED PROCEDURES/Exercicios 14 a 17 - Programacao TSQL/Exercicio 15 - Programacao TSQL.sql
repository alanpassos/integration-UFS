/*
Criar uma função SF_DataCompleta para imprimir datas no seguinte formato: 
12 de Maio de 2002. 
A função deve receber como parâmetro uma data e apresentar como retorno uma cadeia de caracteres. 
Observação: A indicação do idioma pode ser realizada antes da chamada da função.
*/

CREATE FUNCTION SF_DATACOMPLETA(@DATA DATETIME)
RETURNS VARCHAR(100)
AS
BEGIN
   DECLARE @DATA_RETORNO VARCHAR(100), @DIA VARCHAR(30), @MES VARCHAR(30), @ANO VARCHAR(30)

   SET @MES = DATENAME(MM,@DATA)
   SET @DIA = DAY(@DATA)
   SET @ANO = YEAR(@DATA)

    SET @DATA_RETORNO =CAST( (@DIA +' DE ' + @MES+ ' DE '+ @ANO) AS VARCHAR(100))

   RETURN @DATA_RETORNO
END

SET LANGUAGE Brazilian

DECLARE @DATA VARCHAR(100)
EXEC @DATA = SF_DATACOMPLETA '20120908'
PRINT @DATA



/*



Criar uma função SF_LPAD para preencher uma string à esquerda com um caractere especificado. 
A função deve apresentar a seguinte assinatura:
sf_LPAD(@String varchar(8000), @Tamanho int, @Caracter char(1))
 @String representa a string a ser preenchida a partir da esquerda.
 @Tamanho é o tamanho da string que será o retorno da função. 
 Se @Tamanho for menor que o tamanho da string original, a string original será 
 truncada para o tamanho especificado na variável @Tamanho.
 @Caracter é o caractere que será utilizado para preencher a string original a partir da esquerda.

*/

DROP FUNCTION SF_LLAD
ALTER FUNCTION SF_LPAD(@STRING VARCHAR(8000), @TAMANHO INT, @CARACTER char(1)) 
RETURNS VARCHAR(45)
AS
BEGIN
DECLARE @COMPRIMENTO INT, @STRING_RETORNO VARCHAR(8000)
SET @COMPRIMENTO = LEN(@STRING)
SET  @STRING_RETORNO =   REPLICATE(@CARACTER,@TAMANHO-@COMPRIMENTO)+@STRING	
	RETURN CONVERT(VARCHAR(50),@STRING_RETORNO)
END

CREATE FUNCTION SP_TRIM(@STR VARCHAR(200))
RETURNS VARCHAR(200)
AS
BEGIN
   RETURN LTRIM(RTRIM(@STR))
END

SELECT dbo.SP_TRIM('TTTT ')
DECLARE @STRING VARCHAR(50)


SELECT  dbo.SF_LPAD('tech', 8, '0')
PRINT @STRING