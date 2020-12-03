-- SELECT publications.projnom, equipnum, publinum, titre
-- FROM publications, equipes
-- WHERE code_type = 4
-- ;

SELECT matriculauteur, persnom, persprenom, equipnum, publications.projnom, nomrevue, titre, numordre
FROM publications, membres, auteurs, revue
WHERE code_type = 2
ORDER BY persnom, persprenom;

-- ALTER TABLE publications ADD matriculauteur INT;



-- UPDATE publications 
-- SET matriculauteur = 45
-- WHERE publinum = 30;

-- SELECT* FROM publications;