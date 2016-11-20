DELIMITER |
CREATE PROCEDURE det ()
SELECT	table_name, 
		table_comment,
		table_rows,
		ENGINE,
		table_collation
	FROM information_schema.tables
	WHERE table_schema = 'pl';
END; |
DELIMITER ;

DROP PROCEDURE IF EXISTS col_info;
DROP PROCEDURE IF EXISTS table_info;

DELIMITER |
CREATE PROCEDURE des (IN tb CHARACTER (20))
SELECT	column_name, 
		data_type,
		column_default,
		is_nullable,
		column_key,
		extra,
		column_comment
	FROM information_schema.columns
	WHERE table_schema = 'pl'
	AND table_name = tb;
END; |
DELIMITER ;

SELECT	table_name, 
		table_comment,
		table_rows,
		ENGINE,
		table_collation
	FROM information_schema.tables
	WHERE table_schema = 'pl';
	
	DROP VIEW IF EXISTS tab_info;
CREATE VIEW currCourses AS
	SELECT DISTINCT course
		FROM lessons
		WHERE MONTH(lesson_date) = 9
		  AND YEAR(lesson_date) = 2006
END; |
		  
SHOW PROCEDURE STATUS LIKE 'pattern';

DROP PROCEDURE IF EXISTS ins_temp;
		  
DELIMITER |
CREATE PROCEDURE ins_temp (IN tur INT)
	IF ((SELECT MAX(tour) FROM results_temp) = tur)
		THEN SELECT * FROM apl_temp;
	ELSE 
		DELETE FROM results_temp;
		INSERT INTO results_temp
			SELECT * FROM results
			WHERE tour < tur + 1
			AND g1 IS NOT NULL
			OR g2 IS NOT NULL;
		SELECT * FROM apl_temp;
	END IF;
END; |
DELIMITER ;
	  
	SELECT * FROM results
		WHERE tour < 2
		AND EXISTS(SELECT * FROM results as res
					WHERE res.g1 IS NOT NULL
						OR res.g2 IS NOT NULL);
		AND g1 IS NOT NULL
		OR g2 IS NOT NULL;
	  
	  
DELIMITER |
CREATE PROCEDURE ins_temp (IN tur INT)
BEGIN
		DELETE FROM results_temp;
		INSERT INTO results_temp
			SELECT * FROM results
			WHERE tour < tur + 1
			AND EXISTS	(SELECT * FROM results AS res 
							WHERE res.g1 IS NOT NULL
							OR res.g2 IS NOT NULL);
		SELECT * FROM apl_temp;
END |
DELIMITER ;
  
DELIMITER |
CREATE PROCEDURE ins_temp (IN tur INT)
BEGIN
		DELETE FROM results_temp;
		INSERT INTO results_temp
			SELECT * FROM results
			WHERE tour < tur + 1
			AND g1 IS NOT NULL
			OR g2 IS NOT NULL;
		SELECT tur +1;
END |

DELIMITER ; 


DROP PROCEDURE IF EXISTS ins_temp;
DELIMITER |
CREATE PROCEDURE ins_temp (IN tur INT)
BEGIN
	UPDATE apl_temp
	SET plays = 0,
		wins = 0,
		nich = 0,
		lose = 0,
		goals_out = 0,
		goals_in = 0,
		goals_res = 0,
		points = 0;
		
		DELETE FROM results_temp;
		INSERT INTO results_temp
			SELECT * FROM results
			WHERE tour < tur + 1
			AND EXISTS	(SELECT * FROM results AS res 
							WHERE res.g1 IS NOT NULL
							OR res.g2 IS NOT NULL);
		SELECT * FROM apl_temp ORDER BY points DESC, goals_res DESC, goals_out DESC;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS upd;
DELIMITER |
CREATE PROCEDURE upd (IN rg1 INT, IN rg2 INT, IN idm INT)
BEGIN
	IF EXISTS(SELECT * FROM results WHERE id = idm AND status = 0) THEN
		CALL upd_res_new(rg1, rg2, idm);
	END IF;
	
	IF EXISTS(SELECT * FROM results WHERE id = idm AND status = 1) THEN
		CALL upd_res_old(rg1, rg2, idm);
	END IF;
END |
DELIMITER ;


