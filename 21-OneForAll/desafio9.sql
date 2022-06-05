SELECT 
	COUNT(historico.id_cancao) AS quantidade_musicas_no_historico
FROM SpotifyClone.historico
JOIN SpotifyClone.usuario ON historico.id_usuario = usuario.id_usuario
WHERE usuario.nome_usuario = 'Bill'
GROUP BY historico.id_usuario;