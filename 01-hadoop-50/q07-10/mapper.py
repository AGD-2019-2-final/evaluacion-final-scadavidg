import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    
    for line in sys.stdin:


        word = line.split("   ")[0]
        value = int(line.split("   ")[2])
        value = "{:03.0f}".format(value)
        sys.stdout.write("{},{},{}".format(word,value,line))
