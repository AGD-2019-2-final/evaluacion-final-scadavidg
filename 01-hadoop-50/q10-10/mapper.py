import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":


    for line in sys.stdin:

        value = int(line.split("	")[0])
        value = "{:03.0f}".format(value)
        words = (line.split("	")[1].rstrip("\r\n")).split(",")
        for letter in words:
            sys.stdout.write("{}\t{}\n".format(letter,value))
        