use strict;

#get user input
print "Enter the upper bound: ";
my $n = <STDIN>;

#initialize array to hold the largest
#used sorted tuples to store values
my @largest = ([1, 0]);

#function for getting the sequence length
#iterative version
sub collatz
{
    my $n = $_[0];
    my $len = 0;
    while($n != 1)
    {
        if($n % 2 == 0)
        {
            $n /= 2;
        }
        else
        {
            $n = (3*$n) + 1;
        }
        $len += 1;
    }
    return $len;
}

#special comparators for sorting tuples
sub c1
{
    return (($a->[1] <=> $b->[1]) or ($b->[0] <=> $a->[0]));
}

sub c2
{
    return (($b->[1] <=> $a->[1]) or ($a->[0] <=> $b->[0]));
}

#main loop
for(my $i=1; $i <= $n; $i++)
{
    #get the current sequence length
    my $l = collatz($i);

    #get the least significant sequence length of stored values
    #if current is more significant
    if($l > $largest[0][1])
    {
        if(scalar @largest >= 10)
        {
            #replace if array is holding ten elements
            shift(@largest);
        }
        #otherwise add to end
        push(@largest, [$i, $l]);

        #sort by value descending, then by sequence length ascending
        @largest = sort c1 @largest;
        #result is the least significant element at index 0
    }
}

#sort by value ascending, then by sequence length descending
@largest = sort c2 @largest;

#print the stored values
for(my $i=0; $i < scalar @largest; $i++)
{
    my $a = $largest[$i][0];
    my $b = $largest[$i][1];
    print "$a $b\n";
}
