USE db_empresa_locadora;
-- INSERINDO DADOS NA TABELA TB_DVD
INSERT INTO TB_DVD (cd_dvd, titulo, categoria) VALUES
(13, 'Duro de Matar', 'Policial'),
(34, 'American Pie','Comédia');

-- INSERINDO DADOS NA TABELA CLIENTE
INSERT INTO TB_CLIENTE (cd_cliente, nm_cliente) VALUES
(101, 'João'), (102, 'Pedro'), (103, 'Ricardo');

-- INSERINDO DADOS NA TABELA TB_LOCACAO
INSERT INTO TB_LOCACAO (cd_cliente, cd_dvd, valor, dt_alocacao, dt_devolucao) VALUES
(101,13,6,'20070101','20070102'),
(102,34,5,'20080820', null),
(103,13,6,'20070821', null);

