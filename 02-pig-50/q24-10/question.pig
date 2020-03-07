--
-- Pregunta
-- ===========================================================================
--
-- Para responder la pregunta use el archivo `datos.csv`.
--
-- Escriba el código equivalente a la siguiente consulta SQL.
--
--    SELECT
--        REGEX_EXTRACT(birthday, '....-..-..', 2)
--    FROM
--        u;
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
    AS (id:int,firstname:CHARARRAY,surname:CHARARRAY,
        birthday:CHARARRAY,color:CHARARRAY,quantity:INT);

res = FOREACH datos GENERATE REGEX_EXTRACT(birthday, '(\\d{4})-(\\d{2})-(\\d{2})', 2);


STORE res INTO 'output' using PigStorage(',');
fs -get output/.
