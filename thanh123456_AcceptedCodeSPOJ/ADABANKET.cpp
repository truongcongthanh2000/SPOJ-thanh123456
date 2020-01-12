#include <bits/stdc++.h>
using namespace std;
const int N = 1e3;
int n,kt[N];
vector <int> a[N];
void nhap()
{
    scanf("%d",&n);
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= n; j++) {
            int x;
            scanf("%d",&x);
            if (x == 1) {a[i].push_back(j);}
        }
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
    int res = 0;
    for (int i = 1; i <= n; i++) {
        if (kt[i] == 1) {dfs(i); res++;}
    }
    if (res > 1) {cout<<0;}
    else {
        int kq = n;
        for (int i = 1; i <= n; i++) {kq = min(kq,(int)a[i].size());}
        cout<<kq * 2;
    }
}
int main()
{
    nhap();
    solve();
}
