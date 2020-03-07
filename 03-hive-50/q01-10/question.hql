-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `datos.tsv`.
--
-- Compute la cantidad de registros por cada letra de la columna 1.
-- Escriba el resultado ordenado por letra. 
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

DROP TABLE IF EXISTS datos;
DROP TABLE IF EXISTS res;

CREATE TABLE datos ( word STRING,
                    cdate DATE,
                    amount INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE datos;

CREATE TABLE res AS SELECT word, count(*) regs
                    FROM datos
                    GROUP BY word;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
SELECT * FROM res;

