#include <bits/stdc++.h>
using namespace std;
const int N = 2e3 + 10;
const long long base = 26;
const long long module = (1 << 31) - 1;
int l,r,n,m;
long long a[N + 10][N + 10],b[N + 10][N + 10],f[N + 10][N + 10];
long long pw[N + 10],mu[N + 10];
char c[N + 10][N + 10],d[N + 10][N + 10];
void nhap()
{
    scanf("%d %d\n",&l,&r);
    for (int i = 1; i <= l; i++)
    {
        scanf("%s\n",&c[i]);
        a[i][0] = 0;
        for (int j = 1; j <= r; j++)
        {
            a[i][j] = (a[i][j - 1] * base + (long long)c[i][j - 1] - 'a') % module;
        }
    }
    pw[0] = 1;
    for (int i = 1; i < N; i++) {pw[i] = (pw[i - 1] * base) % module;}
    mu[0] = 1;
    scanf("%d %d\n",&n,&m);
    for (int i = 1; i < N; i++) {mu[i] = (mu[i - 1] * pw[r]) % module;}
    for (int i = 1; i <= n; i++)
    {
        //cout<<"CC"<<endl;
        b[i][0] = 0;
        scanf("%s\n",&d[i]);
        for (int j = 1; j <= m; j++)
        {
            b[i][j] = (b[i][j - 1] * base + (long long)d[i][j - 1] - 'a') % module;
        }
    }
}
bool check(int x,int y)
{
    for (int i = x; i <= x + l - 1; i++)
    {
        for (int j = y; j <= y + r - 1; j++)
        {
            if (d[i][j - 1] != c[i - x + 1][j - y]) {return false;}
        }
    }
    return true;
}
long long get_hash1(int i,int l,int r)
{
    return (a[i][r] - (a[i][l - 1] * pw[r - l + 1]) % module + module) % module;
}
long long get_hash2(int i,int l,int r)
{
    return (b[i][r] - (b[i][l - 1] * pw[r - l + 1]) % module + module) % module;
}
long long get(int l,int R,int i)
{
    return (f[R][i] - (f[l - 1][i] * mu[r]) % module + module) % module;
}
void qhd()
{
    for (int i = 1; i <= n; i++)
    {
        for (int j = r; j <= m; j++)
        {
            f[i][j] = ((f[i - 1][j] * pw[r]) % module + get_hash2(i,j - r + 1,j)) % module;
            //cout<<f[i][j]<<endl;
        }
    }
}
void vet()
{
    int res = 0;
    for (int i = 1; i <= n - l + 1; i++)
    {
        for (int j = 1; j <= m - r + 1; j++)
        {
            if (check(i,j)) {res++;}
        }
    }
    cout<<res;
}
void solve()
{
    long long gt = 0;
    for (int i = 1; i <= l; i++)
    {
        gt = ((gt * pw[r]) % module + get_hash1(i,1,r)) % module;
    }
    int res = 0;
    for (int i = 1; i <= n - l + 1; i++)
    {
        for (int j = r; j <= m; j++)
        {
            long long tam = get(i,i + l - 1,j);
            if (tam == gt) {
                cout<<"("<<i<<","<<j - r + 1<<")"<<'\n';
                res++;
            }
        }
    }
    if (res == 0) {cout<<"NO MATCH FOUND...";}
}
bool check2(int x,int y)
{
    for (int i = x; i <= x + l - 1; i++)
    {
        //cout<<get_hash1(i - x + 1,1,r)<<" "<<get_hash2(i,y,y + r - 1)<<endl;
        if (get_hash1(i - x + 1,1,r) != get_hash2(i,y,y + r - 1)) {return false;}
    }
    return true;
}
void vet_2()
{
    int res = 0;
    for (int i = 1; i <= n - l + 1; i++)
    {
        for (int j = 1; j <= m - r + 1; j++)
        {
            if (check2(i,j)) {
                cout<<"("<<i<<","<<j<<")"<<'\n';
                res++;
            }
        }
    }
    if (res == 0) {cout<<"NO MATCH FOUND...";}
}
void Solve()
{
    vet_2();
}
int main()
{
    nhap();
    qhd();
    Solve();
}
