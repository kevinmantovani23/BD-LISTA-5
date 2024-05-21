USE locadora

--Exercício 1--

SELECT cl.num_cadastro, cl.nome, CONVERT(VARCHAR(50), loc.data_locacao, 103) as data_locacao,
DATEDIFF(DAY, loc.data_locacao, loc.data_devolucao) as qtd_dias_alugado,
fm.titulo, 
fm.ano
FROM cliente as cl, locacao as loc, dvd as dv, filme as fm
WHERE cl.num_cadastro = loc.clienteNum_cadastro
		AND dv.num = loc.dvdNum
		AND dv.filmeID = fm.id 
		AND cl.nome LIKE 'Matilde%'

--Exercício 2--

SELECT es.nome, es.nomereal, fm.titulo
FROM estrela as es, filme as fm, filme_estrela as fes
WHERE es.id = fes.estrelaID
	  AND fm.id = fes.filmeID
	  AND fm.ano = '2015'

--Exercício 3--

SELECT fm.titulo,	
CONVERT(VARCHAR(50), dv.data_fabricacao, 103) as data_fabricacao_dvd,
CASE WHEN (YEAR(GETDATE() - fm.ano ) > 6)
	THEN
		CONVERT(VARCHAR(3), (YEAR(GETDATE()) - fm.ano )) + ' anos'
	ELSE 
		CAST(YEAR(GETDATE()) - fm.ano as VARCHAR(3))
	END as diferenca
FROM fiLme as fm, dvd as dv
WHERE fm.id = dv.filmeID
	