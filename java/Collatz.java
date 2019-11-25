import java.io.*;
import java.util.*;

public class Collatz
{
    public static void main(String[] args)
    {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter the upper limit: ");
        Long n = sc.nextLong();

        ArrayList<ArrayList> list = new ArrayList<ArrayList>();

        for(Long i = 1l; i <= n; i++)
        {
            ArrayList<Long> sequence = getSequence(i);
            list.add(sequence);
        }

        sort(list);
        for(int i = 0; i < list.size(); i++)
        {
            System.out.println(list.get(i).get(0) + "       " + (list.get(i).size()-1));
        }
    }

    public static ArrayList<Long> getSequence(Long n)
    {
        ArrayList<Long> sequence = new ArrayList<Long>();
        sequence.add(n);

        while(n != 1)
        {
            if(n % 2 == 0)
            {
                n = n / 2;
            }
            else
            {
                n = (3*n)+1;
            }
            sequence.add(n);
        }

        return sequence;
    }
}
