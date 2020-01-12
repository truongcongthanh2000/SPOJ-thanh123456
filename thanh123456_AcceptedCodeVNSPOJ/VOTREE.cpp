#include <bits/stdc++.h>
using namespace std;
struct ds
{
    int res,vt;
};
const int N = 1e5 + 100;
int n,m,b[N][20],d[N],number[N],Count = 0;
vector <int> a[N];
ds f1[N][20],f2[N][20];
void nhap()
{
    scanf("%d %d",&n,&m);
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
    for (int i = 0; i <= log2(n); i++)
    {
        if (b[u][i] == 0) {break;}
        if (b[b[u][i]][i] == 0) {break;}
        b[u][i + 1] = b[b[u][i]][i];
    }
    number[u] = ++Count;
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
            k-=(1 << i);
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
ds Min(const ds& left,const ds& right)
{
    if (left.res <= right.res) {return left;}
    else  {return right;}
}
ds Max(const ds& left,const ds& right)
{
    if (left.res >= right.res) {return left;}
    else {return right;}
}
void RMQ()
{
    for (int i = 1; i <= n; i++)
    {
        f1[i][0].res = number[i];
        f2[i][0].res = number[i];
        f1[i][0].vt = i;
        f2[i][0].vt = i;
    }
    for (int j = 1; j <= log2(n); j++)
    {
        for (int i = 1; i <= n - (1 << j) + 1; i++)
        {
            f1[i][j] = Min(f1[i][j-1],f1[i + (1 << (j - 1))][j - 1]);
            f2[i][j] = Max(f2[i][j-1],f2[i + (1 << (j - 1))][j - 1]);
        }
    }
}
int get(int l,int r)
{
    int k = log2(r - l + 1);
    ds res1 = Min(f1[l][k],f1[r - (1 << k) + 1][k]);
    ds res2 = Max(f2[l][k],f2[r - (1 << k) + 1][k]);
    //cout<<res1.vt<<" "<<res2.vt<<endl;
    return LCA(res1.vt,res2.vt);
}
void solve()
{
    ios_base::sync_with_stdio(0);
    cin.tie(NULL);
    cout.tie(NULL);
    for (int i = 1; i <= m; i++)
    {
        int l,r;
        scanf("%d %d",&l,&r);
        cout<<get(l,r)<<'\n';
    }
}
int main()
{
    nhap();
    dfs(1);
    RMQ();
    solve();
}
