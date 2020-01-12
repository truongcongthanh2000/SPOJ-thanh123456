#include <bits/stdc++.h>
using namespace std;
const int N = 1e5 + 100;
int n,m,a[N],test;
void nhap()
{
    scanf("%d",&test);
}
void nhapdulieu()
{
    scanf("%d %d",&n,&m);
    for (int i = 1; i <= n; i++) {
        scanf("%d",&a[i]);
    }
}
bool check(long long x)
{
    long long s = 0;
    for (int i = 1; i <= n; i++) {
        s += 1ll * min(x,1ll * a[i]);
    }
    //cout<<s<<endl;
    return (s >= x * m);
}
void solve()
{
    for (int i = 1; i <= test; i++) {
        nhapdulieu();
        long long l = 0;
        long long r = 1e15;
        long long res = 0;
        while (l <= r) {
            long long mid = (l + r) >> 1;
            if (check(mid)) {
                l = mid + 1;
                res = mid;
            }
            else {r = mid - 1;}
        }
        printf("Case %d: ",i);
        cout<<res<<'\n';
    }
}
int main()
{
    nhap();
    solve();
}
