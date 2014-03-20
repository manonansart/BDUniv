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
	PRIMARY KEY(idP, idPers, date)
);

CREATE TABLE reservation(
	idP VARCHAR(10) references piece(idP) ON DELETE CASCADE,
	idPers VARCHAR(10) references personne(idPers) ON DELETE CASCADE,
	date date,
	PRIMARY KEY(idP, idPers, date)
);

-- Les données
INSERT INTO personne VALUES ('p1', 'Lance Pierre', 'MCF');
INSERT INTO personne VALUES ('p2', 'Laure Aidubois', 'MCF');
INSERT INTO personne VALUES ('p3', 'Albert Gamotte', 'PU');
INSERT INTO personne VALUES ('p4', 'Tina Pachange', 'BIATOSS');
INSERT INTO personne VALUES ('p5', 'Bruno Zieuvair', 'PE');
INSERT INTO personne VALUES ('p6', 'Geo Graff', 'Etudiant');
INSERT INTO personne VALUES ('p7', 'Louis Dort', 'Etudiant');
INSERT INTO personne VALUES ('p8', 'Marc Assin', 'Etudiant');
INSERT INTO personne VALUES ('p9', 'Mousse Line', 'Etudiant');
INSERT INTO personne VALUES ('p10', 'Amanda Maire', 'Etudiant');

INSERT INTO piece VALUES ('s1', 'Bureau', 49.38, 1.06);
INSERT INTO piece VALUES ('s2', 'Bureau', 49.38, 1.06);
INSERT INTO piece VALUES ('s3', 'Bureau', 49.38, 1.06);
INSERT INTO piece VALUES ('s4', 'Autre', 49.45, 1.06);
INSERT INTO piece VALUES ('s5', 'Autre', 49.38, 1.06);
INSERT INTO piece VALUES ('s6', 'Salle de Cours', 49.38, 1.06);
INSERT INTO piece VALUES ('s7', 'Salle de Cours', 49.45, 1.06);

INSERT INTO appartient (idPers, idP) VALUES('p1', 's1');
INSERT INTO appartient (idPers, idP) VALUES('p2', 's1');
INSERT INTO appartient (idPers, idP) VALUES('p3', 's2');
INSERT INTO appartient (idPers, idP) VALUES('p4', 's3');

INSERT INTO tache (date, idPers, tache) VALUES ('01/02/2014', 'p1', 'Enseignement');
INSERT INTO tache (date, idPers, tache) VALUES ('02/02/2014', 'p1', 'Enseignement');
INSERT INTO tache (date, idPers, tache) VALUES ('12/03/2014', 'p1', 'Recherche');
INSERT INTO tache (date, idPers, tache) VALUES ('01/02/2014', 'p2', 'Recherche');
INSERT INTO tache (date, idPers, tache) VALUES ('05/02/2014', 'p2', 'Enseignement');
INSERT INTO tache (date, idPers, tache) VALUES ('10/01/2014', 'p3', 'Recherche');
INSERT INTO tache (date, idPers, tache) VALUES ('11/01/2014', 'p3', 'Recherche');
INSERT INTO tache (date, idPers, tache) VALUES ('12/01/2014', 'p3', 'Recherche');
INSERT INTO tache (date, idPers, tache) VALUES ('13/01/2014', 'p3', 'Recherche');
INSERT INTO tache (date, idPers, tache) VALUES ('15/03/2014', 'p4', 'Réunion');
INSERT INTO tache (date, idPers, tache) VALUES ('12/03/2014', 'p4', 'Réunion');
INSERT INTO tache (date, idPers, tache) VALUES ('10/02/2014', 'p6', 'Enseignement');
INSERT INTO tache (date, idPers, tache) VALUES ('11/02/2014', 'p6', 'Enseignement');
INSERT INTO tache (date, idPers, tache) VALUES ('12/02/2014', 'p6', 'Enseignement');
INSERT INTO tache (date, idPers, tache) VALUES ('10/02/2014', 'p7', 'Enseignement');
INSERT INTO tache (date, idPers, tache) VALUES ('11/02/2014', 'p7', 'Enseignement');
INSERT INTO tache (date, idPers, tache) VALUES ('12/02/2014', 'p7', 'Enseignement');

