#include <iostream>
#include <tuple>
#include <vector>
#include <bits/stdc++.h>
using namespace std;

//function for getting the sequence length
//recursive version
long collatz(long n)
{
    if(n == 1)
    {
        return 0;
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

//custom sort for tuples
bool sort2(const tuple<long, long>& a, const tuple<long, long>& b)
{
    return (get<1>(a) < get<1>(b));
}

int main()
{
    //get user input
    cout << "Enter the upper bound: ";
    long n;
    cin >> n;

    //initialize array to hold the largest
    vector<tuple<long, long>> largest;
    largest.push_back(make_tuple(1, 0));

    //main loop
    for(long i = 1; i <= n; i++)
    {
        //get the current sequence length
        long l = collatz(i);
        //get the least significant sequence length of stored values
        tuple<long, long> temp = largest.at(0);

        //if current is more significant
        if(l > get<1>(temp))
        {
            if(largest.size() >= 10)
            {
                //replace if array is holding ten elements
                largest.erase(largest.begin());
            }
            //otherwise add to end
            largest.push_back(make_tuple(i, l));

            //sort by value descending, then by sequence length ascending
            sort(largest.begin(), largest.end());
            sort(largest.begin(), largest.end(), sort2);
            //result is the least significant element at index 0
        }
    }

    //sort by value ascending, then by sequence length descending
    sort(largest.begin(), largest.end());
    reverse(largest.begin(), largest.end());
    sort(largest.begin(), largest.end(), sort2);
    reverse(largest.begin(), largest.end());

    //print the stored values
    for(int i = 0; i < largest.size(); i++)
    {
        cout << get<0>(largest.at(i)) << " " << get<1>(largest.at(i)) << endl;
    }

    return 0;
}
