/* Редактируем забитые/пропущенные */
DROP PROCEDURE IF EXISTS goals_upd;
DELIMITER |
CREATE PROCEDURE goals_upd (IN rg1 INT, IN rg2 INT, IN idm INT)
BEGIN
		UPDATE apl, (SELECT g1, g2, t1 FROM results WHERE id = idm) AS res
        SET apl.goals_out = apl.goals_out - res.g1,
			apl.goals_in = apl.goals_in - res.g2
        WHERE apl.name = res.t1;

        UPDATE apl, (SELECT g1, g2, t2 FROM results WHERE id = idm) AS res
        SET apl.goals_out = apl.goals_out - res.g2,
			apl.goals_in = apl.goals_in - res.g1
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

/*---- Проверка индексов ---- */
EXPLAIN SELECT g1, t1 FROM results WHERE id = 1;
EXPLAIN SELECT id, t1, t2, g1, g2, tour, date FROM results WHERE tour < 1 + 1;
EXPLAIN SELECT * FROM results WHERE g1 > g2 AND id < 100;
EXPLAIN SELECT * FROM results WHERE id < 100 AND status = 0;