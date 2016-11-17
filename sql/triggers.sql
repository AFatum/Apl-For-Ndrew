CREATE TRIGGER `after_insert_cart_items`
AFTER INSERT ON `trigger_cart_items` FOR EACH ROW
BEGIN
INSERT INTO trigger_cart_log (cart_id, item_id)
VALUES (NEW.cart_id, NEW.item_id);
END

DROP TRIGGER IF EXISTS after_update_results;

CREATE TRIGGER `before_update_cost`
BEFORE UPDATE ON `trigger_items_cost` FOR EACH ROW
BEGIN
IF NEW.cost < 50 THEN
SET NEW.cost = 50;
ELSEIF NEW.cost > 50 AND NEW.cost < 100 THEN
SET NEW.cost = 100;
END IF;
END

SHOW TRIGGERS \G

DROP TRIGGER IF EXISTS after_update_results;

DELIMITER |
CREATE TRIGGER `after_update_results`
AFTER UPDATE ON results FOR EACH ROW
BEGIN
	UPDATE apl
		SET plays = plays + 1
		WHERE results.t1 = apl.name
		OR results.t2 = apl.name;
END |
DELIMITER ;



DELIMITER |
CREATE TRIGGER after_update_results
AFTER UPDATE ON results FOR EACH ROW
BEGIN
	UPDATE apl
		SET plays = plays + 1
		WHERE NEW.results.t1 = apl.name
		OR NEW.results.t2 = apl.name;
		
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

DELIMITER |
CREATE TRIGGER after_update_results
AFTER UPDATE ON results FOR EACH ROW
BEGIN		
	UPDATE apl
		SET apl.goals_out = apl.goals_out + NEW.g1,
			apl.goals_in = apl.goals_in + NEW.g2
		WHERE NEW.t1 = apl.name;	
		
	UPDATE apl
		SET apl.goals_out = apl.goals_out + NEW.g2,
			apl.goals_in = apl.goals_in + NEW.g1
		WHERE NEW.t2 = apl.name;
	
	IF NEW.g1 > NEW.g2 THEN
		UPDATE apl
			SET	wins = wins + 1,
				points = points + 3
			WHERE NEW.t1 = apl.name;
		UPDATE apl
			SET lose = lose + 1
			WHERE NEW.t2 = apl.name;
	END IF;
	
	IF NEW.g1 < NEW.g2 THEN
		UPDATE apl
			SET	wins = wins + 1,
				points = points + 3
			WHERE NEW.t2 = apl.name;
		UPDATE apl
			SET lose = lose + 1
			WHERE NEW.t1 = apl.name;
	END IF;
	
	IF NEW.g1 = NEW.g2 THEN
		UPDATE apl
			SET	nich = wins + 1,
				points = points + 1
			WHERE NEW.t1 = apl.name
				OR NEW.t2 = apl.name;
	END IF;
	
	UPDATE apl
		SET plays = plays + 1,
			goals_res = goals_out - goals_in
		WHERE NEW.t1 = apl.name
		OR NEW.t2 = apl.name;
END |
DELIMITER ;

DELIMITER |
CREATE TRIGGER after_ins_resTemp
AFTER INSERT ON results_temp FOR EACH ROW
BEGIN
	UPDATE apl_temp
		SET apl_temp.goals_out = apl_temp.goals_out + g1,
			apl_temp.goals_in = apl_temp.goals_in + g2
		WHERE t1 = apl_temp.name;	
		
	UPDATE apl_temp
		SET apl_temp.goals_out = apl_temp.goals_out + g2,
			apl_temp.goals_in = apl_temp.goals_in + g1
		WHERE t2 = apl_temp.name;
	
	IF Ng1 > g2 THEN
		UPDATE apl_temp
			SET	wins = wins + 1,
				points = points + 3
			WHERE t1 = apl_temp.name;
		UPDATE apl_temp
			SET lose = lose + 1
			WHERE t2 = apl_temp.name;
	END IF;
	
	IF Ng1 < g2 THEN
		UPDATE apl_temp
			SET	wins = wins + 1,
				points = points + 3
			WHERE t2 = apl_temp.name;
		UPDATE apl_temp
			SET lose = lose + 1
			WHERE t1 = apl_temp.name;
	END IF;
	
	IF g1 = g2 THEN
		UPDATE apl_temp
			SET	nich = wins + 1,
				points = points + 1
			WHERE t1 = apl_temp.name
				OR t2 = apl_temp.name;
	END IF;
	
	UPDATE apl_temp
		SET plays = plays + 1,
			goals_res = goals_out - goals_in
		WHERE t1 = apl_temp.name
		OR t2 = apl_temp.name;
END |
DELIMITER ;

DELIMITER |
CREATE TRIGGER before_ins_resTemp
BEFORE INSERT ON results_temp FOR EACH ROW
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
END |
DELIMITER ;

UPDATE results 
SET g1 = NULL, g2 = NULL
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
	
