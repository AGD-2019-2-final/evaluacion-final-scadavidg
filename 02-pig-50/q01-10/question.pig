-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `datos.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -put data.tsv
datos = LOAD 'data.tsv' USING PigStorage('\t') AS (letter:CHARARRAY, date:CHARARRAY,amount:INT);

agrupamiento = GROUP datos BY letter;

words = FOREACH agrupamiento GENERATE group, COUNT(datos);

STORE words INTO 'output' using PigStorage('\t');

fs -get output/.
