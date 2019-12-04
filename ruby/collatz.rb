print "Enter the upper bound: "
n = STDIN.gets.chomp.to_i
largest = [[1, 0]]

def collatz(n)
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

for i in 1..n do
    l = collatz(i)
    temp = largest[0][1]
    if l > temp
        if largest.length >= 10
            largest.shift
        end
        e = [i, l]
        largest.push(e)
        largest = largest.sort { |a, b| [a[1], a[0]] <=> [b[1], b[0]] }
    end
end

largest = largest.sort { |a, b| [b[1], a[0]] <=> [a[1], b[0]] }
for e in largest do
    puts "#{e[0]} #{e[1]}"
end
