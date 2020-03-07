import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':
    maximo = 0
    minimo = 0
    clave = None

    for line in sys.stdin:
        key, value = line.split("\t")
        value = float(value)

        if key == clave:
            if(value > maximo):
                maximo = value

            if(value < minimo):
                minimo = value
        else:
            if clave is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(clave, maximo, minimo))

            clave = key
            minimo = value
            maximo = value
    sys.stdout.write("{}\t{}\t{}\n".format(clave, maximo, minimo))
