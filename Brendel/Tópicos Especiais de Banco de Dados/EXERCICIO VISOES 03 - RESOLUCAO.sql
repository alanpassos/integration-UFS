CREATE TABLE TB_FUNCIONARIO_AL (
MATRICULA INT NOT NULL,
NM_FUNCIONARIO VARCHAR(40) NOT NULL,
ESTADO CHAR(2) CHECK(ESTADO = 'AL') NOT NULL,
SALARIO NUMERIC (10,2)
CONSTRAINT TB_FUNCIONARIO_AL_PK
PRIMARY KEY (MATRICULA, ESTADO)
);
CREATE TABLE TB_FUNCIONARIO_PB (
MATRICULA INT NOT NULL,
NM_FUNCIONARIO VARCHAR(40) NOT NULL,
ESTADO CHAR(2) CHECK(ESTADO = 'PB') NOT NULL,
SALARIO NUMERIC (10,2)
CONSTRAINT TB_FUNCIONARIO_PB_PK
PRIMARY KEY (MATRICULA, ESTADO)
);
CREATE TABLE TB_FUNCIONARIO_SE (
MATRICULA INT NOT NULL,
NM_FUNCIONARIO VARCHAR(40) NOT NULL,
ESTADO CHAR(2) CHECK(ESTADO = 'SE') NOT NULL,
SALARIO NUMERIC (10,2)
CONSTRAINT TB_FUNCIONARIO_SE_PK
PRIMARY KEY (MATRICULA, ESTADO)
);

CREATE VIEW VW_FUNCIONARIOS AS
SELECT * FROM TB_FUNCIONARIO_AL
UNION ALL
SELECT * FROM TB_FUNCIONARIO_SE
UNION ALL
SELECT * FROM TB_FUNCIONARIO_PB
;

INSERT INTO "VW_FUNCIONARIOS" ("MATRICULA", "NM_FUNCIONARIO", "ESTADO", "SALARIO") VALUES (1, 'JOAO DA SILVA', 'SE', 1200);
INSERT INTO "VW_FUNCIONARIOS" ("MATRICULA", "NM_FUNCIONARIO", "ESTADO", "SALARIO") VALUES (2, 'FRANCISCO NUNES', 'PB', 1000);
INSERT INTO "VW_FUNCIONARIOS" ("MATRICULA", "NM_FUNCIONARIO", "ESTADO", "SALARIO") VALUES (3, 'MANOEL MENEZES', 'AL', 1230);

UPDATE "VW_FUNCIONARIOS" SET "ESTADO"='SE' WHERE  "MATRICULA"=3 AND "NM_FUNCIONARIO"='MANOEL MENEZES' AND "ESTADO"='AL' AND "SALARIO"=1230;
UPDATE "VW_FUNCIONARIOS" SET "ESTADO"='AL' WHERE  "MATRICULA"=3 AND "NM_FUNCIONARIO"='MANOEL MENEZES' AND "ESTADO"='SE' AND "SALARIO"=1230;

