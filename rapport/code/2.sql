SELECT p.nom, p.idPers, p.grade, pa.date, pa.idP, a.idPers Proprietaire 
FROM personne p, passepar pa, appartient a 
WHERE p.idPers = pa.idPers AND a.idP = pa.idP;