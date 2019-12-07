import java.io.*;
import java.util.*;

public class Collatz
{
    public static void main(String[] args)
    {
        //get user input
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter the upper limit: ");
        Long n = sc.nextLong();

        //initialize array to hold the largest
        //used sorted tuples to store values
        ArrayList<Long[]> largest = new ArrayList<Long[]>();
        largest.add(new Long[]{1l, 0l});

        //special comparators for sorting tuples
        Comparator c1 = new Comparator<Long[]>()
        {
            public int compare(Long[] a, Long[] b)
            {
                return a[0].compareTo(b[0]);
            }
        };
        Comparator c2 = new Comparator<Long[]>()
        {
            public int compare(Long[] a, Long[] b)
            {
                return a[1].compareTo(b[1]);
            }
        };

        //main loop
        for(Long i = 1l; i <= n; i++)
        {
            //get the current sequence length
            Long l = collatz(i);
            //get the least significant sequence length of stored values
            Long[] temp = largest.get(0);

            //if current is more significant
            if(l > temp[1])
            {
                if(largest.size() >= 10)
                {
                    //replace if array is holding ten elements
                    largest.remove(0);
                }
                //otherwise add to end
                largest.add(new Long[]{i, l});

                //sort by value descending, then by sequence length ascending
                Collections.sort(largest, c1);
                Collections.sort(largest, c2);
                //result is the least significant element at index 0
            }
        }

        //sort by value ascending, then by sequence length descending
        Collections.sort(largest, c1);
        Collections.reverse(largest);
        Collections.sort(largest, c2);
        Collections.reverse(largest);

        //print the stored values
        for(int i = 0; i < largest.size(); i++)
        {
            System.out.println(largest.get(i)[0] + " " + largest.get(i)[1]);
        }
    }

    //function for getting the sequence length
    //iterative version
    public static Long collatz(Long n)
    {
        Long len = 0l;
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
            len += 1;
        }
        return len;
    }
}
