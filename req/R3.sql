-- R1.3. Liste des contrats qui financent les projets supports de publications dans des conférences.
-- Format [N_Contrat | Montant_Contrat | Nom_Projet | Nom_Conf | Titr_Publi ] trié par valeur croissante des montant de contrat.

select contrat.contnum, contrat.montant, publications.projnom, conference.nomconf, publications.titre
from contrat
join publications on contrat.projnom = publications.projnom
join conference on publications.publinum = conference.publinum
order by contrat.montant asc;