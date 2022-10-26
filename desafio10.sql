SELECT s.song AS nome,
COUNT(p.song_id) AS reproducoes 
FROM SpotifyClone.songs AS s
INNER JOIN SpotifyClone.play_history AS p
ON s.song_id = p.song_id
WHERE user_id IN (1, 2, 8, 9, 10)
GROUP BY s.song
ORDER BY s.song
;