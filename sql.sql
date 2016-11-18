SELECT res.id, res.g1, res.g2, res.tour, res.date, pl.name 
FROM res, pl
WHERE res.t1 = pl.code AND res.t2 = pl.code;

SELECT res.id, res.g1, res.g2, res.tour, res.date, pl.name 
FROM res
LEFT JOIN pl ON res.t1 = pl.code AND res.t2 = pl.code;

SELECT *
FROM res
LEFT JOIN pl ON res.t1 = pl.code AND res.t2 = pl.code;

CREATE TABLE test1 
(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	code INT,
	PRIMARY KEY (id)
) COMMENT 'тестовая ООП',
ENGINE=InnoDB;


CREATE TABLE results 
(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	с1 VARCHAR(50) NOT NULL DEFAULT '',
	с2 VARCHAR(50) NOT NULL DEFAULT '',
	result INT DEFAULT NULL,
	tour INT NOT NULL,
	date DATE NOT NULL,
	PRIMARY KEY (id)
) COMMENT 'таблица результатов матчей',
ENGINE=InnoDB;

DROP TABLE IF EXISTS rt1;

CREATE TABLE rt1
(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	t1 VARCHAR(20) NOT NULL DEFAULT '',
	t2 VARCHAR(20) NOT NULL DEFAULT '',
	g1 INT DEFAULT NULL,
	g2 INT DEFAULT NULL,
	date DATE NOT NULL,
	PRIMARY KEY (id)
) COMMENT 'Таблица результатов матчей первого тура',
ENGINE=InnoDB;


DROP TABLE IF EXISTS results;
CREATE TABLE results
(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	t1 VARCHAR(20) NOT NULL DEFAULT '',
	t2 VARCHAR(20) NOT NULL DEFAULT '',
	g1 INT DEFAULT NULL,
	g2 INT DEFAULT NULL,
	tour INT NOT NULL,
	date DATE NOT NULL,
	PRIMARY KEY (id)
) COMMENT 'Таблица результатов матчей',
ENGINE=InnoDB;

SELECT	table_name, 
		table_comment,
		table_rows,
		ENGINE,
		table_collation
	FROM information_schema.tables
	WHERE table_schema = 'apl';
	
	DROP VIEW IF EXISTS tab_info;
CREATE VIEW currCourses AS
	SELECT DISTINCT course
		FROM lessons
		WHERE MONTH(lesson_date) = 9
		  AND YEAR(lesson_date) = 2006
		  
		  
DELIMITER |
CREATE PROCEDURE det ()
SELECT	table_name, 
		table_comment,
		table_rows,
		ENGINE,
		table_collation
	FROM information_schema.tables
	WHERE table_schema = 'apl';
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
	WHERE table_schema = 'apl'
	AND table_name = tb;
END; |
DELIMITER ;

DROP TABLE IF EXISTS pl;

CREATE TABLE pl
(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL DEFAULT 'comand',
	plays INT NOT NULL DEFAULT '0',
	wins INT NOT NULL DEFAULT '0',
	nich INT NOT NULL DEFAULT '0',
	lose INT NOT NULL DEFAULT '0',
	goals_out INT NOT NULL DEFAULT '0',
	goals_in INT NOT NULL DEFAULT '0',
	goals_res INT NOT NULL DEFAULT '0',
	points INT NOT NULL DEFAULT '0',
	PRIMARY KEY (id)
) COMMENT 'Итоговая турнирная таблица Английской премьер-лиги',
ENGINE=InnoDB;
		
				
				
CREATE TRIGGER `before_update_cost`
BEFORE UPDATE ON `trigger_items_cost` FOR EACH ROW
BEGIN
IF NEW.cost < 50 THEN
SET NEW.cost = 50;
ELSEIF NEW.cost > 50 AND NEW.cost < 100 THEN
SET NEW.cost = 100;
END IF;
END

CREATE TRIGGER after_update_rt1
AFTER UPDATE ON rt1 FOR EACH ROW
BEGIN
IF NEW.g1 > NEW.g2 THEN
	 pl1(name)
END

ALTER TABLE results ADD INDEX tur (tour);		

EXPLAIN SELECT * FROM results WHERE tour = 1;
SELECT * FROM results WHERE tour = 1;
				
CREATE TABLE result_s SELECT * FROM results;

UPDATE results
	SET tour = 9
	WHERE id > 80
		AND id < 91;
		
UPDATE results
	SET	g1 = NULL,
		g2 = NULL
	WHERE id = 82
		OR id = 84;
		
UPDATE results 
SET g1 = NULL, g2 = NULL
WHERE g1 IS NOT NULL
OR g2 IS NOT NULL;	
	
UPDATE results_temp
SET g1 = NULL, g2 = NULL
WHERE g1 IS NOT NULL
OR g2 IS NOT NULL;
		
SELECT * FROM results
WHERE g1 IS NOT NULL
OR g2 IS NOT NULL;	
	
SELECT * FROM results_temp
WHERE g1 IS NOT NULL
OR g2 IS NOT NULL;

UPDATE apl
SET plays = 0,
	wins = 0,
	nich = 0,
	lose = 0,
	goals_out = 0,
	goals_in = 0,
	goals_res = 0,
	points = 0;
	
UPDATE apl_temp
SET plays = 0,
	wins = 0,
	nich = 0,
	lose = 0,
	goals_out = 0,
	goals_in = 0,
	goals_res = 0,
	points = 0;
	
SELECT * FROM apl ORDER BY points DESC;

UPDATE results
	SET t1 = 'Мидлсбро'
	WHERE t1 = 'Миддлсбро';
	
UPDATE results
	SET t2 = 'Мидлсбро'
	WHERE t2 = 'Миддлсбро';