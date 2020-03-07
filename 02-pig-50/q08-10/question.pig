-- Pregunta
-- ===========================================================================
--
-- Para el archivo `datos.tsv` compute la cantidad de registros por letra de la
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la
-- columna 3 es:
--
--   ((b,jjj), 216)
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -rm *.tsv --ejecutar para bajar el ultimo archivo cargado al hadoop
fs -put data.tsv
datos = LOAD 'data.tsv' USING PigStorage('\t') AS (letter:CHARARRAY, letter_list:BAG{t: tuple(a:CHARARRAY)}, list:MAP[]);

res = FOREACH datos GENERATE FLATTEN(letter_list) AS letter_list, FLATTEN(list) AS keylist;

ordenamiento = GROUP res BY (letter_list,keylist);

res = FOREACH ordenamiento GENERATE group, COUNT(res);

STORE res INTO 'output' using PigStorage('\t');
fs -get output/.