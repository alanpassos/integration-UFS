--------------------------------------------------------------------------
-- TRIGGER QUESTAO 01
--------------------------------------------------------------------------

-- DROP TRIGGER TG_SAIDA
ALTER TRIGGER TG_SAIDA ON TB_PACOTE 
AFTER INSERT,UPDATE
AS
DECLARE @COD_PACOTE	INT,
@NR_DIAS INT,
@DATA_INICIAL  DATETIME,
@DATA_FINAL  DATETIME,
@VALIDO CHAR(3) 
DECLARE C_INSERT CURSOR FOR
SELECT COD_PACOTE,NR_DIAS,DATA_INICIAL,DATA_FINAL,VALIDO FROM INSERTED

DELETE TB_PACOTE_SAIDA FROM TB_PACOTE_SAIDA S
INNER JOIN DELETED D ON D.COD_PACOTE = S.COD_PACOTE
--DBCC CHECKIDENT(TB_PACOTE_SAIDA, RESEED, 0)

OPEN C_INSERT
FETCH  C_INSERT INTO @COD_PACOTE,@NR_DIAS,@DATA_INICIAL,@DATA_FINAL,@VALIDO
WHILE(@@FETCH_STATUS = 0)
	BEGIN
		WHILE (@DATA_INICIAL<= @DATA_FINAL)
			BEGIN
				IF(@VALIDO = 'SIM')
					BEGIN
						INSERT INTO TB_PACOTE_SAIDA 
						VALUES (@COD_PACOTE,@DATA_INICIAL)
					END
				
				SET @DATA_INICIAL =  DATEADD(DAY,(ISNULL(@NR_DIAS,1)+2),@DATA_INICIAL)
			END
	FETCH C_INSERT INTO @COD_PACOTE,@NR_DIAS,@DATA_INICIAL,@DATA_FINAL,@VALIDO
	END
CLOSE C_INSERT
DEALLOCATE C_INSERT

--------------------------------------------------------------------------
-- PROCEDIMENTO QUESTAO 02
--------------------------------------------------------------------------
ALTER PROCEDURE SP_OFERECER AS
BEGIN
TRUNCATE TABLE TB_OFERECE_PACOTE_CLIENTE 
INSERT INTO TB_OFERECE_PACOTE_CLIENTE 
SELECT DISTINCT  C.COD_CLIENTE,P.COD_PACOTE,'SIM' FROM TB_PACOTE P
INNER JOIN TB_PACOTE_SAIDA S ON P.COD_PACOTE = S.COD_PACOTE 
INNER JOIN TB_INTERESSE_CLIENTE I ON I.COD_DESTINO = P.COD_DESTINO
INNER JOIN TB_CLIENTE C ON C.COD_CLIENTE = I.COD_CLIENTE

WHERE S.DATA_SAIDA >= I.DATA_INICIAL AND S.DATA_SAIDA <= I.DATA_FINAL AND DATEADD(DAY,ISNULL(P.NR_DIAS,1),S.DATA_SAIDA) <= I.DATA_FINAL

INSERT INTO TB_OFERECE_PACOTE_CLIENTE 
SELECT DISTINCT  C.COD_CLIENTE,P.COD_PACOTE,'SIM' FROM TB_PACOTE P, TB_CLIENTE C
WHERE C.COD_CLIENTE NOT IN(SELECT COD_CLIENTE FROM TB_INTERESSE_CLIENTE)

END




