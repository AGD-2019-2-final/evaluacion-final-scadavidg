import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    for line in sys.stdin:
        _, _, val = line.split(",")
        sys.stdout.write("{}".format(val))
