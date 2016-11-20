/* Аналог desc */
DROP PROCEDURE IF EXISTS des;
DELIMITER |
CREATE PROCEDURE des (IN tb CHARACTER (20))
BEGIN
	SELECT  column_name,
                data_type,
                column_default,
                is_nullable,
                column_key,
                extra,
                column_comment
        FROM information_schema.columns
        WHERE table_schema = 'pl'
        AND table_name = tb;
END |
DELIMITER ;