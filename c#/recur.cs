using System;
using System.Collections.Generic;

public class collatz
{
    public static void Main(String[] args)
    {
        Console.Write("Enter the upper bound: ");
        long max = Int64.Parse(Console.ReadLine());
        List<Tuple<long, int>> largest = new List<Tuple<long, int>>();
        largest.Add((1L, 0).ToTuple());


        for(long i = 1L; i <= max; i++)
        {
            //Console.Write("{0} {1}\n", i, getSeqLen(i));
            int length = getSeqLen(i);
            Tuple<long, int> temp = largest[0];

            if(length > temp.Item2)
            {
                if(largest.Count >= 10)
                {
                    largest.RemoveAt(0);
                }
                largest.Add((i, length).ToTuple());
                largest.Sort((x, y) => x.Item1.CompareTo(y.Item1));
                largest.Sort((x, y) => y.Item2.CompareTo(x.Item2));
                largest.Reverse();
            }
        }

        largest.Reverse();
        foreach(Tuple<long, int> curr in largest)
        {
            Console.Write("{0} {1}\n", curr.Item1, curr.Item2);
        }
    }

    public static int getSeqLen(long n)
    {
        if(n == 1)
        {
            return 0;
        }
        else
        {
            if(n % 2 == 0)
            {
                return getSeqLen(n/2) + 1;
            }
            else
            {
                return getSeqLen(3*n + 1) + 1;
            }
        }
    }
}
