import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    for line in sys.stdin:
        key, val = line.split("\t")
        sys.stdout.write("{},{}\n".format(val[:-1],key))
