/* Внесение новых результатов*/
DROP PROCEDURE IF EXISTS upd_res_new;
DELIMITER |
CREATE PROCEDURE upd_res_new (IN rg1 INT, IN rg2 INT, IN idm INT)
BEGIN
	 UPDATE results
                SET g1 = rg1,
                        g2 = rg2,
                        status = 1
                WHERE id = idm;

                /*IF (rg1 > rg2) THEN*/
                IF EXISTS (SELECT * FROM results WHERE g1 > g2 AND id = idm) THEN
                        UPDATE apl
                        SET apl.wins = apl.wins + 1,
                                apl.points = apl.points + 3,
                                apl.plays = apl.plays + 1,
                                apl.goals_out = apl.goals_out + rg1,
                                apl.goals_in = apl.goals_in + rg2,
								apl.goals_res = apl.goals_out - apl.goals_in
                        WHERE apl.name = ANY (SELECT t1 FROM results WHERE id = idm);
                        UPDATE apl
                        SET apl.lose = apl.lose + 1,
                                apl.plays = apl.plays + 1,
                                apl.goals_out = apl.goals_out + rg2,
                                apl.goals_in = apl.goals_in + rg1,
								apl.goals_res = apl.goals_out - apl.goals_in
                        WHERE apl.name = ANY (SELECT t2 FROM results WHERE id = idm);
                END IF;

                /*IF (rg1 < rg2) THEN*/
                IF EXISTS (SELECT * FROM results WHERE g1 < g2 AND id = idm) THEN
                        UPDATE apl
                        SET apl.wins = apl.wins + 1,
                                apl.points = apl.points + 3,
                                apl.plays = apl.plays + 1,
                                apl.goals_out = apl.goals_out + rg2,
                                apl.goals_in = apl.goals_in + rg1,
								apl.goals_res = apl.goals_out - apl.goals_in
                        WHERE apl.name = ANY (SELECT t2 FROM results WHERE id = idm);
                        UPDATE apl
                        SET apl.lose = apl.lose + 1,
                                apl.plays = apl.plays + 1,
                                apl.goals_out = apl.goals_out + rg1,
                                apl.goals_in = apl.goals_in + rg2,
								apl.goals_res = apl.goals_out - apl.goals_in
                        WHERE apl.name = ANY (SELECT t1 FROM results WHERE id = idm);
                END IF;

                /*IF (rg1 = rg2) THEN*/
                IF EXISTS (SELECT * FROM results WHERE g1 = g2 AND id = idm) THEN

                        UPDATE apl
                        SET apl.goals_out = apl.goals_out + rg1,
                                apl.goals_in = apl.goals_in + rg2
                        WHERE apl.name = ANY (SELECT t1 FROM results WHERE id = idm);

                        UPDATE apl
                        SET apl.goals_out = apl.goals_out + rg2,
                                apl.goals_in = apl.goals_in + rg1
                        WHERE apl.name = ANY (SELECT t2 FROM results WHERE id = idm);
						
                        UPDATE apl
                        SET apl.nich = apl.nich + 1,
                                apl.points = apl.points + 1,
                                apl.plays = apl.plays + 1,
								apl.goals_res = apl.goals_out - apl.goals_in
                        WHERE apl.name = ANY (SELECT t1 FROM results WHERE id = idm)
                        OR apl.name = ANY (SELECT t2 FROM results WHERE id = idm);
                END IF;
END |
DELIMITER ;