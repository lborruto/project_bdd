SELECT navire.Nom "Bateau",
       divinite.Nom "Divinité"
FROM navire,
     divinite
WHERE navire.ID =
    (SELECT ID_Navire
     FROM expedition
     GROUP BY ID_Navire,
              ID_Divinite
     ORDER BY COUNT(*) DESC
     LIMIT 1)
  AND divinite.ID =
    (SELECT ID_Divinite
     FROM expedition
     GROUP BY ID_Navire,
              ID_Divinite
     ORDER BY COUNT(*) DESC
     LIMIT 1)