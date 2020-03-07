import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    clave = None
    nS = ""    
    for line in sys.stdin:
        key, val = line.split("\t")
        val = str(int(val))

        if key == clave:
            nS = nS + "," + val
        else:
          
            if clave is not None:
                sys.stdout.write("{}\t{}\n".format(clave, nS))

            clave = key
            nS = val
    sys.stdout.write("{}\t{}\n".format(clave, nS))