INSERT INTO reservation(date, idPers, idP) VALUES('12/03/2014', 'p1', 's4');
INSERT INTO reservation(date, idPers, idP) VALUES('13/03/2014', 'p2', 's6');
INSERT INTO reservation(date, idPers, idP) VALUES('05/02/2014', 'p2', 's6');
INSERT INTO reservation(date, idPers, idP) VALUES('01/02/2014', 'p2', 's5');
INSERT INTO reservation(date, idPers, idP) VALUES('12/01/2014', 'p3', 's6');
INSERT INTO reservation(date, idPers, idP) VALUES('11/01/2014', 'p3', 's5');
INSERT INTO reservation(date, idPers, idP) VALUES('15/03/2014', 'p4', 's7');

INSERT INTO passePar(idPers, idP, date) VALUES('p1', 's1', '12/01/2014');
INSERT INTO passePar(idPers, idP, date) VALUES('p2', 's1', '13/01/2014');
INSERT INTO passePar(idPers, idP, date) VALUES('p7', 's1', '13/01/2014');
INSERT INTO passePar(idPers, idP, date) VALUES('p5', 's1', '14/01/2014');
INSERT INTO passePar(idPers, idP, date) VALUES('p9', 's2', '20/01/2014');
INSERT INTO passePar(idPers, idP, date) VALUES('p3', 's2', '20/01/2014');
INSERT INTO passePar(idPers, idP, date) VALUES('p10', 's3', '20/01/2014');
INSERT INTO passePar(idPers, idP, date) VALUES('p9', 's3', '20/01/2014');
INSERT INTO passePar(idPers, idP, date) VALUES('p3', 's1', '22/01/2014');
INSERT INTO passePar(idPers, idP, date) VALUES('p6', 's7','10/05/2014');

-- Les index
CREATE INDEX personne_nom ON personne (nom varchar_pattern_ops);
CREATE INDEX reservation_date ON reservation (date);

-- Les fonctions
CREATE OR REPLACE FUNCTION tacheCoherente(dateTache date, pers VARCHAR(10)) RETURNS VARCHAR AS $$
DECLARE
	nbReserv Integer;
	salleTache VARCHAR;
	typeTache VARCHAR;
	
BEGIN
	SELECT COUNT(r.idP) INTO nbReserv
	FROM reservation r
	WHERE r.idPers = pers AND r.date = dateTache;

	IF (nbReserv = 0) THEN
		RETURN 'vrai';
	ELSE
		SELECT p.type INTO salleTache
		FROM reservation r, piece p
		WHERE r.idPers = pers 
			AND r.date = dateTache
			AND r.idP = p.idP;

		SELECT t.tache INTO typeTache
		FROM tache t
		WHERE t.idPers = pers AND t.date = dateTache;

		IF (salleTache = 'Bureau' AND (typeTache = 'Recherche' OR typeTache = 'Réunion')) THEN
			RETURN 'vrai';
		END IF;

		IF (salleTache = 'Salle de Cours' AND typeTache = 'Enseignement') THEN
			RETURN 'vrai';
		END IF;

		IF (salleTache = 'Autre' AND typeTache = 'Réunion') THEN
			RETURN 'vrai';
		END IF;

		RETURN 'faux';
	END IF;

END $$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION estIntru(dateIntru date, pieceIntru VARCHAR(10), idIntru VARCHAR(10) ) RETURNS Integer AS $$
DECLARE
	gradeIntru VARCHAR;
	proprio VARCHAR;
	typePiece VARCHAR;
	passageProprio Integer;
	
BEGIN
	SELECT p.grade INTO gradeIntru
	FROM personne p
	WHERE p.idPers = idIntru;

	SELECT pi.type INTO typePiece
	FROM piece pi
	WHERE pi.idP = pieceIntru;

	IF (gradeIntru = 'PE' OR typePiece != 'Bureau') THEN
		RETURN 0;
	ELSE
		SELECT count(p.idP) INTO passageProprio
		FROM passePar p
		WHERE p.date = dateIntru
			AND p.idP = pieceIntru
			AND p.idPers IN 
				(SELECT a.idPers
				FROM appartient a
				WHERE a.idP = pieceIntru);
		IF (passageProprio > 0) THEN
			RETURN 0;
		END IF;
	END IF;

	RETURN 1;

END $$ LANGUAGE 'plpgsql';

-- Vérifications pour les propriétaires de pièce
-- 	- La personne ne peut être un PE ou un Etudiant
-- 	- La personne n'est pas déjà propriétaire d'une autre pièce
-- 	- La pièce est bien un bureau
-- 	- La pièce ne compte pas plus de 2 propriétaires
CREATE OR REPLACE FUNCTION testAppartient() RETURNS trigger AS $$
DECLARE
	gradePer VARCHAR;
	typePiece VARCHAR;
	piecePossedee VARCHAR;
	possedeDejaPiece Integer;
	nbProprietaires Integer;

