#include <bits/stdc++.h>
using namespace std;
const int N = 1e5 + 100;
int n,d[N + 1],f[N],parent[N + 1],b[N][18],pos[N],Count = 0;
vector <int> a[N],A[N];
void nhap()
{
    scanf("%d",&n);
    for (int i = 0; i < N; i++) {a[i].resize(0);}
    for (int i = 1; i < n; i++)
    {
        int u,v;
        scanf("%d %d",&u,&v);
        a[u].push_back(v);
        a[v].push_back(u);
    }
    memset(parent,0,sizeof(parent));
    memset(d,0,sizeof(d));
    parent[1] = -1;
}
void ptich(int x)
{
    for (int i = 1; i * i <= x; i++)
    {
        if (x % i == 0)
        {
            if (i * i == x) {A[x].push_back(i);}
            else {
                A[x].push_back(i);
                A[x].push_back(x / i);
            }
        }
    }
    //sort(A[x].begin(),A[x].end());
}
void init()
{
    for (int i = 1; i<= n; i++) {
        pos[i] = 1;
        ptich(i);
    }
}
void dfs(int u)
{
    for (int i = 0; i <= 17; i++)
    {
        if (b[u][i] == 0) {break;}
        if (b[b[u][i]][i] == 0) {break;}
        b[u][i + 1] = b[b[u][i]][i];
    }
    for (int i = 0; i < a[u].size(); i++)
    {
        int v = a[u][i];
        if (b[u][0] == v) {continue;}
        d[v] = d[u] + 1;
        b[v][0] = u;
        dfs(v);
    }
}
int LCA(int u,int v)
{
    if (d[u] < d[v]) {swap(u,v);}
    int k = d[u] - d[v];
    for (int i = 17; i >= 0; i--)
    {
        if (k >= (1 << i))
        {
            k-=(1 << i);
            u = b[u][i];
        }
    }
    if (u == v) {return u;}
    int res = 0;
    for (int i = 17; i >= 0; i--)
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
void visit(int u)
{
    for (int i = 0; i < A[u].size(); i++)
    {
        int v = A[u][i];
        int root = LCA(pos[v],u);
        //cout<<v<<" "<<u<<" "<<pos[v]<<" "<<root<<endl;
        f[v]+=2 * (d[u] - d[root]);
        pos[v] = u;
    }
    for (int i = 0; i < a[u].size(); i++)
    {
        int v = a[u][i];
        if (parent[v] == 0) {
            parent[v] = u;
            visit(v);
        }
    }
    for (int i = 0; i < A[u].size(); i++)
    {
        int v = A[u][i];
        //cout<<v<<" "<<u<<endl;
        pos[v] = u;
    }
}
void solve()
{
    int sl = 0;
    for (int i = 1; i <= n; i++) {
        printf("%d\n",f[i]);
    }
}
int main()
{
    nhap();
    init();
    dfs(1);
    visit(1);
    solve();
}
