/* Внесение результатов в БД*/
DROP PROCEDURE IF EXISTS upd;
DELIMITER |
CREATE PROCEDURE upd (IN rg1 INT, IN rg2 INT, IN idm INT)
BEGIN
	IF EXISTS(SELECT * FROM results WHERE id = idm AND status = 1) THEN
                CALL upd_res_old(rg1, rg2, idm);
        END IF;
		
	IF EXISTS(SELECT * FROM results WHERE id = idm AND status = 0) THEN
                CALL upd_res_new(rg1, rg2, idm);
        END IF;
END |
DELIMITER ;