DROP PROCEDURE IF EXISTS upd_res_new;
DELIMITER |
CREATE PROCEDURE upd_res_new (IN rg1 INT, IN rg2 INT, IN idm INT)
BEGIN
	UPDATE results
		SET g1 = rg1,
			g2 = rg2,
			status = 1
		WHERE id = idm;
		
		IF rg1 > rg2 THEN
			UPDATE apl
			SET apl.wins = apl.wins + 1,
				apl.points = apl.points + 3,
				apl.plays = apl.plays + 1,
				apl.goals_out = apl.goals_out + rg1,
				apl.goals_in = apl.goals_in + rg2
			WHERE apl.name = ANY (SELECT t1 FROM results WHERE id = idm);
			UPDATE apl
			SET apl.lose = apl.lose + 1,
				apl.plays = apl.plays + 1,
				apl.goals_out = apl.goals_out + rg2,
				apl.goals_in = apl.goals_in + rg1
			WHERE apl.name = ANY (SELECT t2 FROM results WHERE id = idm);
		END IF;
		
		IF rg1 < rg2 THEN
			UPDATE apl
			SET apl.wins = apl.wins + 1,
				apl.points = apl.points + 3,
				apl.plays = apl.plays + 1,
				apl.goals_out = apl.goals_out + rg2,
				apl.goals_in = apl.goals_in + rg1
			WHERE apl.name = ANY (SELECT t2 FROM results WHERE id = idm);
			UPDATE apl
			SET apl.lose = apl.lose + 1,
				apl.plays = apl.plays + 1,
				apl.goals_out = apl.goals_out + rg1,
				apl.goals_in = apl.goals_in + rg2
			WHERE apl.name = ANY (SELECT t1 FROM results WHERE id = idm);
		END IF;
		
		IF rg1 = rg2 THEN
			UPDATE apl
			SET apl.nich = apl.nich + 1,
				apl.points = apl.points + 1,
				apl.plays = apl.plays + 1
			WHERE apl.name = ANY (SELECT t1 FROM results WHERE id = idm)
			OR apl.name = ANY (SELECT t2 FROM results WHERE id = idm);
		
			UPDATE apl
			SET apl.goals_out = apl.goals_out + rg1,
				apl.goals_in = apl.goals_in + rg2
			WHERE apl.name = ANY (SELECT t1 FROM results WHERE id = idm);
			
			UPDATE apl
			SET apl.goals_out = apl.goals_out + rg2,
				apl.goals_in = apl.goals_in + rg1
			WHERE apl.name = ANY (SELECT t2 FROM results WHERE id = idm);
		END IF;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS upd_res_old;
