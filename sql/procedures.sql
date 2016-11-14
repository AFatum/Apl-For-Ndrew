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