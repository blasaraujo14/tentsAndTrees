import sys

inputFile = open(sys.argv[1]).readlines()
outputFile = open(sys.argv[2], "w")

n = len(inputFile[0]) - 1
outputFile.write("dim("+str(n)+").\n")

for i in range(n):
	for j in range(n):
		if inputFile[i][j]== 't':
			outputFile.write("tree(" + str(i) + "," + str(j) + "). ")
outputFile.write("\n")
for i in range(n):
	outputFile.write("rowVal(" + str(i) + "," + inputFile[-2][i*2] + "). ")
outputFile.write("\n")
for i in range(n):
	outputFile.write("colVal(" + str(i) + "," + inputFile[-1][i*2] + "). ")
outputFile.close()
