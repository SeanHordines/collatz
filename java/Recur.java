import java.io.*;
import java.util.*;

public class Recur
{
    public static void main(String[] args)
    {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter the upper limit: ");
        Long n = sc.nextLong();

        ArrayList<Long[]> largest = new ArrayList<Long[]>();
        largest.add(new Long[]{1l, 0l});

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

        for(Long i = 1l; i <= n; i++)
        {
            Long l = collatz(i);
            Long[] temp = largest.get(0);

            if(l > temp[1])
            {
                if(largest.size() >= 10)
                {
                    largest.remove(0);
                }
                largest.add(new Long[]{i, l});
                Collections.sort(largest, c1);
                Collections.sort(largest, c2);
            }
        }

        Collections.sort(largest, c1);
        Collections.reverse(largest);
        Collections.sort(largest, c2);
        Collections.reverse(largest);

        for(int i = 0; i < largest.size(); i++)
        {
            System.out.println(largest.get(i)[0] + " " + largest.get(i)[1]);
        }
    }


    public static Long collatz(Long n)
    {
        if(n == 1)
        {
            return 0l;
        }
        else
        {
            if(n % 2 == 0)
            {
                return collatz(n/2) + 1;
            }
            else
            {
                return collatz(3*n + 1) + 1;
            }
        }
    }
}
