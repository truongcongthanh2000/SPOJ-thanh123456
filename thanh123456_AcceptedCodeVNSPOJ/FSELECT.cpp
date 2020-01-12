#include <bits/stdc++.h>
using namespace std;
const int N = 2e5 + 100;
int n,k,b[N][20],d[N],root = 1;
vector <int> a[N],vt[N];
void nhap()
{
    scanf("%d %d",&n,&k);
    for (int i = 1; i <= n; i++)
    {
        int u,v;
        scanf("%d %d",&u,&v);
        vt[u].push_back(i);
        if (v == 0) {root = i; continue;}
        a[i].push_back(v);
        a[v].push_back(i);
    }
}
void dfs(int u)
{
    for (int i = 0; i <= log2(n); i++)
    {
        if (b[b[u][i]][i] == 0) {break;}
        b[u][i + 1] = b[b[u][i]][i];
    }
    for (int i = 0; i < a[u].size(); i++)
    {
        int v = a[u][i];
        if (b[u][0] == v) {continue;}
        b[v][0] = u;
        d[v] = d[u] + 1;
        dfs(v);
    }
}
int LCA(int u,int v)
{
    if (d[u] < d[v]) {swap(u,v);}
    int k = d[u] - d[v];
    for (int i = log2(n); i >= 0; i--)
    {
        if (k >= (1 << i))
        {
            u = b[u][i];
            k-= 1 << i;
        }
    }
    if (u == v) {return u;}
    int res = 0;
    for (int i = log2(n); i >= 0; i--)
    {
        if (b[u][i] != b[v][i])
        {
            u = b[u][i];
            v = b[v][i];
        }
        else {res = b[u][i];}
    }
    return res;
}
int kc(int u,int v)
{
    int root = LCA(u,v);
    return d[u] + d[v] - 2 * d[root];
}
void solve()
{
    ios_base::sync_with_stdio(0);
    cin.tie(NULL);
    cout.tie(NULL);
    for (int i = 1; i <= k; i++)
    {
        int dinh = 0;
        for (int j = 0; j < vt[i].size(); j++)
        {
            int u = vt[i][j];
            if (d[u] > d[dinh]) {dinh = u;}
        }
        int res = 0;
        for (int j = 0; j < vt[i].size(); j++)
        {
            res = max(res,kc(dinh,vt[i][j]));
        }
        cout<<res<<'\n';
    }
}
int main()
{
    nhap();
    dfs(root);
    solve();
}
