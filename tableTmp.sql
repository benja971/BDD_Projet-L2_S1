-- SELECT publications.projnom, equipnum, publinum, titre
-- FROM publications, equipes
-- WHERE code_type = 4
-- ;

SELECT matriculauteur, persnom, persprenom, membres.equipnum, publications.projnom, nomrevue, titre, numordre
FROM publications, membres, auteurs, revue, projet
WHERE publications.projnom = projet.projnom
AND projet.persnum = membres.persnum
AND code_type = 2
ORDER BY persnom, persprenom;

-- ALTER TABLE auteurs ADD matriculauteur INT;



-- UPDATE auteurs 
-- SET matriculauteur = 45
-- WHERE persnum = 82;

-- SELECT* FROM auteurs;



-- 30	PUBLI_30	06/10/2002	projab	45	1
-- 30	PUBLI_30	06/10/2002	projab	36	2
-- 30	PUBLI_30	06/10/2002	projab	23	3
-- 40	PUBLI_40	20/06/2003	projkk	28	1
-- 10	PUBLI_10	15/08/2003	projxz	77	1
-- 10	PUBLI_10	15/08/2003	projxz	87	2
-- 20	PUBLI_20	30/05/2004	projxx	43	1

-- 5	PUBLI_05	15/08/1999	Revue	2	projxx
-- 10	PUBLI_10	15/08/2003	Interne	4	projxz
-- 15	PUBLI_15	30/05/2001	Journal	3	projxz
-- 20	PUBLI_20	30/05/2004	Interne	4	projxx
-- 25	PUBLI_25	06/10/1999	Conference	1	projab
-- 30	PUBLI_30	06/10/2002	Interne	4	projab
-- 35	PUBLI_35	20/06/2001	Conference	1	projmo
-- 40	PUBLI_40	20/06/2003	Interne	4	projkk
-- 45	PUBLI_45	08/11/2000	Journal	3	projkl
-- 55	PUBLI_55	15/05/2000	Conference	1	projxz
