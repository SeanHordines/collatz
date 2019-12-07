#get user input
print "Enter the upper bound: "
n = STDIN.gets.chomp.to_i

#initialize array to hold the largest
#used sorted tuples to store values
largest = [[1, 0]]

#function for getting the sequence length
#recursive version
def collatz(n)
    if(n == 1)
        return 0
    else
        if(n % 2 == 0)
            return collatz(n/2) + 1
        else
            return collatz(3*n + 1) + 1
        end
    end
end

#main loop
for i in 1..n do
    #get the current sequence length
    l = collatz(i)
    #get the least significant sequence length of stored values
    temp = largest[0][1]

    #if current is more significant
    if l > temp
        if largest.length >= 10
            #replace if array is holding ten elements
            largest.shift
        end
        #otherwise add to end
        e = [i, l]
        largest.push(e)

        #sort by value descending, then by sequence length ascending
        largest = largest.sort { |a, b| [a[1], a[0]] <=> [b[1], b[0]] }
        #result is the least significant element at index 0
    end
end

#sort by value ascending, then by sequence length descending
largest = largest.sort { |a, b| [b[1], a[0]] <=> [a[1], b[0]] }

#print the stored values
for e in largest do
    puts "#{e[0]} #{e[1]}"
end
