import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        word = line.split(",")[3]
        value = line.split(",")[4]
        sys.stdout.write("{}\t{}\n".format(word,value))
