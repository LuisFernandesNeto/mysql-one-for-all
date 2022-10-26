SELECT a.artist AS artista,
 al.album AS album,
 COUNT(f.artist_id) AS seguidores
 FROM SpotifyClone.artists AS a
 INNER JOIN SpotifyClone.albums AS al
 ON a.artist_id = al.artist_id
 INNER JOIN SpotifyClone.following_artists AS f
 ON al.artist_id = f.artist_id
GROUP BY al.album_id
ORDER BY seguidores DESC, artista, album;