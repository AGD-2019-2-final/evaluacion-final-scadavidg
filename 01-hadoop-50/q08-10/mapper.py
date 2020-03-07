import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

    for line in sys.stdin:
        
        word = line.split("   ")[0]
        value = line.split("   ")[2]
        sys.stdout.write("{}\t{}".format(word,value))

