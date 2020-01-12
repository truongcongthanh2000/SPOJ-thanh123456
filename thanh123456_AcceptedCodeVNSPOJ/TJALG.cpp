#include <bits/stdc++.h>
using namespace std;
const int N = 2e5 + 100;
int n,m,low[N],number[N],fr[N],Count = 0,top = 0,stk[N],slpt = 0;
vector <int> a[N];
void nhap()
{
    scanf("%d %d",&n,&m);
    for (int i=1; i<=m; i++)
    {
        int u,v;
        scanf("%d %d",&u,&v);
        a[u].push_back(v);
    }
}
void dfs(int u)
{
    number[u] = ++Count;
    low[u] = Count;
    stk[++top] = u;
    for (int i=0; i<a[u].size(); i++)
    {
        int v = a[u][i];
        if (fr[v] == 0)
        {
            if (number[v] == 0)
            {
                dfs(v);
                low[u] = min(low[u],low[v]);
            }
            else {low[u] = min(low[u],number[v]);}
        }
    }
    if (number[u] == low[u])
    {
        int v;
        slpt++;
        do
        {
            v = stk[top--];
            //printf("%d ",v);
            fr[v] = 1;
        }
        while (v!=u);
        //printf("\n");
    }
}
void tarjan()
{
    for (int i=1; i<=n; i++)
    {
        if (number[i] == 0) {dfs(i);}
    }
    cout<<slpt;
}
int main()
{
    nhap();
    tarjan();
}
