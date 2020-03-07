import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    clave = None
    cont = 0
    for line in sys.stdin:

        key, value = line.split("\t")
        value = int(value)

        if key == clave:
   
            cont += value
        else:

            if clave is not None:
                sys.stdout.write("{}\t{}\n".format(clave, cont))

            clave = key
            cont = value
    sys.stdout.write("{}\t{}\n".format(clave, cont))