DELIMITER |
CREATE PROCEDURE upd_res_old (IN rg1 INT, IN rg2 INT, IN idm INT)
BEGIN
	IF rg1 > rg2 THEN
		/* если итог матча не изменился, меняем только забитые/пропущенные */
		IF EXISTS(SELECT * FROM results WHERE g1 > g2 AND id = idm) THEN
			CALL goals_upd(rg1, rg2, idm);
		END IF;

		/* меняем результаты побед местами t1 на t2*/
		IF EXISTS(SELECT * FROM results WHERE g1 < g2 AND id = idm) THEN
			CALL goals_upd(rg1, rg2, idm);
			
			UPDATE apl
			SET apl.points = apl.points - 3,
				apl.wins = apl.wins - 1,
				apl.lose = apl.lose + 1
			WHERE apl.name = ANY(SELECT t1 FROM results WHERE id = idm);
			
			UPDATE apl
			SET apl.points = apl.points + 3,
				apl.wins = apl.wins + 1,
				apl.lose = apl.lose - 1
			WHERE apl.name = ANY(SELECT t2 FROM results WHERE id = idm);
		END IF;
		
		/* меняем результаты если ничья*/
		IF EXISTS(SELECT * FROM results WHERE g1 = g2 AND id = idm) THEN
			CALL goals_upd(rg1, rg2, idm);
			
			UPDATE apl
			SET apl.points = apl.points - 3,
				apl.wins = apl.wins - 1
			WHERE apl.name = ANY(SELECT t1 FROM results WHERE id = idm);
			
			UPDATE apl
			SET apl.lose = apl.lose - 1
			WHERE apl.name = ANY(SELECT t2 FROM results WHERE id = idm);
			
			UPDATE apl
			SET apl.points = apl.points + 1,
				apl.nich = apl.nich + 1
			WHERE apl.name = ANY(SELECT t1 FROM results WHERE id = idm)
			OR apl.name = ANY(SELECT t2 FROM results WHERE id = idm);			
		END IF;
	END IF;
	
	
	
	IF rg1 < rg2 THEN
		/* если итог матча не изменился, меняем только забитые/пропущенные */
		IF EXISTS(SELECT * FROM results WHERE g1 < g2 AND id = idm) THEN
			CALL goals_upd(rg1, rg2, idm);
		END IF;	
		
		/* меняем результаты побед местами t1 на t2*/
		IF EXISTS(SELECT * FROM results WHERE g1 > g2 AND id = idm) THEN
			CALL goals_upd(rg1, rg2, idm);
			
			UPDATE apl
			SET apl.points = apl.points - 3,
				apl.wins = apl.wins - 1,
				apl.lose = apl.lose + 1
			WHERE apl.name = ANY(SELECT t2 FROM results WHERE id = idm);
			
			UPDATE apl
			SET apl.points = apl.points + 3,
				apl.wins = apl.wins + 1,
				apl.lose = apl.lose - 1
			WHERE apl.name = ANY(SELECT t1 FROM results WHERE id = idm);
		END IF;
		
		/* меняем результаты если ничья*/
		IF EXISTS(SELECT * FROM results WHERE g1 = g2 AND id = idm) THEN
			CALL goals_upd(rg1, rg2, idm);
			
			UPDATE apl
			SET apl.points = apl.points - 3,
				apl.wins = apl.wins - 1
			WHERE apl.name = ANY(SELECT t2 FROM results WHERE id = idm);
			
			UPDATE apl
			SET apl.lose = apl.lose - 1
			WHERE apl.name = ANY(SELECT t1 FROM results WHERE id = idm);
			
			UPDATE apl
			SET apl.points = apl.points + 1,
				apl.nich = apl.nich + 1
			WHERE apl.name = ANY(SELECT t1 FROM results WHERE id = idm)
			OR apl.name = ANY(SELECT t2 FROM results WHERE id = idm);			
		END IF;
	END IF;
	
	IF rg1 = rg2 THEN
		/* если итог матча не изменился, меняем только забитые/пропущенные */
		IF EXISTS(SELECT * FROM results WHERE g1 = g2 AND id = idm) THEN
			CALL goals_upd(rg1, rg2, idm);
		END IF;	
		
		/* меняем результаты побед местами t1 на t2*/
		IF EXISTS(SELECT * FROM results WHERE g1 > g2 AND id = idm) THEN
			CALL goals_upd(rg1, rg2, idm);
			
			UPDATE apl
			SET apl.points = apl.points - 3,
				apl.wins = apl.wins - 1
			WHERE apl.name = ANY(SELECT t1 FROM results WHERE id = idm);
			
			UPDATE apl
			SET apl.lose = apl.lose - 1
			WHERE apl.name = ANY(SELECT t2 FROM results WHERE id = idm);
			
			UPDATE apl
			SET apl.points = apl.points + 1,
				apl.nich = apl.nich + 1
			WHERE apl.name = ANY(SELECT t1 FROM results WHERE id = idm)
			OR apl.name = ANY(SELECT t2 FROM results WHERE id = idm);	
		END IF;
		
		/* меняем результаты если ничья*/
		IF EXISTS(SELECT * FROM results WHERE g1 < g2 AND id = idm) THEN
			CALL goals_upd(rg1, rg2, idm);
			
			UPDATE apl
			SET apl.points = apl.points - 3,
				apl.wins = apl.wins - 1
			WHERE apl.name = ANY(SELECT t2 FROM results WHERE id = idm);
			
			UPDATE apl
			SET apl.lose = apl.lose - 1
			WHERE apl.name = ANY(SELECT t1 FROM results WHERE id = idm);
			
			UPDATE apl
			SET apl.points = apl.points + 1,
				apl.nich = apl.nich + 1
			WHERE apl.name = ANY(SELECT t1 FROM results WHERE id = idm)
			OR apl.name = ANY(SELECT t2 FROM results WHERE id = idm);			
		END IF;
	END IF;

END |
DELIMITER ;


