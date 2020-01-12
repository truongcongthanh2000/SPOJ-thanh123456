#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
using namespace std;
typedef pair<int,int> i2;
const int N = 1e5;
const int oo = 1e9 + 100;
int n,m;
int d[N];
long long bac[N];
vector <int> a[N],b[N];
void nhap()
{
    scanf("%d %d",&n,&m);
    for (int i = 1; i <= m; i++) {
        int type,u,v,c;
        scanf("%d %d %d %d",&type,&u,&v,&c);
        if (type == 1) {
            a[u].push_back(v);
            b[u].push_back(c);
        }
        else {
            a[u].push_back(v);
            b[u].push_back(c);
            a[v].push_back(u);
            b[v].push_back(c);
        }
    }
}
void solve()
{
    priority_queue <i2, vector<i2>, greater<i2> > q;
    for (int i = 1; i <= n; i++) {
        bac[i] = 0;
        d[i] = oo;
    }
    d[1] = 0;
    bac[1] = 1;
    q.push(i2(d[1],1));
    while (q.size() != 0) {
        i2 bb = q.top();
        q.pop();
        int u = bb.second;
        int du = bb.first;
        if (du != d[u]) {continue;}
        for (int i = 0; i < a[u].size(); i++) {
            int v = a[u][i];
            int w = b[u][i];
            if (d[v] > d[u] + w) {
                d[v] = d[u] + w;
                bac[v] = bac[u];
                q.push(i2(d[v],v));
            }
            else {
                if (d[v] == d[u] + w) {
                    bac[v] += bac[u];
                }
            }
        }
    }
    cout<<d[n]<<" "<<bac[n];
}
int main()
{
    nhap();
    solve();
}
