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
		WHERE results.t1 = apl.name
		OR results.t2 = apl.name;
		
	UPDATE apl
		SET apl.goals_out = apl.goals_out + NEW.results.g1,
			apl.goals_in = apl.goals_in + NEW.results.g2
		WHERE results.t1 = apl.name;	
		
	UPDATE apl
		SET apl.goals_out = apl.goals_out + NEW.results.g2,
			apl.goals_in = apl.goals_in + NEW.results.g2
		WHERE results.t2 = apl.name;
	
	IF NEW.results.g1 > NEW.results.g2 THEN
		UPDATE apl
			SET	wins = wins + 1,
				points = points + 3
			WHERE results.t1 = apl.name;
		UPDATE apl
			SET lose = lose + 1
			WHERE results.t2 = apl.name;
	END IF;
	
	IF NEW.results.g1 < NEW.results.g2 THEN
		UPDATE apl
			SET	wins = wins + 1,
				points = points + 3
			WHERE results.t2 = apl.name;
		UPDATE apl
			SET lose = lose + 1
			WHERE results.t1 = apl.name;
	END IF;
	
	IF NEW.results.g1 = NEW.results.g2 THEN
		UPDATE apl
			SET	nich = wins + 1,
				points = points + 1
			WHERE results.t1 = apl.name
				OR results.t2 = apl.name;
	END IF;
END |
DELIMITER ;

UPDATE results 
SET g1 = NULL, g2 = NULL
WHERE g1 IS NOT NULL
OR g2 IS NOT NULL;
