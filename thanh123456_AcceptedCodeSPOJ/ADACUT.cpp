#include <bits/stdc++.h>
using namespace std;
const int N = 3e5 + 100;
const long long oo = 1e18;
int a[N],n;
long long s[N];
void nhap()
{
    scanf("%d",&n);
    for (int i = 1; i <= n; i++) {scanf("%d",&a[i]);}
    sort(a+1,a+1+n);
}
void solve()
{
    long long res = oo;
    for (int i = 1; i <= n; i++) {s[i] = s[i - 1] + 1ll * a[i];}
    for (int i = 1; i <= n; i++)
    {
        res = min(res,s[i - 1] + (s[n] - s[i] - 1ll * (n - i) * a[i])) ;
    }
    cout<<res;
}
int main()
{
    nhap();
    solve();
}
