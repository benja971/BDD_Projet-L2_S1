DROP TABLE IF EXISTS Membres ;
CREATE TABLE Membres (persnum INT NOT NULL,
persnom VARCHAR(50),
persprenom VARCHAR(50),
statut VARCHAR(16),
grade INT,
respequip VARCHAR,
equipnum INT NOT NULL,
PRIMARY KEY (persnum) );

DROP TABLE IF EXISTS Equipes ;
CREATE TABLE Equipes (equipnum INT NOT NULL,
equipnom VARCHAR(50),
datecreation DATE,
PRIMARY KEY (equipnum) );

DROP TABLE IF EXISTS Publications ;
CREATE TABLE Publications (publinum INT NOT NULL,
titre VARCHAR(256),
publidate DATE,
code_type_publi INT,
libelle_type_publi VARCHAR(15),
projnom VARCHAR(8) NOT NULL,
PRIMARY KEY (publinum) );

DROP TABLE IF EXISTS Projet ;
CREATE TABLE Projet (projnom VARCHAR(8) NOT NULL,
projdebut DATE,
projduree INT,
domainnum INT NOT NULL,
persnum INT NOT NULL,
PRIMARY KEY (projnom) );

DROP TABLE IF EXISTS Contrat ;
CREATE TABLE Contrat (contnum INT NOT NULL,
contdebut DATE,
montant BIGINT,
projnom VARCHAR(8) NOT NULL,
PRIMARY KEY (contnum) );

DROP TABLE IF EXISTS Organisme ;
CREATE TABLE Organisme (codorg INT NOT NULL,
nomorg VARCHAR(16),
adrorg VARCHAR(100),
qualif VARCHAR(16),
PRIMARY KEY (codorg) );

DROP TABLE IF EXISTS Domaines ;
CREATE TABLE Domaines (domainnum INT NOT NULL,
designation VARCHAR(50),
PRIMARY KEY (domainnum) );

DROP TABLE IF EXISTS Contacts ;
CREATE TABLE Contacts (idcontact INT NOT NULL,
civilcontac VARCHAR(8),
nomcontac VARCHAR(50),
prencontac VARCHAR(50),
telcontac VARCHAR(16),
faxcontac VARCHAR(16),
mailcontac VARCHAR(100),
codorg INT NOT NULL,
PRIMARY KEY (idcontact) );

DROP TABLE IF EXISTS Conference ;
CREATE TABLE Conference (reference_conference VARCHAR(50) NOT NULL,
nom_conference VARCHAR(50),
pays_conference VARCHAR(50),
publinum INT NOT NULL,
PRIMARY KEY (reference_conference) );

DROP TABLE IF EXISTS Revue ;
CREATE TABLE Revue (reference_revue VARCHAR(50) NOT NULL,
nom_revue VARCHAR(50),
portee_revue VARCHAR(50),
langue_revue VARCHAR(50),
publinum INT NOT NULL,
PRIMARY KEY (reference_revue) );

DROP TABLE IF EXISTS Journal ;
CREATE TABLE Journal (reference_journal VARCHAR(50) NOT NULL,
categorie_journal VARCHAR(50),
nom_journal VARCHAR(50),
publinum INT NOT NULL,
PRIMARY KEY (reference_journal) );

DROP TABLE IF EXISTS Auteurs ;
CREATE TABLE Auteurs (persnum INT NOT NULL,
publinum INT NOT NULL,
numordre SMALLINT,
PRIMARY KEY (persnum,
 publinum) );

DROP TABLE IF EXISTS Financement ;
CREATE TABLE Financement (contnum INT NOT NULL,
codorg INT NOT NULL,
apport BIGINT,
PRIMARY KEY (contnum,
 codorg) );

DROP TABLE IF EXISTS ParticipProj ;
CREATE TABLE ParticipProj (persnum INT NOT NULL,
projnom VARCHAR(8) NOT NULL,
tauxparticip INT,
PRIMARY KEY (persnum,
 projnom) );

DROP TABLE IF EXISTS Dev_Proj ;
CREATE TABLE Dev_Proj (equipnum INT NOT NULL,
projnom VARCHAR(8) NOT NULL,
porteur BOOL,
PRIMARY KEY (equipnum,
 projnom) );

