#include <bits/stdc++.h>
#define pb push_back
#define mp make_pair
using namespace std;
const int module = 1e9+9;
int n,m,dem,cau;
const int N=1e5+7;
vector <int> a[N],vt[N];
stack <int> stk;
int low[N],number[N],c[N],f[N];
bool kt[N];
void nhap()
{
    scanf("%d%d",&n,&m);
    for (int i=1 ; i<=m; i++)
    {
        int u,v;
        scanf("%d%d",&u,&v);
        a[u].pb(v);
        a[v].pb(u);
        vt[u].pb(i);
        vt[v].pb(i);
    }
    dem=0;
    cau=0;
}
void DFS(int x)
{
    stack <pair<int, int> > s;
    int u,t,i,v;
    s.push(mp(x,0));
    while (s.size()!=0)
    {
        pair<int, int> b = s.top();
        //cout<<b.first<<" "<<b.second<<endl;
        u = b.first; t = b.second;
        if (t==0)
        {
            number[u] = ++dem;
            low[u] = n+1;
            stk.push(u);
            c[u] = 0;
            kt[u] = false;
        }
        for (int i=t; i<a[u].size(); i++)
        {
            s.top().second++;
            if (f[vt[u][i]]==1) {break;}
            f[vt[u][i]]=1;
            v=a[u][i];
            //cout<<u<<" "<<v<<endl;
            if (number[v]!=0)
            {
                low[u] = min(low[u],number[v]);
            }
            else
            {
                //cout<<u<<" "<<v<<endl;
                c[u]++;
                s.push(mp(v,0));
            }
            break;
        }
        if (t==a[u].size())
            {
                s.pop();
                v=u;
                if (s.size()==0) {break;}
                pair<int, int> b = s.top();
                u = b.first;
                //cout<<u<<" "<<v<<endl;
                if (low[v] > number[u]) {cau++;}
                if (low[v] >= number[u]) {kt[u] = true;}
                low[u] = min(low[u],low[v]);
            }
    }
}
void solve()
{
    for (int i=1; i<=n; i++)
    {
        if (number[i] ==0) {
                DFS(i);
                if (c[i] < 2) {kt[i]=false;}
        }
    }
    int khop=0;
    for (int i=1; i<=n; i++)
    {
        if (kt[i]==true) {khop++;}
    }
    cout<<khop<<" "<<cau<<endl;
}
int main()
{
    nhap();
    solve();
    return 0;
}
