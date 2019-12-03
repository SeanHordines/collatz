print("Enter the upper bound: ")
n = parse(Int64, readline())
largest = Tuple{Int64,Int64}[]
push!(largest, (1, 0))

function collatz(n)
    len = 0
    while num != 1
        if num % 2 == 0
            num /= 2
        else
            num = (3*num) + 1
        end
        len += 1
    return len

for i = 1:n
    length = collatz(i)
    temp = minimum(largest)

    if length > temp[1]
        if length(largest) >= 10
            largest.remove(temp)
        push!(largest, (i, length))

print(largest)
