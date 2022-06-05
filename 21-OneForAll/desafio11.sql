SELECT 
	nome_cancao as nome_musica,
	CASE
		WHEN nome_cancao like '%Streets' THEN replace(nome_cancao, 'Streets', 'Code Review')
        WHEN nome_cancao like '%Her Own' THEN replace(nome_cancao, 'Her Own', 'Trybe')
        WHEN nome_cancao like '%Inner Fire' THEN replace(nome_cancao, 'Inner Fire', 'Project')
        WHEN nome_cancao like '%Silly' THEN replace(nome_cancao, 'Silly', 'Nice')
        WHEN nome_cancao like '%Circus' THEN replace(nome_cancao, 'Circus', 'Pull Request')
    END AS novo_nome FROM SpotifyClone.cancao 
    WHERE cancao.nome_cancao IN 
    ('Dance With Her Own', "Let's Be Silly", 'Magic Circus', 'Troubles Of My Inner Fire', 'Without My Streets')
    ORDER BY nome_musica;