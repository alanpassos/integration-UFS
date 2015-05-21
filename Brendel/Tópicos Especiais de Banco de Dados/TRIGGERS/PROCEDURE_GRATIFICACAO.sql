CREATE TRIGGER TG_SALARIO_FUNCIONARIO ON TB_FUNCIONARIO_SALARIO
AFTER INSERT
AS
	DECLARE	@MATRICULA INT,
					@NOME VARCHAR(50),
					@SALARIO NUMERIC(10,2),
					@GRATIFICACAO NUMERIC(10,2),
					@SALARIO_INTEGRAL NUMERIC(10,2)
					
		DECLARE C_FUNCIONARIO_SALARIO CURSOR FOR 
			SELECT TF.MATRICULA, TF.NOME, TF.SALARIO, TF.GRATIFICACAO FROM TB_FUNCIONARIO_SALARIO TF
	
		OPEN C_FUNCIONARIO_SALARIO
		FETCH C_FUNCIONARIO_SALARIO INTO @MATRICULA, @NOME ,@SALARIO, @GRATIFICACAO
				
		WHILE(@@FETCH_STATUS = 0)
			BEGIN
				SET @SALARIO_INTEGRAL = @SALARIO + @GRATIFICACAO
				IF(@SALARIO_INTEGRAL > (SELECT SALARIO_INTEGRAL_NOVO FROM TB_LOG_AUMENTO_FUNCIONARIO WHERE MATRICULA = @MATRICULA))
					BEGIN
						DECLARE @SALARIO_AUXILIAR NUMERIC(10,2)
						SELECT @SALARIO_AUXILIAR  = SALARIO_INTEGRAL_NOVO FROM TB_LOG_AUMENTO_FUNCIONARIO WHERE MATRICULA = @MATRICULA
						UPDATE TB_LOG_AUMENTO_FUNCIONARIO SET	SALARIO_INTEGRAL_ANTIGO = @SALARIO_AUXILIAR,
																			SALARIO_INTEGRAL_NOVO = @SALARIO_INTEGRAL  WHERE  MATRICULA = @MATRICULA
					END
				IF NOT EXISTS (SELECT SALARIO_INTEGRAL_ANTIGO FROM TB_LOG_AUMENTO_FUNCIONARIO WHERE MATRICULA = @MATRICULA)
					BEGIN
						INSERT INTO TB_LOG_AUMENTO_FUNCIONARIO (MATRICULA, NOME, DATA, SALARIO_INTEGRAL_ANTIGO, SALARIO_INTEGRAL_NOVO) 
						VALUES (@MATRICULA, @NOME, GETDATE(), @SALARIO_INTEGRAL, @SALARIO_INTEGRAL)
					END															
				FETCH C_FUNCIONARIO_SALARIO INTO @MATRICULA, @NOME ,@SALARIO, @GRATIFICACAO
			END
		
		CLOSE C_FUNCIONARIO_SALARIO
		DEALLOCATE C_FUNCIONARIO_SALARIO