
--Interpretaciones que se tienen de la cancion Lluvia y en su respectivo ritmo
SELECT ca.Titulo AS Cancion,
       i.Nombre AS Interprete,
       r.Ritmo AS Ritmo
FROM Cancion ca
INNER JOIN Interpretacion it ON ca.Id = it.IdCancion
INNER JOIN Interprete i ON it.IdInterprete = i.Id
INNER JOIN Ritmo r ON it.IdRitmo = r.Id
WHERE ca.Titulo = 'Lluvia';


--Canciones del ritmo balada con mismo compositor e interprete
SELECT DISTINCT
       ca.Titulo    AS Cancion,
       i.Nombre     AS Interprete,
       co.Nombre    AS Compositor,
       r.Ritmo      AS Ritmo
FROM Cancion ca
INNER JOIN Interpretacion it ON it.IdCancion = ca.Id
INNER JOIN Interprete i       ON it.IdInterprete = i.Id
INNER JOIN Tipo t             ON i.IdTipo = t.Id
INNER JOIN Ritmo r            ON it.IdRitmo = r.Id
INNER JOIN CancionCompositor cc ON cc.IdCancion = ca.Id
INNER JOIN Compositor co      ON cc.IdCompositor = co.Id
WHERE r.Ritmo = 'Balada'
  AND t.Tipo  = 'Solista'
  AND UPPER(co.Nombre) LIKE '%' + UPPER(i.Nombre) + '%';

--Que paises tienen grupos de salsa
SELECT DISTINCT p.Pais AS Pais
FROM Pais p
JOIN Interprete i ON i.IdPais = p.Id
JOIN Interpretacion ip ON ip.IdInterprete = i.Id
JOIN Ritmo r ON r.Id = ip.IdRitmo
WHERE r.Ritmo = 'Salsa' AND i.IdTipo = 5;

--Quienes interpretan las canciones Candilejas y Malaguena
SELECT DISTINCT i.Nombre AS Interprete, c.Titulo AS Cancion
FROM Cancion c
JOIN Interpretacion ip ON ip.IdCancion = c.Id
JOIN Interprete i ON i.Id = ip.IdInterprete
WHERE c.Titulo IN ('Candilejas', 'Malaguena');

--Artistas que son intérpretes y compositores a la vez y con cuantas canciones
--compuestas e interpretadas
SELECT 
    i.Nombre AS Artista,
    COUNT(DISTINCT ip.IdCancion) AS CancionesInterpretadas,
    COUNT(DISTINCT c.Id) AS CancionesCompuestas
FROM Interprete i
JOIN Compositor co ON co.Nombre = i.Nombre
LEFT JOIN Interpretacion ip ON ip.IdInterprete = i.Id
LEFT JOIN Cancion c ON c.Id IN (
    SELECT Id 
    FROM Cancion c2
    WHERE c2.Titulo IN (
        SELECT c3.Titulo
        FROM Cancion c3
        JOIN Compositor co2 ON co2.Nombre = i.Nombre
    )
)
GROUP BY i.Nombre
HAVING COUNT(DISTINCT ip.IdCancion) > 0
   AND COUNT(DISTINCT c.Id) > 0;