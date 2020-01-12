#include <bits/stdc++.h>
using namespace std;
const int N = 1e6 + 100;
int test,n,d,a[N],sl[2];
void nhap()
{
    scanf("%d",&test);
}
void docdulieu()
{
    scanf("%d %d",&n,&d);
    sl[0] = 0;
    sl[1] = 0;
    for (int i = 1; i <= d; i++) {
        scanf("%d",&a[i]);
    }
}
void solve()
{
    int len = d + 1;
    int s = 0;
    for (int i = 1; i <= d; i++) {
        sl[a[i]]++;
        s ^= a[i];
    }
    if (d == n) {
        cout<<sl[1] % 2<<'\n';
        return;
    }
    d++;
    a[d] = s; sl[a[d]]++;
    long long kq = 1ll * (n / d) * sl[1];
    kq %= 2;
    long long thua = n % d;
    for (int i = 1; i <= thua; i++) {
        kq+=a[i] % 2;
        kq%=2;
    }
    cout<<kq<<'\n';
}
void FULL()
{
    for (int i = 1; i <= test; i++) {
        docdulieu();
        solve();
    }
}
int main()
{
    nhap();
    FULL();
}
