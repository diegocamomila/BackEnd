SELECT 
    artista.nome_artista AS artista,
    album.nome_album AS album
FROM SpotifyClone.album
JOIN SpotifyClone.artista ON album.id_artista = artista.id_artista
WHERE artista.nome_artista = 'Walter Phoenix';