using System;
using System.Collections.Generic;

public class collatz
{
    public static void Main(String[] args)
    {
        //get user input
        Console.Write("Enter the upper bound: ");
        long max = Int64.Parse(Console.ReadLine());

        //initialize array to hold the largest
        List<Tuple<long, int>> largest = new List<Tuple<long, int>>();
        largest.Add((1L, 0).ToTuple());

        //main loop
        for(long i = 1L; i <= max; i++)
        {
            //get the current sequence length
            int length = getSeqLen(i);
            //get the least significant sequence length of stored values
            Tuple<long, int> temp = largest[0];

            //if current is more significant
            if(length > temp.Item2)
            {
                if(largest.Count >= 10)
                {
                    //replace if array is holding ten elements
                    largest.RemoveAt(0);
                }
                //otherwise add to end
                largest.Add((i, length).ToTuple());

                //sort by value descending, then by sequence length ascending
                largest.Sort((x, y) => x.Item1.CompareTo(y.Item1));
                largest.Sort((x, y) => y.Item2.CompareTo(x.Item2));
                largest.Reverse();
                //result is the least significant element at index 0
            }
        }

        //sort by value ascending, then by sequence length descending
        largest.Reverse();

        //print the stored values
        foreach(Tuple<long, int> curr in largest)
        {
            Console.Write("{0} {1}\n", curr.Item1, curr.Item2);
        }
    }

    //function for getting the sequence length
    //iterative version
    public static int getSeqLen(long n)
    {
        int l = 0;
        while(n != 1)
        {
            if(n % 2 == 0)
            {
                n /= 2;
            }
            else
            {
                n = (3*n) + 1;
            }
            l += 1;
        }
        return l;
    }
}
