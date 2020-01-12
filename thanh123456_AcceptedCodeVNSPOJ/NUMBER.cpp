#include <bits/stdc++.h>
using namespace std;
const int N = 2e5 + 100;
int n,m,C,kt[N];
vector <int> a[N];
void nhap()
{
    scanf("%d %d %d",&n,&m,&C);
    for (int i = 1; i <= m; i++) {
        int u,v;
        scanf("%d %d",&u,&v);
        a[v].push_back(u);
    }
}
void dfs(int u)
{
    kt[u] = 1;
    for (int i = 0; i < a[u].size(); i++) {
        int v = a[u][i];
        if (kt[v] == 0) {dfs(v);}
    }
}
void solve()
{
    dfs(C);
    for (int i = 1; i <= n; i++) {
        if (!kt[i]) {
            dfs(i);
            kt[i] = 0;
        }
    }
    int top = 0;
    int stk[n];
    for (int i = 1; i <= n; i++) {
        if (!kt[i]) {
            stk[++top] = i;
        }
    }
    cout<<top<<'\n';
}
int main()
{
    nhap();
    solve();
}
