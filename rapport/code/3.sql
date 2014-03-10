CREATE OR REPLACE FUNCTION estIntru(dateIntru date, pieceIntru VARCHAR(10), idIntru VARCHAR(10))
RETURNS Integer AS $$

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