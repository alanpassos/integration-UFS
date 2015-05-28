select
	  d.titulo,count(d.cd_dvd) as 'total de locacoes' 
from 
	tb_locacao l
inner join 
	tb_dvd d on (l.cd_dvd = d.cd_dvd)
	where YEAR(l.dt_alocacao) = '2009'
group by 
	d.cd_dvd, d.titulo
having count(d.cd_dvd) > 2

-- HAVING vai atuar depois que fez o group by (PARECE COM O WHERE)
-- Elabore uma consulta SQL quer retorne como resultado os dvds que foram alugados
-- mais de 2 vezes em 2009. Apresentar o titulo do dvd e o total de locações. 
select
	  d.titulo,count(d.cd_dvd) as 'total de locacoes' 
from 
	tb_locacao l
inner join 
	tb_dvd d on (l.cd_dvd = d.cd_dvd)
	where YEAR(l.dt_alocacao) = '2009'
group by 
	d.cd_dvd, d.titulo
having count(d.cd_dvd) > 2

-- Elabore uma consulta SQL que retorne como resultado os títulos dos DVDs que
-- tiveram pelo menos um aluguel em Maio de 2009 e também pelo menos um aluguel
-- em Junho de 2009. Somente os filmes que tiveram aluguéis pelo menos nos dois
-- meses devem ser apresentados
select
	  d.titulo
from 
	tb_locacao l
inner join 
	tb_dvd d on (l.cd_dvd = d.cd_dvd)
	where (l.dt_alocacao >= '20090601' and l.dt_alocacao < '20090701')




-- Elabore uma consulta SQL que retorne os Clientes (nomes) que nunca alugaram
-- filmes
select c.nm_cliente from TB_CLIENTE c
where not exists (select c.cd_cliente from TB_LOCACAO l where l.cd_cliente = c.cd_cliente) 

-- Elabore uma consulta SQL que retorne os DVDs (titulo) que tiveram o maior
-- número de locações. 
select max( d.titulo) as titulo from TB_LOCACAO l
inner join TB_DVD d on (d.cd_dvd = l.cd_dvd)


-- ou 


select
	  d.titulo,count(d.cd_dvd) as 'total de locacoes' 
from 
	tb_locacao l
inner join 
	tb_dvd d on (l.cd_dvd = d.cd_dvd)
group by 
	d.cd_dvd, d.titulo
having count(d.cd_dvd) = (select count(d.cd_dvd) from 

(select
	  d.titulo,max(d.cd_dvd) as 'total de locacoes' 
from 
	tb_locacao l
where	(l.cd_dvd = d.cd_dvd)

))

