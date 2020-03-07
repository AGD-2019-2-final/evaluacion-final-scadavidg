import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

    for line in sys.stdin:

        word = (line.split("   ")[1]).split("-")[1]
        sys.stdout.write("{}\t1\n".format(word))
