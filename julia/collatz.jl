function collatz(n)
    len = 0
    while n != 1
        if n % 2 == 0
            n /= 2
        else
            n = (3*n) + 1
        end
        len += 1
    end
    return len
end

print("Enter the upper bound: ")
n = parse(Int64, readline())
largest = Tuple{Int64,Int64}[]
push!(largest, (1, 0))

for i = 1:n
    l = collatz(i)
    temp = largest[1]

    if l > temp[2]
        if length(largest) >= 10
            deleteat!(largest, findfirst(isequal(temp), largest))
        end
        push!(largest, (i, l))
        sort!(largest)
        sort!(largest, lt = (x, y) -> (x[2] < y[2]))
    end
end

sort!(largest)
sort!(largest, lt = (x, y) -> (x[2] > y[2]))
for i = 1:length(largest)
    println(largest[i][1], " ", largest[i][2])
end
