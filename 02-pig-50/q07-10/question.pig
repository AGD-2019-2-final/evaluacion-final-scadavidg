-- Pregunta
-- ===========================================================================
--
-- Para el archivo `datos.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la
-- columna 3 separados por coma. La tabla debe estar ordenada por las
-- columnas 1, 2 y 3.
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -rm *.tsv --ejecutar para bajar el ultimo archivo cargado al hadoop
fs -put data.tsv
datos = LOAD 'data.tsv' USING PigStorage('\t')  AS (letter:CHARARRAY,  letter_list:BAG{t: tuple(a:CHARARRAY)}, list:MAP[]);

res = FOREACH datos GENERATE letter, SIZE(letter_list) AS countlist, SIZE(list) AS countKeys;

res = ORDER res BY letter,countlist,countKeys;

STORE res INTO 'output' using PigStorage(',');
fs -get output/.