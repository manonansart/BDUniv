CREATE OR REPLACE FUNCTION estIntru(dateIntru date, pieceIntru VARCHAR(10), idIntru VARCHAR(10))
RETURNS Integer AS $$

DECLARE
	gradeIntru VARCHAR;
	proprio VARCHAR;
	passageProprio Integer;
	

BEGIN

	SELECT p.grade INTO gradeIntru
	FROM personne p
	WHERE p.idPers = idIntru;



	SELECT a.idPers INTO proprio
	FROM appartient a
	WHERE a.idP = pieceIntru;


	IF (gradeIntru = 'PE') THEN
		RETURN 0;
	ELSE
		SELECT count(p.idP) INTO passageProprio
		FROM passePar p
		WHERE p.date = dateIntru
			AND p.idP = pieceIntru
			AND p.idPers = proprio;
		IF (passageProprio > 0) THEN
			RETURN 0;
		END IF;
	END IF;

	RETURN 1;
END $$ LANGUAGE 'plpgsql';