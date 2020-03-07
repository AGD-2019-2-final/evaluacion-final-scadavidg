--
-- Pregunta
-- ===========================================================================
--
-- Para responder la pregunta use el archivo `datos.csv`.
--
-- Escriba el código equivalente a la siguiente consulta SQL.
--
--    SELECT
--        birthday,
--        DATE_FORMAT(birthday, "yyyy"),
--        DATE_FORMAT(birthday, "yy"),
--    FROM
--        persons
--    LIMIT
--        5;
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -rm *.csv --ejecutar para bajar el ultimo archivo cargado al hadoop
fs -put data.csv
datos = LOAD 'data.csv' USING PigStorage(',')
    AS (id:int, firstname:CHARARRAY, surname:CHARARRAY,
        birthday:CHARARRAY, color:CHARARRAY, quantity:INT);
fechas = FOREACH datos GENERATE ToDate(birthday,'yyyy-MM-dd') AS date;
fechas = FOREACH fechas GENERATE ToString(date,'yyyy'),ToString(date,'yy');
STORE fechas INTO 'output' USING PigStorage(',');
fs -get output/.
