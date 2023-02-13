--- Auteur 1: Riad SABIR 

-- Q1
SELECT upper(fnom) 
	FROM fournisseurs;

-- Q2 
SELECT fid, aid, round(prix) AS PRIX_ROND 
	FROM catalogue;

-- Q3
SELECT fnom 
	FROM fournisseurs 
	WHERE fad LIKE '%Paris';

-- Q4
SELECT fnom 
	FROM fournisseurs 
	WHERE fnom SIMILAR TO '%(i|e)%';

-- Q5
SELECT fnom 
	FROM fournisseurs 
	WHERE fnom ~* 'a';
