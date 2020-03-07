-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -rm *.tsv
fs -put data.tsv
datos = LOAD 'data.tsv' USING PigStorage('\t') AS (letter:CHARARRAY, date:CHARARRAY,amount:INT);

agrupamiento = ORDER datos BY amount;

N5 = LIMIT agrupamiento 5;

N5amount = FOREACH N5 GENERATE amount;

STORE N5amount INTO 'output' using PigStorage('\t');
fs -get output/.