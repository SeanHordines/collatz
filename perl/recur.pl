use strict;

print "Enter the upper bound: ";
my $n = <STDIN>;
my @largest = ([1, 0]);

sub collatz
{
    my $n = $_[0];
    if($n == 1)
    {
        return 0;
    }
    else
    {
        if($n % 2 == 0)
        {
            return collatz($n/2) + 1;
        }
        else
        {
            return collatz(3*$n + 1) + 1;
        }
    }
}

sub c1
{
    return (($a->[1] <=> $b->[1]) or ($b->[0] <=> $a->[0]));
}

sub c2
{
    return (($b->[1] <=> $a->[1]) or ($a->[0] <=> $b->[0]));
}

for(my $i=1; $i <= $n; $i++)
{
    my $l = collatz($i);

    if($l > $largest[0][1])
    {
        if(scalar @largest >= 10)
        {
            shift(@largest);
        }
        push(@largest, [$i, $l]);
        @largest = sort c1 @largest;
    }
}

@largest = sort c2 @largest;
for(my $i=0; $i < scalar @largest; $i++)
{
    my $a = $largest[$i][0];
    my $b = $largest[$i][1];
    print "$a $b\n";
}
