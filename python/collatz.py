n = int(input("Enter the upper bound: "))

largest = [(1, 0)]

def collatz(num):
    len = 0
    while(num != 1):
        if(num % 2 == 0):
            num /= 2
        else:
            num = (3*num) + 1
        len += 1
    return len

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
