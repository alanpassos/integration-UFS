ALTER TRIGGER TG_SALARIO ON TB_FUNCIONARIO
AFTER INSERT 
AS
	BEGIN
		DECLARE	@CD_CARGO INT, 
					@CD_ESCOLARIDADE INT,
					@SALARIO NUMERIC(10,2),						
					@MENOR_VALOR INT,
					@MAIOR_VALOR INT
					
		DECLARE C_FUNCIONARIO CURSOR FOR 
			SELECT TF.CD_CARGO, TF.CD_ESCOLARIDADE, TF.SALARIO  FROM INSERTED TF
		
		OPEN C_FUNCIONARIO
		FETCH C_FUNCIONARIO INTO @CD_CARGO, @CD_ESCOLARIDADE, @SALARIO
				
		WHILE(@@FETCH_STATUS = 0)
			BEGIN
				SELECT @MENOR_VALOR = TFS.MENOR_VALOR FROM TB_FAIXASALARIAL TFS WHERE TFS.CD_ESCOLARIDADE = @CD_ESCOLARIDADE AND
																		TFS.CD_CARGO = @CD_CARGO
				SELECT @MAIOR_VALOR =  TFS.MAIOR_VALOR FROM TB_FAIXASALARIAL TFS WHERE TFS.CD_ESCOLARIDADE = @CD_ESCOLARIDADE AND
																		TFS.CD_CARGO = @CD_CARGO
				IF(@SALARIO > @MAIOR_VALOR OR @SALARIO < @MENOR_VALOR)
				BEGIN	
					RAISERROR('DADOS NÃO PUDERAM SER INSERIDOS, POIS O SALÁRIO NÃO SE ENCONTRA NA FAIXA CORRETA', 1, 1 )
					ROLLBACK TRANSACTION
				END																						
				FETCH C_FUNCIONARIO INTO @CD_CARGO, @CD_ESCOLARIDADE, @SALARIO
			END
		
		CLOSE C_FUNCIONARIO
		DEALLOCATE C_FUNCIONARIO
	END