#include <bits/stdc++.h>
using namespace std;
const int N = 100;
int test;
string f[N + 10];
void nhap()
{
    scanf("%d",&test);
}
string cong(string a,string b)
{
    string c;
    c.resize(0);
    string d;
    d.resize(0);
    for (int i = a.size() - 1; i >= 0; i--) {c.push_back(a[i]);}
    for (int i = b.size() - 1; i >= 0 ; i--) {d.push_back(b[i]);}
    while (c.size() > d.size()) {d.push_back('0');}
    while (c.size() < d.size()) {c.push_back('0');}
    //cout<<c<<" "<<d<<"CC"<<endl;
    string res;
    int du = 0;
    res.resize(0);
    for (int i = 0; i < c.size(); i++)
    {
        int x = c[i] - '0';
        int y = d[i] - '0';
        int z = x + y + du;
        res.push_back(char(z % 10) + '0');
        du = z / 10;
    }
    if (du == 1) {res.push_back('1');}
    string kq;
    kq.resize(0);
    for (int i = res.size() - 1; i >= 0; i--)
    {
        kq.push_back(res[i]);
    }
    return kq;
}
void solve()
{
    f[1] = '1';
    f[2] = '2';
    for (int i = 3; i <= N; i++) {f[i] = cong(f[i - 1],f[i - 2]);}
}
void Solve()
{
    for (int t = 1; t <= test; t++)
    {
        int n;
        scanf("%d",&n);
        cout<<f[n]<<'\n';
    }
}
int main()
{
    nhap();
    solve();
    Solve();
}
