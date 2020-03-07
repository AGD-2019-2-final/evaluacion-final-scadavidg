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
--        LOCATE('ia', firstname)
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
    AS (id:int, firstname:CHARARRAY, surname:CHARARRAY,
        birthday:CHARARRAY,color:CHARARRAY,quantity:INT);

res = FOREACH datos GENERATE INDEXOF(firstname,'ia',0);

STORE res INTO 'output';
fs -get output/.
