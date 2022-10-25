SELECT u.user AS usuario,
 IF (MAX(YEAR(p.play_date)) >= 2021,
 'Usuário ativo', 'Usuário inativo') AS status_usuario
 FROM SpotifyClone.users AS u
 INNER JOIN SpotifyClone.play_history AS p
 ON p.user_id = u.user_id
 GROUP BY u.user_id
 ORDER BY u.user;
