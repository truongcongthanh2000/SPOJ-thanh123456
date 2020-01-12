#include <bits/stdc++.h>
using namespace std;
typedef pair<int,int> i2;
const int N = 1e5 + 100;
vector <set<int> > res(N);
stack <i2> stk;
int n,m,number[N],low[N],f[N * 2],Count = 0,SLT = 0;
vector <int> a[N],b[N];
void nhap()
{
    scanf("%d %d",&n,&m);
    for (int i = 1; i <= m; i++) {
        int u,v;
        scanf("%d %d",&u,&v);
        a[u].push_back(v);
        a[v].push_back(u);
        b[u].push_back(i);
        b[v].push_back(i);
    }
}
void dfs(int u)
{
    number[u] = ++Count;
    low[u] = n + 1;
    for (int i = 0; i < a[u].size(); i++) {
        int v = a[u][i];
        int vt = b[u][i];
        if (f[vt] == 0) {
            f[vt] = 1;
            if (number[v]) {low[u] = min(low[u],number[v]);}
            else {
                stk.push(i2(u,v));
                dfs(v);
                low[u] = min(low[u],low[v]);
                if (low[v] >= number[u]) {
                    SLT++;
                    int x,y;
                    do
                    {
                        i2 bb = stk.top();
                        stk.pop();
                        x = bb.first;
                        y = bb.second;
                        res[SLT].insert(y);
                    }
                    while (x != u || y != v);
                    res[SLT].insert(u);
                }
            }
        }
    }
}
void tarjan()
{
    for (int i = 1; i <= n; i++) {
        if (number[i] == 0) {
            int vt = Count;
            dfs(i);
            if (vt + 1 == Count) {
                SLT++;
                res[SLT].insert(i);
            }
        }
    }
}
void solve()
{
    int dinh = 0;
    int kq = 0;
    for (int i = 1; i <= SLT; i++) {
        if (res[i].size() > kq) {
            kq = res[i].size();
            dinh = i;
        }
    }
    cout<<kq<<'\n';
}
int main()
{
    nhap();
    tarjan();
    solve();
}
