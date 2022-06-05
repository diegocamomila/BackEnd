SELECT 
	(usuario.nome_usuario) as usuario,
    COUNT(historico.id_cancao) as qtde_musicas_ouvidas,
    ROUND(SUM(cancao.duracao_cancao)/60,2) as total_minutos
FROM SpotifyClone.usuario
JOIN SpotifyClone.historico ON historico.id_usuario = usuario.id_usuario
JOIN SpotifyClone.cancao ON cancao.id_cancao = historico.id_cancao
GROUP BY usuario.nome_usuario;