DROP PROCEDURE IF EXISTS goals_upd;
DELIMITER |
CREATE PROCEDURE goals_upd (IN rg1 INT, IN rg2 INT, IN idm INT)
BEGIN
	UPDATE apl, (SELECT g1, t1 FROM results WHERE id = idm) AS res
	SET apl.goals_out = apl.goals_out - res.g1
	WHERE apl.name = res.t1;
	
	UPDATE apl, (SELECT g1, t1 FROM results WHERE id = idm) AS res
	SET apl.goals_in = apl.goals_in - res.g1
	WHERE apl.name = res.t1;
	
	UPDATE apl, (SELECT g1, t2 FROM results WHERE id = idm) AS res
	SET apl.goals_out = apl.goals_out - res.g1
	WHERE apl.name = res.t2;
	
	UPDATE apl, (SELECT g1, t2 FROM results WHERE id = idm) AS res
	SET apl.goals_in = apl.goals_in - res.g1
	WHERE apl.name = res.t2;
	
	UPDATE apl, (SELECT t1, t2 FROM results WHERE id = idm) AS res
	SET apl.goals_res = apl.goals_out - apl.goals_in
	WHERE apl.name = res.t1 OR apl.name = res.t2;
	
	UPDATE apl
	SET apl.goals_out = apl.goals_out + rg1,
		apl.goals_in = apl.goals_in + rg2
	WHERE apl.name = ANY(SELECT t1 FROM results WHERE id = idm);
	
	UPDATE apl
	SET apl.goals_out = apl.goals_out + rg2,
		apl.goals_in = apl.goals_in + rg1
	WHERE apl.name = ANY(SELECT t2 FROM results WHERE id = idm);
	
	UPDATE apl, (SELECT t1, t2 FROM results WHERE id = idm) AS res
	SET apl.goals_res = apl.goals_out - apl.goals_in
	WHERE apl.name = res.t1 OR apl.name = res.t2;
	
	UPDATE results
	SET g1 = rg1,
		g2 = rg2
	WHERE id = idm;
END |
DELIMITER ;



DROP PROCEDURE IF EXISTS test;
DELIMITER |
CREATE PROCEDURE test(IN t INT)
BEGIN
	IF EXISTS (SELECT * FROM results WHERE g1<g2 AND id = t)
		THEN SELECT 'Победа';
		ELSE SELECT 'Не победа';
	END IF;
END |
DELIMITER ;



IF (SELECT g1 FROM results WHERE id = 9 > SELECT g2 FROM results WHERE id = 9) 
	THEN
		SELECT ('Победа');
ELSE SELECT ('Не победа');
END IF;

SELECT IF(EXISTS(SELECT g1, g2 FROM results WHERE g1 > g2 AND id = 110), 'Победа', 'Не победа');
IF(EXISTS(SELECT g1, g2 FROM results WHERE g1 > g2 AND id = 110), SELECT 'Победа', SELECT 'Не победа');


SHOW CREATE PROCEDURE upd_res \G
SHOW CREATE PROCEDURE goals_upd \G

DROP PROCEDURE IF EXISTS upd_apl;
DELIMITER |
CREATE PROCEDURE upd_apl (IN idm INT)
BEGIN	
	UPDATE apl
		SET apl.goals_out = apl.goals_out + NEW.results.g1,
			apl.goals_in = apl.goals_in + NEW.results.g2
		WHERE NEW.results.t1 = apl.name;	
		
	UPDATE apl
		SET apl.goals_out = apl.goals_out + NEW.results.g2,
			apl.goals_in = apl.goals_in + NEW.results.g2
		WHERE NEW.results.t2 = apl.name;
	
	IF NEW.results.g1 > NEW.results.g2 THEN
		UPDATE apl
			SET	wins = wins + 1,
				points = points + 3
			WHERE NEW.results.t1 = apl.name;
		UPDATE apl
			SET lose = lose + 1
			WHERE NEW.results.t2 = apl.name;
	END IF;
	
	IF NEW.results.g1 < NEW.results.g2 THEN
		UPDATE apl
			SET	wins = wins + 1,
				points = points + 3
			WHERE NEW.results.t2 = apl.name;
		UPDATE apl
			SET lose = lose + 1
			WHERE NEW.results.t1 = apl.name;
	END IF;
	
	IF NEW.results.g1 = NEW.results.g2 THEN
		UPDATE apl
			SET	nich = wins + 1,
				points = points + 1
			WHERE NEW.results.t1 = apl.name
				OR NEW.results.t2 = apl.name;
	END IF;
END |
DELIMITER ;


/* Обнуляем старые результаты */
	UPDATE apl_temp SET
	plays = 0,
	wins = 0,
	nich = 0,
	lose = 0,
	goals_out = 0,
	goals_in = 0,
	goals_res = 0,
	points = 0;


