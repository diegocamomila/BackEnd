SELECT 
	cancao.nome_cancao AS cancao,
    COUNT(historico.data_hora) AS reproducoes
FROM SpotifyClone.cancao 
JOIN SpotifyClone.historico ON historico.id_cancao = cancao.id_cancao
GROUP BY cancao.nome_cancao
ORDER BY `reproducoes` DESC, cancao.nome_cancao
LIMIT 2;