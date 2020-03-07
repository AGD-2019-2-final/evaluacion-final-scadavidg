--
-- Pregunta
-- ===========================================================================
--
-- Para el archivo `datos.tsv` compute Calcule la cantidad de registros en que
-- aparece cada letra minúscula en la columna 2.
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

fs -rm *.csv --ejecutar para bajar el ultimo archivo cargado al hadoop
fs -put data.tsv
datos = LOAD 'data.tsv' USING PigStorage('\t')
    AS (letter:CHARARRAY,letter_list:BAG{t: tuple(a:CHARARRAY)},list:MAP[]);

letter_list = FOREACH datos GENERATE letter_list;

words = FOREACH letter_list GENERATE FLATTEN(letter_list) AS letter;

groups = GROUP words BY letter;

lettercount = FOREACH groups GENERATE group, COUNT(words);

STORE lettercount INTO 'output' using PigStorage('\t');
fs -get output/.