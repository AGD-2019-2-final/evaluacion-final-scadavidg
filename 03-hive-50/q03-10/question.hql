-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `datos.tsv`.
--
-- Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
-- de la tercera columna.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
DROP TABLE IF EXISTS data;
DROP TABLE IF EXISTS res;

CREATE TABLE data ( word STRING,
                    datec DATE,
                    amount INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE data;

CREATE TABLE res AS SELECT amount
                    FROM data
                    GROUP BY amount
                    ORDER BY amount
                    LIMIT 5;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
SELECT * FROM res;