

CREATE UNIQUE INDEX UNIQUE_CPF_NOT_NULL                          
ON TB_FUNCIONARIO_CPF_2(CPF)                             
WHERE CPF IS NOT NULL;