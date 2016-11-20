/* Внесение и возврат данных в/из таблицы временных результатов - results_temp */
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