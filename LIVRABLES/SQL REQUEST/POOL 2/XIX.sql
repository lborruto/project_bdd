SELECT Nom
FROM navire
WHERE ID =
    (SELECT ID_Navire
     FROM expedition
     WHERE ID =
         (SELECT ID_Expedition
          FROM etape
          GROUP BY ID_Expedition
          ORDER BY COUNT(*) DESC
          LIMIT 1))