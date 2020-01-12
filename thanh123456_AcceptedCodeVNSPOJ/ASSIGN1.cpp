#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
using namespace std;
const int N = 1e3;
const int oo = 1e9 + 100;
int n,m;
int c[N][N];
int kt[N],stk[N],top = 0,match[N],link[N];
bool Found = false;
vector <int> a[N];
void nhap()
{
    scanf("%d",&n);
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= n; j++) {
            scanf("%d",&c[i][j]);
        }
    }
}
void DFS(int u)
{
    for (int i = 0; i < a[u].size(); i++) {
        int v = a[u][i];
        if (kt[v] == 0) {
            kt[v] = 1;
            stk[++top] = v;
            if (match[v] == 0) {Found = true;}
            else {DFS(match[v]);}
            if (Found) {
                match[v] = u;
                return;
            }
        }
    }
}
bool CapGhep()
{
    for (int i = 1; i <= n; i++) {
        link[i] = i;
        match[i] = 0;
    }
    int Nlink = n;
    int Old;
    do {
        Old = Nlink;
        for (int i = 1; i <= top; i++) {
            kt[stk[i]] = 0;
        }
        top = 0;
        for (int i = Nlink; i >= 1; i--){
            Found = false;
            DFS(link[i]);
            if (Found) {
                link[i] = link[Nlink--];
            }
        }
    }
    while (Old != Nlink);
    return (Nlink == 0);
}
void init(int len)
{
    for (int i = 1; i <= n; i++) {
        a[i].clear();
        for (int j = 1; j <= n; j++) {
            if (c[i][j] <= len) {a[i].push_back(j);}
        }
    }
}
bool check(int len)
{
    init(len);
    return CapGhep();
}
void solve()
{
    int l = 0;
    int r = 1e9 + 100;
    int res = 0;
    while (l <= r) {
        int mid = (l + r) >> 1;
        if (check(mid)) {res = mid; r = mid - 1;}
        else {l = mid + 1;}
    }
    cout<<res;
}
int main()
{
    nhap();
    solve();
}
