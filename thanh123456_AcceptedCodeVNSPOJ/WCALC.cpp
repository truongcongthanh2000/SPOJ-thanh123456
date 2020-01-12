#include <bits/stdc++.h>
using namespace std;
int b,n;
void nhap()
{
    scanf("%d %d",&b,&n);
}
bool check(int m)
{
    long long s1 = 0-m;
    long long s2 = b;
    long long s3 = m - 2*n;
    long long ts = s1 * s2 * s3;
    long long ms = 1ll * n * n;
    return (ts % ms ==0);
}
void solve()
{
    int res = 0;
    for (int i=1; i<2*n; i++)
    {
        res = (check(i) ? res+1 : res);
        //cout<<check(i)<<" "<<res<<endl;
    }
    cout<<res<<endl;
}
int main()
{
    nhap();
    solve();
}