BEGIN
	SELECT p.grade INTO gradePer
	FROM personne p
	WHERE p.idPers = NEW.idPers;

	SELECT type INTO typePiece
	FROM piece
	WHERE idP = NEW.idP;

	SELECT COUNT(idP) INTO possedeDejaPiece
	FROM appartient
	WHERE idPers = NEW.idPers;

	SELECT COUNT(idP) INTO nbProprietaires
	FROM appartient
	WHERE idP = NEW.idP;

	-- La personne ne peut être un PE ou un Etudiant
	IF (gradePer = 'PE' OR gradePer = 'Etudiant') THEN
		RAISE EXCEPTION '% ne peut être un propriétaire car c''est un %.', NEW.idPers, gradePer;
	END IF;

	-- La personne n'est pas déjà propriétaire d'une autre pièce
	IF (possedeDejaPiece = 1) THEN
		SELECT idP INTO piecePossedee
		FROM appartient
		WHERE idPers = NEW.idPers;

		RAISE EXCEPTION 'La personne % est déjà propriétaire de la pièce % et ne peut donc pas être propriétaire de la pièce %.', NEW.idPers, piecePossedee, NEW.idP;
	END IF;

	-- La pièce est bien un bureau
	IF (typePiece <> 'Bureau') THEN
		RAISE EXCEPTION 'La pièce % n''est pas un bureau et ne peut donc appartenir à personne.', NEW.idP;
	END IF;

	-- La pièce ne compte pas plus de 2 propriétaires
	IF (nbProprietaires >= 2) THEN
		RAISE EXCEPTION 'La pièce % possède déjà 2 propriétaires et ne peut donc en avoir un troisième.', NEW.idP;
	END IF;

	RETURN NEW;
END $$ LANGUAGE 'plpgsql';

-- Vérifications pour une réservation
-- 	- La personne doit être un MCF, un PU ou un BIATOSS
-- 	- La salle ne doit pas déjà être réservée
--	- Les BIATOSS ne peuvent réserver que des salles de type 'Autre'
-- 	- La personne doit réserver une salle cohérente avec la tâche annoncée
CREATE OR REPLACE FUNCTION testReservation() RETURNS trigger AS $$
DECLARE
	nbReserv Integer;
	salleTache VARCHAR;
	typeTache VARCHAR;
	gradePer VARCHAR;
	nbTaches Integer;

BEGIN
	-- Vérification du grade
	SELECT p.grade INTO gradePer
	FROM personne p
	WHERE p.idPers = NEW.idPers;

	IF (gradePer <> 'BIATOSS' AND gradePer <> 'MCF' AND gradePer <> 'PU') THEN
		RAISE EXCEPTION '% ne peut réserver une salle car c''est un %', NEW.idPers, gradePer;
	END IF;

	-- Pas de réservation dans le passé
	IF (NEW.date < current_date) THEN
		RAISE EXCEPTION 'Vous ne pouvez pas réserver une salle pour une date passée.';
	END IF;

	SELECT COUNT(r.idP) INTO nbReserv
	FROM reservation r
	WHERE r.idP = NEW.idP AND r.date = NEW.date;

	-- Erreur si la salle a déjà été réservée
	IF (nbReserv <> 0) THEN
		RAISE EXCEPTION 'La salle % ne peut être réservée pour le % car elle a déjà été reservée.', NEW.idP, NEW.date;
	ELSE
		SELECT p.type INTO salleTache
		FROM piece p
		WHERE p.idP = NEW.idP;

		SELECT COUNT(t.tache) INTO nbTaches
		FROM tache t
		WHERE t.idPers = NEW.idPers AND t.date = NEW.date;

		SELECT t.tache INTO typeTache
		FROM tache t
		WHERE t.idPers = NEW.idPers AND t.date = NEW.date;

		-- Si aucune tâche n'a été réservée c'est ok
		IF (nbTaches = 0) THEN
			RETURN NEW;
		END IF;

		-- Les BIATOSS ne peuvent réserver que des salles de type 'Autre'
		IF (gradePer = 'BIATOSS' AND salleTache <> 'Autre') THEN
			RAISE EXCEPTION 'Les BIATOSS ne peuvent réserver que des salles de type Autre';
		END IF;
		
		-- On vérifie que la salle réservée est cohérente avec la tâche
		IF (salleTache = 'Bureau' AND (typeTache = 'Recherche' OR typeTache = 'Réunion')) THEN
			RETURN NEW;
		END IF;

		IF (salleTache = 'Salle de Cours' AND typeTache = 'Enseignement') THEN
			RETURN NEW;
		END IF;

		IF (salleTache = 'Autre' AND typeTache = 'Réunion') THEN
			RETURN NEW;
		END IF;

		RAISE EXCEPTION 'La salle % (réservée à %) ne peut être réservée pour le % par % car elle ne correspond pas à la tâche %.', NEW.idP, salleTache, NEW.date, NEW.idPers, typeTache;
	END IF;

