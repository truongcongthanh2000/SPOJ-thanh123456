#include <bits/stdc++.h>
using namespace std;
const int N = 2e5 + 10;

int Test;
int KT[N],d[N];
vector <int> a[N];
void nhap()
{
    cin >> Test;
}

void DFS(int u) {
    KT[u] = 1;
    for (int v : a[u]) {
        if (KT[v] == 0) {
            d[v] = d[u] + 1;
            DFS(v);
        }
    }
}
void solve()
{
    while (Test--) {
        int n,m;
        cin >> n >> m;
        for (int i = 1; i <= n; i++) {
            KT[i] = d[i] = 0;
            a[i].clear();
        }
        while (m--) {
            int u,v;
            cin >> u >> v;
            a[u].push_back(v);
            a[v].push_back(u);
        }
        bool Check = 0;
        for (int i = 1; i <= n; i++) {
            if (KT[i] == 0) DFS(i);
        }
        for (int u = 1; u <= n; u++) {
            for (int v : a[u]) {
                if ((d[u] + d[v]) % 2 == 0) Check = 1;
            }
        }
        cout << 1 - Check << '\n';
    }
}
int main()
{
    ios_base::sync_with_stdio(0); cin.tie(nullptr); cout.tie(nullptr);
    nhap();
    solve();
}
