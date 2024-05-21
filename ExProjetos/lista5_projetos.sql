USE projetos


--a)--

INSERT INTO users(nome, nomeusuario, email)
VALUES('Joao', 'Ti_joao', 'joao@empresa.com')

--b)--

INSERT INTO projects(nome, descricao, dataproj)
VALUES('Atualização de Sistemas', 'Modificação de Sistemas Operacionais nos PC"s', '12/09/2014')

--c)--
--1)--

SELECT us.id, us.nome, us.email,
pj.id, pj.nome, pj.descricao, pj.dataproj
FROM users as us, projects as pj, user_has_projects as up
WHERE us.id = up.users_id
	  AND pj.id = up.projects_id
	  AND pj.nome = 'Re-folha'

--2)--

SELECT pj.nome
FROM projects pj
 LEFT OUTER JOIN user_has_projects up
 ON pj.id = up.projects_id
 WHERE up.users_id is NULL

--3)--

SELECT us.nome
FROM users us
 LEFT OUTER JOIN user_has_projects up
 ON us.id = up.users_id
 WHERE up.projects_id is NULL

