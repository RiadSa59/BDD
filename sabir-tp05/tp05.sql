--- Auteur 1: Riad SABIR

-- Q1
SELECT eid, max(portee) 
	FROM certifications NATURAL JOIN avions 
	GROUP BY eid 
	HAVING count(aid) > 1;

-- Q2
SELECT enom 
	FROM employes NATURAL JOIN certifications NATURAL JOIN vols 
	WHERE dep='CDG' AND arr='NOU' AND employes.eid = certifications.eid 
	GROUP BY enom,salaire HAVING salaire < min(prix);

-- Q3
SELECT  DISTINCT v.dep, v.arr, v.distance 
    FROM vols v, avions a, employes e NATURAL JOIN certifications c
    WHERE e.salaire>1000 AND a.portee>=v.distance;

-- TRC (voir le fichier TR_queries_student.txt)
SELECT v.dep, v.arr,v.distance
    FROM vols v
    WHERE NOT EXISTS(SELECT * 
                        FROM employes e 
                        WHERE e.salaire > 100000 AND EXISTS(SELECT * 
                                                                FROM certifications c 
                                                                WHERE c.eid=e.eid) AND NOT EXISTS(SELECT * 
                                                                                                FROM avions a NATURAL JOIN certifications NATURAL JOIN employes 
                                                                                                WHERE  a.portee>= v.distance));

-- Q4
SELECT enom
	FROM employes NATURAL JOIN certifications NATURAL JOIN avions
	GROUP BY enom
	HAVING every(portee > 1500 );

-- TRC (voir le fichier TR_queries_student.txt)
SELECT DISTINCT e.enom 
    FROM employes e NATURAL JOIN certifications c 
    WHERE NOT EXISTS(SELECT * 
                        FROM certifications c2 
                        WHERE c2.eid=e.eid AND NOT EXISTS(SELECT * 
                                                            FROM avions a 
                                                            WHERE c2.aid=a.aid AND a.portee > 1500) );

-- Q5
SELECT enom
	FROM employes NATURAL JOIN certifications NATURAL JOIN avions
	GROUP BY enom
	HAVING count(aid)>1 AND every(portee > 1500 );

-- Q6
SELECT enom
	FROM employes NATURAL JOIN certifications NATURAL JOIN avions
	GROUP BY enom
	HAVING count(aid)>1 AND every(portee > 1500 ) AND bool_or(anom LIKE '%Boeing%');


-- Q7
SELECT eid
	FROM employes
	WHERE salaire >= ALL(SELECT salaire FROM employes except(SELECT max(salaire) FROM employes)) 
	AND salaire < (SELECT max(salaire) FROM employes);


-- Q8
SELECT enom
	FROM employes NATURAL JOIN certifications NATURAL JOIN avions
	GROUP BY enom
	HAVING count(aid)>1 AND every(portee > 2000 ) AND bool_and(anom NOT LIKE '%Boeing%');


-- Q9
SELECT enom 
	FROM employes 
	WHERE eid NOT IN (SELECT eid 
						FROM certifications) 
			  AND salaire >= (SELECT avg(salaire) 
									FROM employes NATURAL JOIN certifications);

-- Q10 
SELECT (SELECT avg(salaire) FROM employes NATURAL JOIN certifications) - (SELECT avg(salaire) FROM employes) as diff;


