-- R1.5. Liste des journaux dans lesquels ont été faites des publications.
-- Format [NomJournal | Catégorie | Nbre_Publi ] trié catégorie puis par nom de journal ; où Nb_Publi le nombre de publication faites dans le journal.

select journal.nomjournal, journal.catjournal, publications.publinum
from journal
join publications on journal.publinum = publications.publinum
order by journal.catjournal, journal.nomjournal;