SELECT s.song AS cancao,
COUNT(p.song_id) AS reproducoes
FROM SpotifyClone.songs AS s
INNER JOIN SpotifyClone.play_history AS p
ON s.song_id = p.song_id
GROUP BY s.song_id
ORDER BY reproducoes DESC, cancao
LIMIT 2
;