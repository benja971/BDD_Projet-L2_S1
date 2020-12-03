
-- R1.4. Etat présentant la répartition des publications par type.
-- Format [Typ_Publi | Nb_Publi ] trié par valeur décroissante du nombre de publication ; où Typ_Publi est le libellé du type de publication et Nb_Publi le nombre de publication de ce type.

select publications.libelle_type, publications.publinum
from publications
order by publications.publinum desc;