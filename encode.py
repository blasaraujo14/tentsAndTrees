import sys

f1 = open(sys.argv[1])
f2 = open(sys.argv[2], "w")

x = f1.readlines()
n = len(x[0]) - 1

print (x)

for i in range(n):
    for j in range(n):
        if x[i][j]== 't':
            print ("-> " + str(i) + str(j))
