#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
using namespace std;
const int N = 1e5 + 1;
const int oo = 1e9 + 100;
vector <multiset<int> > a(N + 1);
int n,m;
void nhap()
{
    scanf("%d %d",&n,&m);
    for (int i = 1; i <= n; i++) {
        int x;
        scanf("%d",&x);
    }
    for (int i = 1; i <= m; i++) {
        int u,v;
        scanf("%d %d",&u,&v);
        a[u].insert(v);
        a[v].insert(u);
    }
//    for (int i = 1; i <= n; i++) {
//        cout<<a[i].size()<<endl;
//    }
}
void solve()
{
    cout<<m<<'\n';
    stack <int> stk;
    stk.push(1);
    while (stk.size() != 0) {
        int u = stk.top();
        if (a[u].size() == 0) {
            cout<<u<<" ";
            stk.pop();
            continue;
        }
        int v = *a[u].begin();
        a[u].erase(a[u].find(v));
        a[v].erase(a[v].find(u));
        stk.push(v);
    }
}
int main()
{
    nhap();
    solve();
}
