#include <bits/stdc++.h>
using namespace std;
const int N = 1e4 + 100;
const int module = 1e9 + 7;
int test,a[N],f[10],n;
void nhap()
{
    scanf("%d\n",&test);
}
void nhapdulieu()
{
    char s[N];
    scanf("%s\n",&s);
    n = strlen(s);
    for (int i = 1; i <= n; i++) {
        a[i] = s[i - 1] - '0';
    }
    for (int i = 0; i <= 9; i++) {
        f[i] = 0;
    }
}
void solve()
{
    for (int i = 1; i <= n; i++) {
        int s = 0;
        for (int j = 0; j < a[i]; j++) {
            s += f[j];
            if (s >= module) {s-=module;}
        }
        f[a[i]] += s + 1;
        if (f[a[i]] >= module) {f[a[i]]-=module;}
    }
    int res = 0;
    for (int i = 0; i < 10; i++) {
        res += f[i];
        if (res >= module) {res -= module;}
    }
    cout<<res;
}
void Solve()
{
    for (int i = 1; i <= test; i++, cout<<'\n')
    {
        nhapdulieu();
        cout<<"Case "<<i<<": ";
        solve();
    }
}
int main()
{
    nhap();
    Solve();
}
