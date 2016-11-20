/* Редактирование старых результатов*/
DROP PROCEDURE IF EXISTS upd_res_old;
DELIMITER |
CREATE PROCEDURE upd_res_old (IN rg1 INT, IN rg2 INT, IN idm INT)
BEGIN
	IF (rg1 > rg2) THEN
	/*IF EXISTS (SELECT * FROM results WHERE g1 > g2 AND id = idm) THEN*/

                IF EXISTS(SELECT * FROM results WHERE g1 > g2 AND id = idm) THEN
                        CALL goals_upd(rg1, rg2, idm);
                END IF;


                IF EXISTS(SELECT * FROM results WHERE g1 < g2 AND id = idm) THEN
                        CALL goals_upd(rg1, rg2, idm);

                        UPDATE apl
                        SET apl.points = apl.points + 3,
                                apl.wins = apl.wins + 1,
                                apl.lose = apl.lose - 1
                        WHERE apl.name = ANY(SELECT t1 FROM results WHERE id = idm);

                        UPDATE apl
                        SET apl.points = apl.points - 3,
                                apl.wins = apl.wins - 1,
                                apl.lose = apl.lose + 1
                        WHERE apl.name = ANY(SELECT t2 FROM results WHERE id = idm);
                END IF;


                IF EXISTS(SELECT * FROM results WHERE g1 = g2 AND id = idm) THEN
                        CALL goals_upd(rg1, rg2, idm);

                        UPDATE apl
                        SET 	apl.points = apl.points + 2,
                                apl.wins = apl.wins + 1,
								apl.nich = apl.nich - 1
                        WHERE apl.name = ANY(SELECT t1 FROM results WHERE id = idm);

                        UPDATE apl
                        SET 	apl.points = apl.points - 1,
                                apl.lose = apl.lose + 1,
								apl.nich = apl.nich - 1
                        WHERE apl.name = ANY(SELECT t2 FROM results WHERE id = idm);
                END IF;
        END IF;



        IF (rg1 < rg2) THEN
        /*IF EXISTS (SELECT * FROM results WHERE g1 < g2 AND id = idm) THEN*/

                IF EXISTS(SELECT * FROM results WHERE g1 < g2 AND id = idm) THEN
                        CALL goals_upd(rg1, rg2, idm);
                END IF;


                IF EXISTS(SELECT * FROM results WHERE g1 > g2 AND id = idm) THEN
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


                IF EXISTS(SELECT * FROM results WHERE g1 = g2 AND id = idm) THEN
                        CALL goals_upd(rg1, rg2, idm);

                        UPDATE apl
                        SET 	apl.points = apl.points + 2,
                                apl.wins = apl.wins + 1,
                                apl.nich = apl.nich - 1
                        WHERE apl.name = ANY(SELECT t2 FROM results WHERE id = idm);

                        UPDATE apl
                        SET 	apl.points = apl.points - 1,
                                apl.lose = apl.lose + 1,
                                apl.nich = apl.nich - 1
                        WHERE apl.name = ANY(SELECT t1 FROM results WHERE id = idm);
                END IF;
        END IF;

        IF (rg1 = rg2) THEN
        /*IF EXISTS (SELECT * FROM results WHERE g1 = g2 AND id = idm) THEN*/

                IF EXISTS(SELECT * FROM results WHERE g1 = g2 AND id = idm) THEN
                        CALL goals_upd(rg1, rg2, idm);
                END IF;


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