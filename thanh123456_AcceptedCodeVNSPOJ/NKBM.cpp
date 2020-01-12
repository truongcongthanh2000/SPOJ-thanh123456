#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
using namespace std;
const int N = 1e5;
const int oo = 1e9 + 100;
int n,m,M;
int kt[N],match[N],stk[N],top = 0,link[N];
bool Found = false;
vector <int> a[N];
void nhap()
{
    scanf("%d %d %d",&n,&m,&M);
    for (int i = 1; i <= M; i++) {
        int u,v;
        scanf("%d %d",&u,&v);
        a[u].push_back(v);
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
void CapGhep()
{
    int Nlink = n;
    for (int i = 1; i <= n; i++) {link[i] = i;}
    for (int i = 1; i <= m; i++) {match[i] = 0;}
    int Old;
    do {
        Old = Nlink;
        for (int i = 1; i <= top; i++) {
            kt[stk[i]] = 0;
        }
        top = 0;
        for (int i = Nlink; i >= 1; i--) {
            Found = false;
            DFS(link[i]);
            if (Found) {
                link[i] = link[Nlink--];
            }
        }
    }
    while (Old != Nlink);
    cout<<n - Old;
}
void solve()
{
    CapGhep();
}
int main()
{
    nhap();
    solve();
}
