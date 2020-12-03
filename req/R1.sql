-- R1.1. Etat recensant les projets supports de publications internes.
-- Format [Nom_Projet | N_Equip_Porteuse | N_publi | Titre_publi] trié par nom de projet.

select projet.projnom, dev_proj.equipnum, publications.publinum, publications.titre
from projet
join publications on projet.projnom = publications.projnom
join dev_proj on publications.projnom = dev_proj.projnom
where publications.code_type = 4;
