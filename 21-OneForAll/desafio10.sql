SELECT 
	cancao.nome_cancao as nome,
	COUNT(historico.id_usuario) as reproducoes
FROM SpotifyClone.historico 
JOIN SpotifyClone.cancao ON historico.id_cancao = cancao.id_cancao
JOIN SpotifyClone.usuario ON historico.id_usuario = usuario.id_usuario
WHERE usuario.id_plano IN (1,3)
GROUP BY `nome`;