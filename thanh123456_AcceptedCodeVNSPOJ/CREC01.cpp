#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
using namespace std;
const int N = 1e3 + 100;
int n,m;
char c[N][N];
int l[N],r[N],d[N];
void nhap()
{
    scanf("%d %d\n",&n,&m);
    for (int i = 1; i <= n; i++)
    {
        for (int j = 1; j <= m; j++)
        {
            scanf("%c",&c[i][j]);
        }
        scanf("\n");
    }
}
void solve()
{
    long long res = 0;
    for (int i = 1; i <= n; i++)
    {
        for (int j = 1; j <= m; j++)
        {
            if (c[i][j] == '1') {d[j]++;}
            else {d[j] = 0;}
        }
        l[0] = 0;
        for (int j = 1; j <= m; j++)
        {
            l[j] = j;
            int k = j - 1;
            while (k > 0 && d[j] < d[k]) {
                l[j] = l[k];
                k = l[k] - 1;
            }
        }
        for (int j = m; j >= 1; j--)
        {
            r[j] = j;
            int k = j + 1;
            while (k <= m && d[j] <= d[k])
            {
                r[j] = r[k];
                k = r[k] + 1;
            }
        }
        for (int j = 1; j <= m; j++)
        {
            res+=1ll * (j - l[j] + 1) * (r[j] - j + 1) * d[j];
        }
    }
    cout<<res;
}
int main()
{
    nhap();
    solve();
}
