CREATE TABLE TB_FUNCIONARIO_SE (

	MATRICULA INT NOT NULL,
	NM_FUNCIONARIO VARCHAR(40) NOT NULL,
	ESTADO CHAR(2) NOT NULL CHECK ( ESTADO = 'SE'),
	SALARIO NUMERIC (10,2)
)

ALTER TABLE TB_FUNCIONARIO_SE ADD CONSTRAINT PK_TB_FUNCIONARIO_SE_ESTADO
PRIMARY KEY (MATRICULA, ESTADO)


CREATE TABLE TB_FUNCIONARIO_PB (

	MATRICULA INT NOT NULL,
	NM_FUNCIONARIO VARCHAR(40) NOT NULL,
	ESTADO CHAR(2) NOT NULL CHECK ( ESTADO = 'PB'),
	SALARIO NUMERIC (10,2)
)

ALTER TABLE TB_FUNCIONARIO_PB ADD CONSTRAINT PK_TB_FUNCIONARIO_PB_ESTADO
PRIMARY KEY (MATRICULA, ESTADO)

CREATE TABLE TB_FUNCIONARIO_AL (

	MATRICULA INT NOT NULL,
	NM_FUNCIONARIO VARCHAR(40) NOT NULL,
	ESTADO CHAR(2) NOT NULL CHECK ( ESTADO = 'AL'),
	SALARIO NUMERIC (10,2)
)

ALTER TABLE TB_FUNCIONARIO_AL ADD CONSTRAINT PK_TB_FUNCIONARIO_AL_ESTADO
PRIMARY KEY (MATRICULA, ESTADO)



CREATE VIEW  VW_FUNCIONARIOS_ESTADO AS
SELECT * FROM TB_FUNCIONARIO_SE
UNION ALL
SELECT * FROM TB_FUNCIONARIO_PB
UNION ALL
SELECT * FROM TB_FUNCIONARIO_AL

INSERT INTO VW_FUNCIONARIOS_ESTADO 
VALUES (1, 'J�se', 'SE', 750.50)

SELECT * FROM TB_FUNCIONARIO_PB

UPDATE VW_FUNCIONARIOS_ESTADO SET ESTADO = 'PB' WHERE MATRICULA = 1

SELECT * FROM VW_FUNCIONARIOS_ESTADO