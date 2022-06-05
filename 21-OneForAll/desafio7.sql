SELECT 
    artista.nome_artista  AS artista,
    album.nome_album AS album,
    COUNT(seguindo.id_usuario) AS seguidores
FROM SpotifyClone.seguindo 
JOIN SpotifyClone.artista ON seguindo.id_artista = artista.id_artista
JOIN SpotifyClone.album ON artista.id_artista = album.id_artista
GROUP BY album.nome_album, artista.nome_artista
ORDER BY `seguidores` DESC, `artista`, `album`;