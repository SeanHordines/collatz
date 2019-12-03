use strict;

print "Enter the upper bound: ";
my $n = <STDIN>;
my @largest = ([1, 0]);

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
