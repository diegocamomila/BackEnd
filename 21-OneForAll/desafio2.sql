SELECT
	COUNT(cancao.id_cancao) as cancoes,
    COUNT(DISTINCT artista.id_artista) as artistas,
    COUNT(DISTINCT album.id_album) as albuns
FROM SpotifyClone.album
JOIN SpotifyClone.artista ON album.id_artista = artista.id_artista
JOIN SpotifyClone.cancao ON cancao.id_album = album.id_album; 


/**
SELECT
	COUNT(cancoes.id_cancao) as cancoes,
    COUNT(DISTINCT artistas.id_artista) as artistas,
    COUNT(DISTINCT albuns.id_album) as albuns
FROM SpotifyClone.album as albuns
JOIN SpotifyClone.artista as artistas ON albuns.id_artista = artistas.id_artista
JOIN SpotifyClone.cancao as cancoes ON cancoes.id_album = albuns.id_album; 
**/