#include <bits/stdc++.h>
using namespace std;
const int N = 2e5 + 100;
int n;
struct ds
{
    long long x1,y1,x2,y2;
}a[N];
void nhap()
{
    scanf("%d",&n);
    for (int i = 1; i <= n; i++) {
        scanf("%lld %lld %lld %lld",&a[i].x1,&a[i].y1,&a[i].x2,&a[i].y2);
    }
}
bool check(long long kc)
{
    long long x1,y1,x2,y2;
    x1 = a[1].x1 - kc;
    y1 = a[1].y1 - kc;
    x2 = a[1].x2 + kc;
    y2 = a[1].y2 + kc;
    for (int i = 2; i <= n; i++) {
        x1 = max(x1,a[i].x1 - kc);
        y1 = max(y1,a[i].y1 - kc);
        x2 = min(x2,a[i].x2 + kc);
        y2 = min(y2,a[i].y2 + kc);
    }
    if (x1 < x2 && y1 < y2) {return true;}
    else {return false;}
}
void solve()
{
    long long l = 0;
    long long r = 1e10;
    long long res = 0;
    while (l <= r) {
        long long mid = (l + r) >> 1;
        if (check(mid)) {r = mid - 1; res = mid;}
        else {l = mid + 1;}
    }
    cout<<res;
}
int main()
{
    nhap();
    solve();
}
