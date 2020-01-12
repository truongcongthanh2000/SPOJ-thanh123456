#include <bits/stdc++.h>
using namespace std;
const int N = 1e5 + 100;
int test;
char s[N];
int m,n,a[N],b[N],t[N];
void nhap()
{
    scanf("%d\n",&test);
}
void taomang()
{
    scanf("%d\n",&m);
    scanf("%s\n",&s);
    n = 0;
    int len = strlen(s);
    for (int i = 1; i <= len; i++) {
        if (s[i - 1] == '1') {
            n++;
            a[n] = i;
        }
    }
}
void init()
{
    t[0] = 0;
    for (int i = 1; i <= n + 1; i++) {
        t[i] = t[i - 1] + a[i];
    }
}
int tinh(int l,int r)
{
    int s1 = l * (l - 1) / 2;
    int s2 = r * (r + 1) / 2;
    return s2 - s1;
}
void solve()
{
    //cout<<tinh(2,5)<<endl;
    int p = (m + 1) >> 1;
    int l = p;
    int r = m - p;
    int res = 1e9 + 100;
    for (int i = 1; i <= n - m + 1; i++) {
        int s1 = a[p] * (l - 1) - (t[p - 1] - t[i - 1]) - tinh(1,(l - 1));
        int s2 = (t[i + m - 1] - t[p]) - a[p] * r - tinh(1,r);
        p++;
        res = min(res,s1 + s2);
    }
    cout<<res<<'\n';
}
void print()
{
    for (int i = 1; i <= test; i++) {
        taomang();
        init();
        solve();
    }
}
int main()
{
    nhap();
    print();
}
