#function for getting the sequence length
#recursive version
function collatz(n)
    if n == 1
        return 0
    else
        if n % 2 == 0
            return collatz(n/2) + 1
        else
            return collatz(3*n + 1) + 1
        end
    end
end

#get user input
print("Enter the upper bound: ")
n = parse(Int64, readline())

#initialize array to hold the largest
#used sorted tuples to store values
largest = Tuple{Int64,Int64}[]
push!(largest, (1, 0))

#main loop
for i = 1:n
    #get the current sequence length
    l = collatz(i)
    #get the least significant sequence length of stored values
    temp = largest[1]

    #if current is more significant
    if l > temp[2]
        if length(largest) >= 10
            #replace if array is holding ten elements
            deleteat!(largest, 1)
        end
        #otherwise add to end
        push!(largest, (i, l))

        #sort by value descending, then by sequence length ascending
        sort!(largest)
        sort!(largest, lt = (x, y) -> (x[2] < y[2]))
        #result is the least significant element at index 0
    end
end

#sort by value ascending, then by sequence length descending
sort!(largest)
sort!(largest, lt = (x, y) -> (x[2] > y[2]))

#print the stored values
for i = 1:length(largest)
    println(largest[i][1], " ", largest[i][2])
end
