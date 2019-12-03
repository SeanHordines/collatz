#include <iostream>
#include <tuple>
#include <vector>
#include <bits/stdc++.h>
using namespace std;

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

bool sort2(const tuple<long, long>& a, const tuple<long, long>& b)
{
    return (get<1>(a) < get<1>(b));
}

int main()
{
    cout << "Enter the upper bound: ";
    long n;
    cin >> n;
    vector<tuple<long, long>> largest;
    largest.push_back(make_tuple(1, 0));

    for(long i = 1; i <= n; i++)
    {
        long l = collatz(i);
        tuple<long, long> temp = largest.at(0);

        if(l > get<1>(temp))
        {
            if(largest.size() >= 10)
            {
                largest.erase(largest.begin());
            }
            largest.push_back(make_tuple(i, l));
            sort(largest.begin(), largest.end());
            sort(largest.begin(), largest.end(), sort2);
        }
    }

    sort(largest.begin(), largest.end());
    reverse(largest.begin(), largest.end());
    sort(largest.begin(), largest.end(), sort2);
    reverse(largest.begin(), largest.end());
    for(int i = 0; i < largest.size(); i++)
    {
        cout << get<0>(largest.at(i)) << " " << get<1>(largest.at(i)) << endl;
    }

    return 0;
}
