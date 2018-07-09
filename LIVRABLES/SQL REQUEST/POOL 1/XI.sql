SELECT Nom,
       Prenom
FROM heros
WHERE ID =
    (SELECT ID_Heros
     FROM expedition
     GROUP BY ID_Heros
     ORDER BY COUNT(*) DESC
     LIMIT 1)