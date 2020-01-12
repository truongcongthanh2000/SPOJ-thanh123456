#include <bits/stdc++.h>
using namespace std;
const int N = 3e6 + 10;
char a[N],b[N];
int n,m,kt[256],d[256];
void nhap()
{
    scanf("%d %d\n",&n,&m);
    for (int i=1; i<=n; i++)
    {
        scanf("%c",&a[i]);
        int c = (int)a[i] - 'A';
        kt[c]++;
    }
    scanf("\n");
    for (int i=1; i<=m; i++)
    {
        scanf("%c",&b[i]);
    }
}
void solve()
{
    int sl = 0;
    int res = 0;
    int dung = true;
    for (int i=1; i<n; i++)
    {
        int c = (int)b[i] - 'A';
        d[c]++;
        if (d[c]==kt[c]) {sl+=d[c];}
    }
    for (int i=n; i<=m; i++)
    {
        int c = (int)b[i]- 'A';
        d[c]++;
        if (d[c]==kt[c]) {sl+=d[c];}
        if (sl==n) {res++;}
        int c2 = (int)b[i-n+1]-'A';
        if (d[c2]==kt[c2]) {sl-=d[c2];}
        d[c2]--;
    }
    cout<<res;
}
int main()
{
    nhap();
    solve();
}
