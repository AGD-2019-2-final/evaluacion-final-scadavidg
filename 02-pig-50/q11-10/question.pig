-- Pregunta
-- ===========================================================================
--
-- Para responder la pregunta use el archivo `datos.csv`.
--
-- Escriba el código que genere la siguiente salida.
--
--    Boyer,BOYER,boyer
--    Coffey,COFFEY,coffey
--    Conway,CONWAY,conway
--    Crane,CRANE,crane
--    Diaz,DIAZ,diaz
--    Estes,ESTES,estes
--    Fry,FRY,fry
--    Garrett,GARRETT,garrett
--    Guy,GUY,guy
--    Hamilton,HAMILTON,hamilton
--    Holcomb,HOLCOMB,holcomb
--    Jarvis,JARVIS,jarvis
--    Kinney,KINNEY,kinney
--    Klein,KLEIN,klein
--    Knight,KNIGHT,knight
--    Noel,NOEL,noel
--    Sexton,SEXTON,sexton
--    Silva,SILVA,silva
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -rm *.csv --ejecutar para bajar el ultimo archivo cargado al hadoop
fs -put data.csv
datos = LOAD 'data.csv' USING PigStorage(',')
    AS (id:int,firstname:CHARARRAY,surname:CHARARRAY,
        birthday:CHARARRAY,color:CHARARRAY,quantity:INT);


res = FOREACH datos GENERATE surname, UPPER(surname) AS up, LOWER(surname) AS low;

ordenamiento = ORDER res BY surname;

STORE ordenamiento INTO 'output' using PigStorage(',');
fs -get output/.
