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
	  
DELIMITER |
CREATE PROCEDURE ins_temp (IN tur INT)
BEGIN
		DELETE FROM results_temp;
		INSERT INTO results_temp
			SELECT * FROM results
			WHERE results.tour < tur + 1
			AND g1 IS NOT NULL
			OR g2 IS NOT NULL;
		SELECT * FROM apl_temp;
END |
DELIMITER ;	
  
DELIMITER |
CREATE PROCEDURE ins_temp (IN tur INT)
BEGIN
		DELETE FROM results_temp;
		INSERT INTO results_temp
			SELECT * FROM results
			WHERE results.tour < tur + 1
			AND g1 IS NOT NULL
			OR g2 IS NOT NULL;
		SELECT tur;
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
