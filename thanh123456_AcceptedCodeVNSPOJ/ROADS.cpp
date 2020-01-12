#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
using namespace std;
typedef pair<int,int> i2;
typedef pair<int,i2> i3;
const int N = 200 + 1;
const long double sodu = 1e-6;
const int limit = 15000;
const int oo = 1e9 + 100;
const int module = 76213;
int ReadInt()
{
    int res = 0;
    char c;
    bool kt = false;
    c = getchar();
    if (c == '-') {kt = true;}
    else {
        res = res * 10 + (c - '0');
    }
    for (c = getchar(); c >= '0' && c <= '9'; c = getchar()) {
        res = res * 10 + (c - '0');
    }
    return (kt ? (0 - res) : res);
}
int GCD(int a,int b) {
    if (b == 0) {
        return a;
    }
    if (a == 0) {
        return b;
    }
    return GCD(b,a % b);
}
long long Mu(long long A,long long N,long long module) {
    if (N == 0) {return 1;}
    else {
        long long Tam = Mu(A,N >> 1,module);
        Tam = Tam * Tam % module;
        if (N & 1) {
            Tam = Tam * A % module;
        }
        return Tam;
    }
}
int test,n,m,k;
vector <int> a[N],l[N],t[N];
int d[N][20010];
void nhap()
{
    scanf("%d\n",&test);
}
void Dijkstra() {
    priority_queue <i3, vector<i3>, greater<i3> > Q;
    int oo = 1e9;
    for (int i = 2; i <= n; i++) {
        for (int j = 0; j <= k; j++) {
            d[i][j] = oo;
        }
    }
    d[1][0] = 0;
    Q.push(i3(0,i2(1,0)));
    int res = oo;
    while (Q.size() != 0) {
        i3 b = Q.top();
        Q.pop();
        i2 bb = b.second;
        int du = b.first;
        int u = bb.first;
        int money = bb.second;
        if (d[u][money] != du) {
            continue;
        }
        for (int i = 0; i < a[u].size(); i++) {
            int v = a[u][i];
            int tien = t[u][i];
            int len = l[u][i];
            if (money + tien <= k) {
                if (d[v][money + tien] > d[u][money] + len) {
                    d[v][money + tien] = d[u][money] + len;
                    Q.push(i3(d[v][money + tien],i2(v,money + tien)));
                }
            }
        }
    }
    for (int j = 0; j <= k; j++) {
        res = min(res,d[n][j]);
    }
    if (res == oo) {
        cout << -1 << '\n';
    }
    else {
        cout << res << '\n';
    }
}
void solve()
{
    for (int i = 1; i <= test; i++) {
        scanf("%d %d %d",&k,&n,&m);
        for (int j = 1; j <= n; j++) {
            a[j].clear();
            t[j].clear();
            l[j].clear();
        }
        for (int j = 1; j <= m; j++) {
            int u,v,L,T;
            scanf("%d %d %d %d",&u,&v,&L,&T);
            a[u].push_back(v);
            l[u].push_back(L);
            t[u].push_back(T);
        }
        Dijkstra();
    }
}
int main()
{
    nhap();
    solve();
}
