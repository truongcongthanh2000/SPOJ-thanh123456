#include <bits/stdc++.h>
using namespace std;
const int N = 805;
int n,m,a[N],b[N],Visited[N],Assigned[N],t = 0;
vector <int> A[N];
void nhap()
{
    scanf("%d %d",&n,&m);
    for (int i = 1; i <= n; i++) {scanf("%d",&a[i]);}
    for (int i = 1; i <= m; i++) {scanf("%d",&b[i]);}
}
int GCD(int a,int b)
{
    if (b == 0) {return a;}
    else {return GCD(b,a % b);}
}
void taomang()
{
    for (int i = 1; i <= n; i++)
    {
        for (int j = 1; j <= m; j++)
        {
            if (GCD(a[i],b[j]) > 1)
            {
                A[i].push_back(j);
            }
        }
    }
}
bool visit(int u) {
    if (Visited[u]!=t)
        Visited[u]=t;
    else
        return false;
    for (int i=0; i < A[u].size(); i++)
    {
        int v = A[u][i];
        if (!Assigned[v] || visit(Assigned[v])) {
            Assigned[v]=u;
            return true;
        }
    }
    return false;
}
void solve()
{
    int res = 0;
    for (int i = 1; i <= n; i++)
    {
        t++;
        res+=visit(i);
    }
    cout<<n + m - res;
}
int main()
{
    nhap();
    taomang();
    solve();
}
