#get user input
n = int(input("Enter the upper bound: "))

#initialize array to hold the largest
#used sorted tuples to store values
largest = [(1, 0)]

#function for getting the sequence length
#iterative version
def collatz(num):
    len = 0
    while(num != 1):
        if(num % 2 == 0):
            num /= 2
        else:
            num = (3*num) + 1
        len += 1
    return len

#main loop
for i in range(1, n+1):
    #get the current sequence length
    length = collatz(i)
    #get the least significant sequence length of stored values
    temp = largest[-1]

    #if current is more significant
    if(length > temp[1]):
        if(len(largest) >= 10):
            #replace if array is holding ten elements
            largest.remove(temp)
        #otherwise add to end
        largest.append((i, length))

        #sort by value ascending, then by sequence length descending
        largest.sort(key=lambda l:l[0])
        largest.sort(key=lambda l:l[1], reverse = True)
        #result is the least significant element at the last index

#print the stored values
for i in range(len(largest)):
    print(largest[i][0], largest[i][1])
