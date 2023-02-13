--- Auteur: Riad SABIR

-- Q1
SELECT fnom AS fournisseur, fad AS adresse 
	FROM fournisseurs;

-- Q2
SELECT fnom 
	FROM fournisseurs 
	JOIN catalogue ON catalogue.fid = fournisseurs.fid 
	WHERE prix >= 10 and prix <= 20;

-- Q3
SELECT anom 
    FROM articles 
    NATURAL JOIN catalogue 
    WHERE (acoul='rouge' OR acoul='vert') AND prix < 20;


-- Q4
-- Le prix maximal
SELECT MAX(prix) 
	FROM catalogue;

-- Le prix minimal
SELECT MIN(prix) 
	FROM catalogue;


-- Q5
SELECT fournisseurs.fid 
    FROM fournisseurs 
    NATURAL JOIN catalogue 
    NATURAL JOIN articles 
    WHERE acoul='argente' OR acoul='magenta';

-- Q6
SELECT * FROM 
	(SELECT aid 
		FROM articles 
		WHERE acoul='vert') AS vert
	CROSS JOIN 
	(SELECT aid 
		FROM articles 
		WHERE acoul='rouge') AS rouge;

-- Q7
SELECT * 
	FROM fournisseurs JOIN catalogue ON catalogue.fid=fournisseurs.fid 
 	JOIN articles ON articles.aid=catalogue.aid 
 	WHERE acoul<>'noir' AND acoul<>'argente';

-- Q8
SELECT * 
    FROM (SELECT * 
        FROM fournisseurs 
        NATURAL JOIN articles NATURAL JOIN catalogue 
        WHERE prix > 1000) AS SUP 
    EXCEPT                    
        (SELECT * 
        FROM fournisseurs 
        NATURAL JOIN articles NATURAL JOIN catalogue 
        WHERE prix < 1000);

-- Q9
SELECT DISTINCT(aid)
	FROM catalogue;

-- Q10
SELECT COUNT(DISTINCT(anom))
	FROM articles;

-- Q11
SELECT COUNT(*)
	FROM catalogue;

-- Q12
SELECT * 
	FROM (SELECT aid 
		FROM articles) AS all_articles 
	EXCEPT (SELECT aid 
		FROM catalogue);

-- Q13
/* Le nombre d'articles fournissables est égal au nombre de lignes du catalogue dans le cas
 * où tout article a un fournisseur unique.
 */


-- Q14
SELECT COUNT(DISTINCT(acoul)) 
	FROM articles;
