n = int(input("Enter the upper bound: "))

largest = [(1, 1)]

def collatz(num):
    if(num == 1):
        return 0
    else:
        if(num % 2 == 0):
            return collatz(num/2) + 1
        else:
            return collatz(3*num + 1) + 1

for i in range(1, n+1):
    length = collatz(i)
    temp = largest[-1]

    if(length > temp[1]):
        if(len(largest) >= 10):
            largest.remove(temp)
        largest.append((i, length))
        largest.sort(key=lambda l:l[0])
        largest.sort(key=lambda l:l[1], reverse = True)

for i in range(len(largest)):
    print(largest[i][0], largest[i][1])
