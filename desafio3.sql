SELECT u.user AS usuario,
COUNT(p.play_date) AS qt_de_musicas_ouvidas,
ROUND(SUM(s.duration_time_in_seconds)/60, 2) AS total_minutos
 FROM SpotifyClone.users AS u
 INNER JOIN SpotifyClone.play_history AS p
 ON u.user_id = p.user_id
INNER JOIN SpotifyClone.songs AS s
 ON s.song_id = p.song_id
 GROUP BY u.user
 ORDER BY u.user ASC;