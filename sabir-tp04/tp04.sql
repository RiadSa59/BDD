--- Auteur 1: Riad SABIR

-- Q1
SELECT acoul 
	FROM articles a 
	WHERE NOT EXISTS(SELECT * 
						FROM articles a1 
						WHERE a.acoul=a1.acoul AND a.aid <> a1.aid);

-- Q2
SELECT anom
FROM articles as a1
WHERE a1.acoul = 'rouge' AND NOT EXISTS (
      SELECT *
      FROM articles as a2
      WHERE  a1.anom = a2.anom AND a2.acoul = 'vert'
      );

-- La même requête utilisant IN
SELECT anom 
	FROM articles 
	WHERE acoul='rouge' 
	AND anom NOT IN (SELECT anom 
						FROM articles 
						WHERE acoul='vert');

-- La même requête utilisant ALL
SELECT anom 
	FROM articles 
	WHERE acoul='rouge' 
	AND anom <> ALL(SELECT anom 
						FROM articles 
						WHERE acoul='vert');


-- Q3
SELECT DISTINCT(fnom) 
	FROM catalogue c 
	NATURAL JOIN fournisseurs f 
	WHERE prix > some( SELECT AVG(prix) 
							FROM catalogue 
							WHERE c.aid=catalogue.aid);

-- Q4
SELECT DISTINCT(anom, aid) 
	FROM catalogue c 
	NATURAL JOIN articles 
	WHERE EXISTS(SELECT * 
					FROM catalogue c1 
					WHERE c.fid<>c1.fid AND c.aid=c1.aid);



-- Q5
SELECT fid, fnom 
	FROM fournisseurs 
	WHERE fid 
	NOT IN (SELECT fid 
				FROM catalogue);

-- La même requête utilisant SOME
SELECT fid, fnom 
	FROM fournisseurs 
	WHERE fid = SOME(SELECT fid 
						FROM fournisseurs 
						LEFT JOIN catalogue 
						USING(fid) 
						WHERE aid IS NULL);

-- La même requête utilisant all
SELECT fid, fnom 
	FROM fournisseurs 
	WHERE fid <> ALL (SELECT fid 
						FROM catalogue);

-- Q6
SELECT anom 
	FROM articles 
	WHERE anom <> ALL(SELECT anom 
							FROM articles 
							NATURAL JOIN catalogue 
							NATURAL JOIN fournisseurs 
							WHERE fnom<>'kiventout');

-- La même requete utilisant IN
SELECT anom 
	FROM articles 
	WHERE anom 
	NOT IN (SELECT anom 
				FROM catalogue 
				NATURAL JOIN fournisseurs 
				NATURAL JOIN articles 
				WHERE fnom<>'kiventout');


-- Q8
SELECT fnom 	
	FROM fournisseurs f 
	WHERE EXISTS(SELECT * 
						FROM catalogue c 
						WHERE prix >= ALL(SELECT prix 
											FROM catalogue) 
						AND f.fid=c.fid);

-- Q11
SELECT anom 
	FROM catalogue 
	NATURAL JOIN articles 
	WHERE NOT EXISTS(SELECT * 
						FROM articles a 
						NATURAL JOIN catalogue c 
						WHERE articles.anom=a.anom
						AND catalogue.fid<>c.fid );

-- La même requete utilisant GROUP BY
SELECT anom 
	FROM catalogue 
	NATURAL JOIN articles 
	GROUP BY anom 
	HAVING count(fid)=1;


-- Q12
SELECT anom 
	FROM articles a 
	WHERE NOT EXISTS(SELECT anom 
						FROM catalogue c 
						WHERE a.aid=c.aid AND c.prix < 100);

-- La même requete utilisant ALL
SELECT anom 
	FROM articles 
	WHERE aid <> ALL(SELECT aid 
						FROM articles 
						NATURAL JOIN catalogue 
						WHERE prix < 100);

-- Q13
SELECT aid 
	FROM articles a 
	WHERE EXISTS(SELECT fid 
					FROM catalogue c 
					WHERE EXISTS(SELECT fid 
									FROM fournisseurs f 
									WHERE a.aid=c.aid AND c.fid=f.fid AND fad LIKE '%USA%'));
