import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':
    cont = 0
    for line in sys.stdin:
        _, val = line.split(",")
        sys.stdout.write("{}".format(val))
        cont += 1
        if(cont == 6):
            break
