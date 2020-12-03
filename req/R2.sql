
-- R1.2. Liste des auteurs de publications dans des revues internationales.
-- Format [Matricule | Nom | Prénom |N_Equipe | NomProjet | Nom_Revu | Titr_Publi | Ordr_Auteur ] trié par nom, et prénom.
-- 
--  membres.equipnum
--  e

select auteurs.matriculauteur, membres.persnom, membres.persprenom, membres.equipnum, publications.projnom, revue.nomrevue, publications.titre, auteurs.numordre
from auteurs
join publications on auteurs.publinum = publications.publinum
join membres on auteurs.persnum = membres.persnum
join revue on auteurs.publinum = revue.publinum
where publications.code_type = 2
order by membres.persnom, membres.persprenom;




