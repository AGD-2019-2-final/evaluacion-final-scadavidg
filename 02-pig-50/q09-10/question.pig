-- Pregunta
-- ===========================================================================
--
-- Para el archivo `datos.csv` escriba una consulta en Pig que genere la
-- siguiente salida:
--
--   Vivian@Hamilton
--   Karen@Holcomb
--   Cody@Garrett
--   Roth@Fry
--   Zoe@Conway
--   Gretchen@Kinney
--   Driscoll@Klein
--   Karyn@Diaz
--   Merritt@Guy
--   Kylan@Sexton
--   Jordan@Estes
--   Hope@Coffey
--   Vivian@Crane
--   Clio@Noel
--   Hope@Silva
--   Ayanna@Jarvis
--   Chanda@Boyer
--   Chadwick@Knight
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -rm *.csv --ejecutar para bajar el ultimo archivo cargado al hadoop
fs -put data.csv
datos = LOAD 'data.csv' using PigStorage(',') AS (id:INT, firstname:CHARARRAY, lastname:CHARARRAY, date:CHARARRAY, color:CHARARRAY,        amount:INT);

res = FOREACH datos GENERATE CONCAT (firstname, '@', lastname);

STORE res INTO 'output';
fs -get output/.