/* Новая версия процедуры ins_temp */
DROP PROCEDURE IF EXISTS ins_temp;
DELIMITER |
CREATE PROCEDURE ins_temp (IN idm INT)
BEGIN
	/* Если победа хозяев */
	IF EXISTS (SELECT * FROM results_temp WHERE g1 > g2 AND id = idm) THEN
		UPDATE apl_temp AS atp, (SELECT t1, g1, g2 FROM results_temp WHERE id = idm) AS res
		SET 
			atp.plays = atp.plays + 1,
			atp.wins = atp.wins + 1,
			atp.goals_out = atp.goals_out + res.g1,
			atp.goals_in = atp.goals_in + res.g2,
			atp.goals_res = atp.goals_out - atp.goals_in,
			atp.points = atp.points + 3
		WHERE atp.name = res.t1;
		
		UPDATE apl_temp AS atp, (SELECT t2, g1, g2 FROM results_temp WHERE id = idm) AS res
		SET 
			atp.plays = atp.plays + 1,
			atp.lose = atp.lose + 1,
			atp.goals_out = atp.goals_out + res.g2,
			atp.goals_in = atp.goals_in + res.g1,
			atp.goals_res = atp.goals_out - atp.goals_in
		WHERE atp.name = res.t2;
	END IF;
	
	/* Если победа гостей*/
	IF EXISTS (SELECT * FROM results_temp WHERE g1 < g2 AND id = idm) THEN
		UPDATE apl_temp AS atp, (SELECT t2, g1, g2 FROM results_temp WHERE id = idm) AS res
		SET 
			atp.plays = atp.plays + 1,
			atp.wins = atp.wins + 1,
			atp.goals_out = atp.goals_out + res.g2,
			atp.goals_in = atp.goals_in + res.g1,
			atp.goals_res = atp.goals_out - atp.goals_in,
			atp.points = atp.points + 3
		WHERE atp.name = res.t2;
		
		UPDATE apl_temp AS atp, (SELECT t1, g1, g2 FROM results_temp WHERE id = idm) AS res
		SET 
			atp.plays = atp.plays + 1,
			atp.lose = atp.lose + 1,
			atp.goals_out = atp.goals_out + res.g1,
			atp.goals_in = atp.goals_in + res.g2,
			atp.goals_res = atp.goals_out - atp.goals_in
		WHERE atp.name = res.t1;
	END IF;
	
	/* Если ничья*/
	IF EXISTS (SELECT * FROM results_temp WHERE g1 = g2 AND id = idm) THEN
		UPDATE apl_temp AS atp, (SELECT t2, g1, g2 FROM results_temp WHERE id = idm) AS res
		SET 
			atp.plays = atp.plays + 1,
			atp.nich = atp.nich + 1,
			atp.goals_out = atp.goals_out + res.g2,
			atp.goals_in = atp.goals_in + res.g1,
			atp.goals_res = atp.goals_out - atp.goals_in,
			atp.points = atp.points + 1
		WHERE atp.name = res.t2;
		
		UPDATE apl_temp AS atp, (SELECT t1, g1, g2 FROM results_temp WHERE id = idm) AS res
		SET 
			atp.plays = atp.plays + 1,
			atp.nich = atp.nich + 1,
			atp.goals_out = atp.goals_out + res.g1,
			atp.goals_in = atp.goals_in + res.g2,
			atp.goals_res = atp.goals_out - atp.goals_in,
			atp.points = atp.points + 1
		WHERE atp.name = res.t1;
	END IF;
END |
DELIMITER ;

/* Процедурв по внесении и возврата данных в таблицу results_temp */
DROP PROCEDURE IF EXISTS ins_tempRes;
DELIMITER |
CREATE PROCEDURE ins_tempRes (IN idm INT)
BEGIN
	DELETE FROM results_temp;
	INSERT INTO results_temp  SELECT id, t1, t2, g1, g2, tour, date  
								FROM results WHERE tour < idm + 1;
	SELECT * FROM results_temp;
END |
DELIMITER ;

SHOW PROCEDURE STATUS \G

SHOW CREATE PROCEDURE ins_temp \G

select * from results 
where tour < 11

SELECT * FROM results
WHERE tour < 11
AND g1 IS NOT NULL
OR g2 IS NOT NULL;
