--- Auteur 1: Riad SABIR 

-- Exercice 1

-- Q1 	
SELECT max(prix) 
	FROM catalogue;

-- Q2
SELECT prix, anom
	FROM catalogue
	INNER JOIN articles ON catalogue.aid = articles.aid
	WHERE prix >= ALL (select prix from catalogue);
	
-- Q3 : 
SELECT prix, fnom
	FROM catalogue
	INNER JOIN fournisseurs ON catalogue.fid = fournisseurs.fid
	WHERE prix >= ALL (SELECT prix FROM catalogue);


-- Q4
SELECT anom as article, count(DISTINCT acoul) as nb_coul
	FROM articles
	GROUP BY anom;


-- Q5
SELECT anom, max(prix) AS max_prix, min(prix) AS min_prix, count(fid) AS nb_fournisseurs 
	FROM catalogue 
	NATURAL JOIN articles 
	GROUP BY anom HAVING count(fid)>1 
	ORDER BY avg(prix);

-- Q6
SELECT acoul
	FROM Articles
	GROUP BY acoul
	HAVING COUNT(acoul) = 1;



-- Q7
SELECT acoul AS color, round(avg(prix), 2) as prix_moyen
	FROM articles 
	NATURAL JOIN catalogue 
	WHERE anom <> 'Ferrari F430' 
	GROUP BY acoul 
	HAVING count(acoul) > 1 
	ORDER BY avg(prix);


-- Q8
SELECT DISTINCT(anom, acoul), count(fid) 
	FROM catalogue 
	NATURAL JOIN articles 
	GROUP BY anom, acoul;


-- Q9
SELECT anom, acoul, count(fid)
	FROM catalogue 
	NATURAL JOIN articles 
	GROUP BY anom, acoul;

-- Q10 
SELECT fnom AS fournisseur, count(DISTINCT anom) AS nb_a
	FROM fournisseurs 
	NATURAL JOIN catalogue 
	NATURAL JOIN articles 
	GROUP BY fnom 
	HAVING count(anom) > 1;

-- Q11
SELECT fnom, anom 
	FROM fournisseurs 
	NATURAL JOIN catalogue 
	NATURAL JOIN articles 
	GROUP BY fnom, anom 
	HAVING count(anom) > 1;

-- Q12
SELECT anom FROM catalogue 
	NATURAL JOIN articles 
	NATURAL JOIN fournisseurs 
	GROUP BY anom HAVING count(fid)=1;

--Q13
SELECT substring(acoul from 1 for 1) AS c, count(anom) 
	FROM articles 
	GROUP BY c;

--Q14
SELECT * FROM articles 
	JOIN catalogue 
	ON articles.aid=catalogue.aid;
-- En fait, ici on effectue une jointure naturelle, on précise la condition de jointure,
-- dans ce cas c'est l'égalité des deux colonnes.
   


SELECT * FROM articles
	JOIN catalogue
	USING(aid);

/* On utilise la clause USING quand les tables ont une colonne commune (exepmple aid de la table articles et aid de catalogue)
  avec USING on peut eviter les "ambiguïtées" dans les tables contruites comme résultat de la jointure.

SELECT aid FROM catalogue JOIN articles ON articles.aid=catalogue.aid
;
ERROR:  column reference "aid" is ambiguous
LINE 1: SELECT aid FROM catalogue JOIN articles ON articles.aid=cata...


*/







