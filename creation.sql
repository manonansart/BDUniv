DROP TABLE IF EXISTS reserve;
DROP TABLE IF EXISTS passePar;
DROP TABLE IF EXISTS appartient;
DROP TABLE IF EXISTS tache;
DROP TABLE IF EXISTS personne;
DROP TABLE IF EXISTS piece;
DROP USER grtt42;
DROP USER grtt1;

CREATE TABLE piece(
	idP VARCHAR(10) PRIMARY KEY NOT NULL,
	type VARCHAR(15),
	gps_lat REAL,
	gps_long REAL,
	CHECK (type IN ('Bureau', 'Salle de Cours', 'Autre'))
);

CREATE TABLE personne(
	idPers VARCHAR(10) PRIMARY KEY NOT NULL,
	nom VARCHAR(20),
	grade VARCHAR(10),
	CHECK (grade IN ('Etudiant', 'MCF', 'PU', 'BIATOSS', 'PE'))
);

CREATE TABLE tache(
	date date,
	tache VARCHAR(15),
	idPers VARCHAR(10) references personne(idPers) ON DELETE CASCADE,
	PRIMARY KEY (date, tache, idPers),
	CHECK (tache IN ('Enseignement', 'Recherche', 'Réunion'))
);

CREATE TABLE appartient(
	idP VARCHAR(10) references piece(idP) ON DELETE CASCADE,
	idPers VARCHAR(10) references personne(idPers) ON DELETE CASCADE,
	PRIMARY KEY(idP, idPers)
);

CREATE TABLE passePar(
	idP VARCHAR(10) references piece(idP) ON DELETE CASCADE,
	idPers VARCHAR(10) references personne(idPers) ON DELETE CASCADE,
	date date,
	PRIMARY KEY(idP, idPers)
);

CREATE TABLE reserve(
	idP VARCHAR(10) references piece(idP) ON DELETE CASCADE,
	idPers VARCHAR(10) references personne(idPers) ON DELETE CASCADE,
	date date,
	PRIMARY KEY(idP, idPers)
);


-- Les droits
CREATE USER grtt42 WITH PASSWORD 'grtt42';
CREATE USER grtt1 WITH PASSWORD 'grtt1';
GRANT SELECT, UPDATE ON piece TO grtt42;
GRANT SELECT ON piece TO grtt1;

-- Les index
CREATE INDEX personne_nom ON personne (nom varchar_pattern_ops);
CREATE INDEX reserve_date ON reserve (date);