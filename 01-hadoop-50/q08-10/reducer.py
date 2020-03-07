import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':
    sumatoria = 0
    cont = 0
    clave = None
    

    for line in sys.stdin:
        key, val = line.split("\t")
        val = float(val)


        if key == clave:

            sumatoria += val
            cont += 1
        else:
            if clave is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(clave, sumatoria, sumatoria/cont))

            clave = key
            sumatoria = val
            cont = 1
    sys.stdout.write("{}\t{}\t{}\n".format(clave, sumatoria, sumatoria/cont))
