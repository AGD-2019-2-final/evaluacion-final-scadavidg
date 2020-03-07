-- Pregunta
-- ===========================================================================
--
-- Para responder la pregunta use el archivo `datos.csv`.
--
-- Genere una relación con el apellido y su longitud. Ordene por longitud y
-- por apellido. Obtenga la siguiente salida.
--
--   Hamilton,8
--   Garrett,7
--   Holcomb,7
--   Coffey,6
--   Conway,6
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -rm *.csv --ejecutar para bajar el ultimo archivo cargado al hadoop
fs -put data.csv
datos = LOAD 'data.csv' USING PigStorage(',') AS (id:int, firstname:CHARARRAY,
        surname:CHARARRAY, birthday:CHARARRAY, color:CHARARRAY, quantity:INT);

longitudes = FOREACH datos GENERATE surname, SIZE(surname) AS len ;

ordenamiento = ORDER longitudes BY len DESC, surname;

res = LIMIT ordenamiento 5;

STORE res INTO 'output' using PigStorage(',');
fs -get output/.
