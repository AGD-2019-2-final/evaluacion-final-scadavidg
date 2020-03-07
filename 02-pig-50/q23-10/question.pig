--
-- Pregunta
-- ===========================================================================
--
-- Para responder la pregunta use el archivo `datos.csv`.
--
-- Escriba el código equivalente a la siguiente consulta SQL.
--
--    SELECT
--        firstname,
--        color
--    FROM
--        u
--    WHERE
--        color REGEXP '[aeiou]$';
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
    AS (id:int, firstname:CHARARRAY,surname:CHARARRAY,
        birthday:CHARARRAY, color:CHARARRAY,quantity:INT);

ordenamiento = FILTER datos BY color MATCHES '.*[aeiou]' ;

res =  FOREACH ordenamiento GENERATE firstname, color;

STORE res INTO 'output' using PigStorage(',');
fs -get output/.
