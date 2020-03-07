-- Pregunta
-- ===========================================================================
-- 
-- Ordene el archivo `datos.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba el codigo del mapper a partir de este punto <<<
-- 
fs -rm *.tsv
fs -put data.tsv

datos = LOAD 'data.tsv' USING PigStorage('\t') AS (letter:CHARARRAY,date:CHARARRAY, amount:INT);

agrupamiento = ORDER datos BY letter,amount;

STORE agrupamiento INTO 'output' using PigStorage('\t');

fs -get output/.
