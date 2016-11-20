/* Показываем таблицы */
DROP PROCEDURE IF EXISTS det;
DELIMITER |
CREATE PROCEDURE det ()
BEGIN
	SELECT  table_name,
                table_comment,
                table_rows,
                ENGINE,
                table_collation
        FROM information_schema.tables
        WHERE table_schema = 'pl';
END |
DELIMITER ;