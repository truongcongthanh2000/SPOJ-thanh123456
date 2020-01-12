#include <bits/stdc++.h>
using namespace std;
const int module = 10243;
const int N = 5000;
const int KK = 100;
int n,K,f[N][KK],kt[N],t[N][KK];
vector <int> a[N],A[N];
void nhap()
{
    scanf("%d %d",&n,&K);
    for (int i = 1; i < n; i++)
    {
        int u,v;
        scanf("%d %d",&u,&v);
        a[u].push_back(v);
        a[v].push_back(u);
    }
}
void dfs(int u)
{
    kt[u] = 1;
    f[u][1] = 1;
    for (int i = 0; i < a[u].size(); i++)
    {
        int v = a[u][i];
        if (kt[v] == 0)
        {
            A[u].push_back(v);
            dfs(v);
        }
    }
    for (int i = 0; i < A[u].size(); i++)
    {
        int v = A[u][i];
        for (int j = K; j > 1; j--)
        {
            for (int k = 1; k < j; k++)
            {
                f[u][j]+=(1ll * f[u][k] * f[v][j - k]) % module;
                f[u][j]%=module;
            }
        }
    }
}
void solve()
{
    int res = 0;
    //cout<<f[5][3]<<endl;
    for (int i = 1; i <= n; i++)
    {
        //cout<<i<<" "<<f[i][]<<endl;
        res = res + f[i][K];
        //cout<<i<<" "<<res<<endl;
        res = res % module;
    }
    cout<<res<<endl;
}
int main()
{
    nhap();
    dfs(1);
    solve();
}
