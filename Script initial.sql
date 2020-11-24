DROP TABLE IF EXISTS Membres ;
CREATE TABLE Membres (persnum INT  AUTO_INCREMENT NOT NULL,
persnom VARCHAR(50),
persprenom VARCHAR(50),
statut VARCHAR(16),
grade INT,
respequip BOOLEAN,
equipnum INT NOT NULL,
PRIMARY KEY (persnum) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS Equipes ;
CREATE TABLE Equipes (equipnum INT  AUTO_INCREMENT NOT NULL,
equipnom VARCHAR(50),
datecreation DATE,
PRIMARY KEY (equipnum) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS Publications ;
CREATE TABLE Publications (publinum INT  AUTO_INCREMENT NOT NULL,
titre VARCHAR(256),
publidate DATE,
publitype VARCHAR(16),
projnom VARCHAR(8) NOT NULL,
PRIMARY KEY (publinum) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS Projet ;
CREATE TABLE Projet (projnom VARCHAR(8)  AUTO_INCREMENT NOT NULL,
projdebut DATE,
projduree INT,
domainnum INT NOT NULL,
persnum INT NOT NULL,
PRIMARY KEY (projnom) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS Contrat ;
CREATE TABLE Contrat (contnum INT  AUTO_INCREMENT NOT NULL,
contdebut DATE,
montant BIGINT,
projnom VARCHAR(8) NOT NULL,
PRIMARY KEY (contnum) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS Organisme ;
CREATE TABLE Organisme (codorg INT  AUTO_INCREMENT NOT NULL,
nomorg VARCHAR(16),
adrorg VARCHAR(100),
qualif VARCHAR(16),
PRIMARY KEY (codorg) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS Domaines ;
CREATE TABLE Domaines (domainnum INT  AUTO_INCREMENT NOT NULL,
d�signation VARCHAR(50),
PRIMARY KEY (domainnum) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS Contacts ;
CREATE TABLE Contacts (idcontact INT  AUTO_INCREMENT NOT NULL,
civilcontac VARCHAR(8),
nomcontac VARCHAR(50),
prencontac VARCHAR(50),
telcontac VARCHAR(16),
faxcontac VARCHAR(16),
mailcontac VARCHAR(100),
codorg INT NOT NULL,
PRIMARY KEY (idcontact) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS Auteurs ;
CREATE TABLE Auteurs (persnum INT  AUTO_INCREMENT NOT NULL,
publinum INT NOT NULL,
numordre SMALLINT,
PRIMARY KEY (persnum,
 publinum) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS Financement ;
CREATE TABLE Financement (contnum INT  AUTO_INCREMENT NOT NULL,
codorg INT NOT NULL,
apport BIGINT,
PRIMARY KEY (contnum,
 codorg) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS ParticipProj ;
CREATE TABLE ParticipProj (persnum INT  AUTO_INCREMENT NOT NULL,
projnom VARCHAR(8) NOT NULL,
tauxparticip INT,
PRIMARY KEY (persnum,
 projnom) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS Dev-Proj ;
CREATE TABLE Dev-Proj (equipnum INT  AUTO_INCREMENT NOT NULL,
projnom VARCHAR(8) NOT NULL,
porteur BOOL,
PRIMARY KEY (equipnum,
 projnom) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS ContraSuivi ;
CREATE TABLE ContraSuivi (contnum INT  AUTO_INCREMENT NOT NULL,
idcontact INT NOT NULL,
PRIMARY KEY (contnum,
 idcontact) ) ENGINE=InnoDB;

ALTER TABLE Membres ADD CONSTRAINT FK_Membres_equipnum FOREIGN KEY (equipnum) REFERENCES Equipes (equipnum);

ALTER TABLE Publications ADD CONSTRAINT FK_Publications_projnom FOREIGN KEY (projnom) REFERENCES Projet (projnom);
ALTER TABLE Projet ADD CONSTRAINT FK_Projet_domainnum FOREIGN KEY (domainnum) REFERENCES Domaines (domainnum);
ALTER TABLE Projet ADD CONSTRAINT FK_Projet_persnum FOREIGN KEY (persnum) REFERENCES Membres (persnum);
ALTER TABLE Contrat ADD CONSTRAINT FK_Contrat_projnom FOREIGN KEY (projnom) REFERENCES Projet (projnom);
ALTER TABLE Contacts ADD CONSTRAINT FK_Contacts_codorg FOREIGN KEY (codorg) REFERENCES Organisme (codorg);
ALTER TABLE Auteurs ADD CONSTRAINT FK_Auteurs_persnum FOREIGN KEY (persnum) REFERENCES Membres (persnum);
ALTER TABLE Auteurs ADD CONSTRAINT FK_Auteurs_publinum FOREIGN KEY (publinum) REFERENCES Publications (publinum);
ALTER TABLE Financement ADD CONSTRAINT FK_Financement_contnum FOREIGN KEY (contnum) REFERENCES Contrat (contnum);
ALTER TABLE Financement ADD CONSTRAINT FK_Financement_codorg FOREIGN KEY (codorg) REFERENCES Organisme (codorg);
ALTER TABLE ParticipProj ADD CONSTRAINT FK_ParticipProj_persnum FOREIGN KEY (persnum) REFERENCES Membres (persnum);
ALTER TABLE ParticipProj ADD CONSTRAINT FK_ParticipProj_projnom FOREIGN KEY (projnom) REFERENCES Projet (projnom);
ALTER TABLE Dev-Proj ADD CONSTRAINT FK_Dev-Proj_equipnum FOREIGN KEY (equipnum) REFERENCES Equipes (equipnum);
ALTER TABLE Dev-Proj ADD CONSTRAINT FK_Dev-Proj_projnom FOREIGN KEY (projnom) REFERENCES Projet (projnom);
ALTER TABLE ContraSuivi ADD CONSTRAINT FK_ContraSuivi_contnum FOREIGN KEY (contnum) REFERENCES Contrat (contnum);
ALTER TABLE ContraSuivi ADD CONSTRAINT FK_ContraSuivi_idcontact FOREIGN KEY (idcontact) REFERENCES Contacts (idcontact);
