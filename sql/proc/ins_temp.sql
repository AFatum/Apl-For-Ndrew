/* Редактирование данных во временной турнирной таблице - apl_temp */
DROP PROCEDURE IF EXISTS ins_temp;
DELIMITER |
CREATE PROCEDURE ins_temp (IN idm INT)
BEGIN
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