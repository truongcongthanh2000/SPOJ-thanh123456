#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
using namespace std;
typedef pair<int,int> i2;
const int N = 2e5;
const int oo = 1e9 + 100;
int n,test;
int b[N][20],d[N];
vector <int> a[N];
void nhap()
{
    scanf("%d",&test);
}
void nhapdulieu()
{
    scanf("%d",&n);
    for (int i = 1; i <= n; i++) {
        a[i].clear();
    }
    for (int i = 1; i <= n; i++) {
        int sl;
        scanf("%d",&sl);
        for (int j = 1; j <= sl; j++) {
            int x;
            scanf("%d",&x);
            a[i].push_back(x);
            a[x].push_back(i);
        }
    }
}
void dfs(int u)
{
    for (int i = 0; i < log2(n); i++) {
        if (b[b[u][i]][i] == 0) {break;}
        b[u][i + 1] = b[b[u][i]][i];
    }
    for (int i = 0; i < a[u].size(); i++) {
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
    for (int i = log2(n); i >= 0; i--) {
        if (k >= (1 << i)) {
            k -= (1 << i);
            u = b[u][i];
        }
    }
    if (u == v) {return u;}
    int res = 0;
    for (int i = log2(n); i >= 0; i--) {
        if (b[u][i] != b[v][i]) {
            u = b[u][i];
            v = b[v][i];
        }
        else {
            res = b[u][i];
        }
    }
    return res;
}
void giai()
{
    int q;
    scanf("%d",&q);
    for (int i = 1; i <= q; i++) {
        int u,v;
        scanf("%d %d",&u,&v);
        cout<<LCA(u,v)<<'\n';
    }
}
void solve()
{
    for (int i = 1; i <= test; i++) {
        cout<<"Case "<<i<<":"<<'\n';
        nhapdulieu();
        dfs(1);
        giai();
    }
}
int main()
{
    nhap();
    solve();
}
