--
-- Pregunta
-- ===========================================================================
--
-- Para el archivo `datos.tsv` Calcule la cantidad de registros por clave de la
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave
-- `aaa`?
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

list = FOREACH datos GENERATE list;

keyvalues = FOREACH list GENERATE FLATTEN(list) AS keyvalues;

groups = GROUP keyvalues BY keyvalues;

keycount = FOREACH groups GENERATE group, COUNT(keyvalues);

STORE keycount INTO 'output' using PigStorage(',');
fs -get output/.
