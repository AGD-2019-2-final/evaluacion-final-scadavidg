--
-- Pregunta
-- ===========================================================================
--
-- Para responder la pregunta use el archivo `datos.csv`.
--
-- Obtenga los apellidos que empiecen por las letras entre la 'd' y la 'k'. La
-- salida esperada es la siguiente:
--
--   (Hamilton)
--   (Holcomb)
--   (Garrett)
--   (Fry)
--   (Kinney)
--   (Klein)
--   (Diaz)
--   (Guy)
--   (Estes)
--   (Jarvis)
--   (Knight)
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
 surname:CHARARRAY, birthday:CHARARRAY,  color:CHARARRAY, quantity:INT);

ordenamiento = FILTER datos BY SUBSTRING(surname,0,1) >= 'D' AND SUBSTRING(surname,0,1) <= 'K';

res =  FOREACH ordenamiento GENERATE surname;

STORE res INTO 'output';

fs -get output/.
