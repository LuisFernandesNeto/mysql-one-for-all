SELECT song AS nome_musica,
CASE song
WHEN 'The Bard’s Song' THEN 'The QA’s Song'
WHEN 'O Medo de Amar é o Medo de Ser Livre' THEN 'O Medo de Code Review é o Medo de Ser Livre'
WHEN 'Como Nossos Pais' THEN 'Como Nossos Pull Requests'
WHEN 'BREAK MY SOUL' THEN 'BREAK MY CODE'
WHEN 'ALIEN SUPERSTAR' THEN 'ALIEN SUPERDEV'
END AS novo_nome
FROM SpotifyClone.songs
WHERE song IN ('The Bard’s Song',
 'O Medo de Amar é o Medo de Ser Livre',
 'Como Nossos Pais',
 'BREAK MY SOUL',
 'ALIEN SUPERSTAR')
ORDER BY nome_musica DESC;