END $$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION testTache() 
RETURNS trigger AS $$ 
DECLARE 
	gradePersonne VARCHAR;
	typePiece VARCHAR;
BEGIN

	SELECT p.grade INTO gradePersonne 
	FROM personne p 
	WHERE NEW.idPers = p.idPers;

	SELECT p.type INTO typePiece 
	FROM piece p, reservation r 
	WHERE p.idP = r.idP
	AND NEW.date = r.date;

	-- Vérification du grade
	IF (gradePersonne = 'PE') THEN
		RAISE EXCEPTION 'Les personnels d''entretien ne sont pas concernés par cette gestion de planning.';
	END IF;

	IF (gradePersonne = 'Etudiant' AND typeDeLaTache <> 'Enseignement') THEN
		RAISE EXCEPTION 'Un BIATOSS ne peut pas effectuer une tâche de type %.', typeDeLaTache;
	END IF;

	IF (gradePersonne = 'BIATOSS' AND typeDeLaTache <> 'Réunion') THEN
		RAISE EXCEPTION 'Un BIATOSS ne peut pas effectuer une tâche de type %.', typeDeLaTache;
	END IF;

	-- Vérification entre pièce et tâche
	IF (typePiece = 'Bureau' AND NEW.tache = 'Enseignement') THEN
		RAISE EXCEPTION 'Un bureau ne peut pas être réservé pour faire de l''enseignement.';
	END IF;

	IF (typePiece = 'Salle de Cours' AND NEW.tache <> 'Enseignement') THEN
		RAISE EXCEPTION 'Une salle de cours ne peut être réservée que pour faire de l''enseignement.';
	END IF;

	IF (typePiece = 'Autre' AND NEW.tache <> 'Réunion') THEN
		RAISE EXCEPTION 'Une salle de type autre ne peut être réservée que pour faire une réunion.';
	END IF;

RETURN NEW;
END $$ LANGUAGE 'plpgsql';

-- Les vues
CREATE VIEW rapport_activite AS 
	SELECT t.date date, p.nom nom, tacheCoherente(t.date, p.idPers) ok 
	FROM tache t, personne p 
	WHERE t.idPers = p.idPers;

CREATE VIEW intrusion AS
	SELECT p.date date, p.idP salle, pe.nom intru
	FROM passePar p, personne pe
	WHERE p.idPers = pe.idPers
	AND estIntru(p.date, p.idP, p.idPers) = 1;

-- Les triggers
CREATE TRIGGER triggerAppartient
BEFORE INSERT OR UPDATE ON appartient
FOR EACH ROW EXECUTE PROCEDURE testAppartient();

CREATE TRIGGER triggerReservation
BEFORE INSERT OR UPDATE ON reservation
FOR EACH ROW EXECUTE PROCEDURE testReservation();

CREATE TRIGGER triggerTache
BEFORE INSERT OR UPDATE ON tache 
FOR EACH ROW EXECUTE PROCEDURE testTache();

-- Les droits
GRANT SELECT, UPDATE ON tache TO grtt42;
GRANT SELECT, UPDATE ON passepar TO grtt42;
GRANT SELECT, UPDATE ON piece TO grtt42;
GRANT SELECT, UPDATE ON personne TO grtt42;
GRANT SELECT, UPDATE ON rapport_activite TO grtt42;
GRANT SELECT, UPDATE ON intrusion TO grtt42;
GRANT SELECT, UPDATE ON appartient TO grtt42;
GRANT SELECT, UPDATE ON reservation TO grtt42;
GRANT SELECT ON tache TO grtt11;
GRANT SELECT ON passepar TO grtt11;
GRANT SELECT ON piece TO grtt11;
GRANT SELECT ON personne TO grtt11;
GRANT SELECT ON rapport_activite TO grtt11;
GRANT SELECT ON intrusion TO grtt11;
GRANT SELECT ON appartient TO grtt11;
GRANT SELECT ON reservation TO grtt11;