DROP TABLE IF EXISTS ContraSuivi ;
CREATE TABLE ContraSuivi (contnum INT NOT NULL,
idcontact INT NOT NULL,
PRIMARY KEY (contnum,
 idcontact) );

DROP TABLE IF EXISTS PubliInterne ;
CREATE TABLE PubliInterne (projnom VARCHAR(8) NOT NULL,
publinum INT NOT NULL,
matricule_auteur_ INT,
ordre_auteur_dans_publi INT,
PRIMARY KEY (projnom,
 publinum) );

ALTER TABLE Membres ADD CONSTRAINT FK_Membres_equipnum FOREIGN KEY (equipnum) REFERENCES Equipes (equipnum);

ALTER TABLE Publications ADD CONSTRAINT FK_Publications_projnom FOREIGN KEY (projnom) REFERENCES Projet (projnom);
ALTER TABLE Projet ADD CONSTRAINT FK_Projet_domainnum FOREIGN KEY (domainnum) REFERENCES Domaines (domainnum);
ALTER TABLE Projet ADD CONSTRAINT FK_Projet_persnum FOREIGN KEY (persnum) REFERENCES Membres (persnum);
ALTER TABLE Contrat ADD CONSTRAINT FK_Contrat_projnom FOREIGN KEY (projnom) REFERENCES Projet (projnom);
ALTER TABLE Contacts ADD CONSTRAINT FK_Contacts_codorg FOREIGN KEY (codorg) REFERENCES Organisme (codorg);
ALTER TABLE Conference ADD CONSTRAINT FK_Conference_publinum FOREIGN KEY (publinum) REFERENCES Publications (publinum);
ALTER TABLE Revue ADD CONSTRAINT FK_Revue_publinum FOREIGN KEY (publinum) REFERENCES Publications (publinum);
ALTER TABLE Journal ADD CONSTRAINT FK_Journal_publinum FOREIGN KEY (publinum) REFERENCES Publications (publinum);
ALTER TABLE Auteurs ADD CONSTRAINT FK_Auteurs_persnum FOREIGN KEY (persnum) REFERENCES Membres (persnum);
ALTER TABLE Auteurs ADD CONSTRAINT FK_Auteurs_publinum FOREIGN KEY (publinum) REFERENCES Publications (publinum);
ALTER TABLE Financement ADD CONSTRAINT FK_Financement_contnum FOREIGN KEY (contnum) REFERENCES Contrat (contnum);
ALTER TABLE Financement ADD CONSTRAINT FK_Financement_codorg FOREIGN KEY (codorg) REFERENCES Organisme (codorg);
ALTER TABLE ParticipProj ADD CONSTRAINT FK_ParticipProj_persnum FOREIGN KEY (persnum) REFERENCES Membres (persnum);
ALTER TABLE ParticipProj ADD CONSTRAINT FK_ParticipProj_projnom FOREIGN KEY (projnom) REFERENCES Projet (projnom);
ALTER TABLE Dev_Proj ADD CONSTRAINT FK_Dev_Proj_equipnum FOREIGN KEY (equipnum) REFERENCES Equipes (equipnum);
ALTER TABLE Dev_Proj ADD CONSTRAINT FK_Dev_Proj_projnom FOREIGN KEY (projnom) REFERENCES Projet (projnom);
ALTER TABLE ContraSuivi ADD CONSTRAINT FK_ContraSuivi_contnum FOREIGN KEY (contnum) REFERENCES Contrat (contnum);
ALTER TABLE ContraSuivi ADD CONSTRAINT FK_ContraSuivi_idcontact FOREIGN KEY (idcontact) REFERENCES Contacts (idcontact);
ALTER TABLE PubliInterne ADD CONSTRAINT FK_PubliInterne_projnom FOREIGN KEY (projnom) REFERENCES Projet (projnom);
ALTER TABLE PubliInterne ADD CONSTRAINT FK_PubliInterne_publinum FOREIGN KEY (publinum) REFERENCES Publications (publinum);
