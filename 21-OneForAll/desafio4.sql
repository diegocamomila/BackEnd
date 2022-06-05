SELECT 
	usuario.nome_usuario as usuario,
    CASE 
		WHEN MAX(YEAR(historico.data_hora)) = 2021 THEN 'Usuário ativo'
        WHEN MAX(YEAR(historico.data_hora)) <> 2021 THEN 'Usuário inativo'
       /** ELSE (historico.data_hora) = 'inativo' **/
END as condicao_usuario
FROM SpotifyClone.usuario
JOIN SpotifyClone.historico ON historico.id_usuario = usuario.id_usuario
GROUP BY usuario.nome_usuario; 