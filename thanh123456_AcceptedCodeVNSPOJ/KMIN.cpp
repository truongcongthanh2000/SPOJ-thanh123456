#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
using namespace std;
typedef pair<int,pair<int,int> > ii;
const int N = 1e5 + 100;
int n,m,k,a[N],b[N];
void nhap()
{
    scanf("%d %d %d",&n,&m,&k);
    for (int i=1; i<=n; i++) scanf("%d",a + i);
    for (int i=1; i<=m; i++) scanf("%d",b + i);
    sort(a+1,a+1+n);
    sort(b+1,b+1+m);
}
void solve()
{
    priority_queue <ii, vector<ii> , greater<ii> > stk;
    for (int i=1; i<=n; i++) stk.push(mp(a[i] + b[1],mp(i,1)));
    for (int i=1; i<=k; i++)
    {
        ii bb = stk.top();
        int du = bb.first;
        printf("%d\n",du);
        int u = bb.second.first;
        int v = bb.second.second;
        stk.pop();
        if (v < m) {
            stk.push(mp(a[u] + b[v+1],mp(u,v+1)));
        }
    }
}
int main()
{
    nhap();
    solve();
}
