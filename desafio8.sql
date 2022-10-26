SELECT a.artist AS artista, al.album AS album FROM SpotifyClone.artists AS a
INNER JOIN SpotifyClone.albums AS al
ON a.artist_id = al.artist_id
WHERE artist = "Elis Regina"
ORDER BY album;