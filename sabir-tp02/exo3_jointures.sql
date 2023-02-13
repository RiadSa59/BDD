--- Auteur: Riad SABIR 


-- Q1
SELECT fid, articles.acoul  
	FROM articles 
	JOIN catalogue ON articles.aid = catalogue.aid 
	WHERE acoul='rouge';

-- Q2
SELECT ROUND(AVG(prix), 2) 
	FROM articles 
	JOIN catalogue ON articles.aid = catalogue.aid 
	WHERE acoul='rouge';

-- deuxième version, on utilise l'operateur logique IN 
SELECT ROUND(AVG(prix), 2) 
	FROM catalogue 
	WHERE aid IN (SELECT aid 
			FROM articles 
			WHERE acoul='rouge');


--Q3
SELECT * 
	FROM fournisseurs 
	LEFT JOIN catalogue ON fournisseurs.fid=catalogue.fid 
	WHERE aid IS NULL;

--Q4
SELECT * 
	FROM articles 
	LEFT JOIN catalogue ON articles.aid=catalogue.aid 
	WHERE fid IS NULL;

--Q5 On utilise EXCEPT car les articles sans vendeur ne se retrouvent pas dans le catalogue
SELECT aid 
	FROM articles 
	EXCEPT 
		(SELECT aid 
			FROM catalogue);

