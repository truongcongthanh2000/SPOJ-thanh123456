#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
using namespace std;
const int N = 3e5 + 8;
int n,sl,res,t[N*10][26],f[N*26],g[N*26],d[N*26];
void nhap()
{
    scanf("%d\n",&n);
    sl = 1;
    res = 0;
}
void add(string s)
{
    int root = 1;
    for (int i=0; i<s.size(); i++)
    {
        if (t[root][s[i]-'a']==0)
        {
            sl++;
            t[root][s[i]-'a']=sl;
        }
        root = t[root][s[i]-'a'];
    }
    f[root]=1;
}
void dfs(int u)
{
    res = max(res,f[u]);
    d[u] = 1;
    for (int i=0; i<26; i++)
    {
        int v = t[u][i];
        if (v!=0 && d[v]==0)
        {
            f[v] = f[u]+f[v];
            dfs(v);
        }
    }
}
void solve()
{
    for (int i=1; i<=n; i++)
    {
        string s;
        getline(cin,s);
        add(s);
    }
    dfs(1);
    cout<<res<<endl;
}
int main()
{
    nhap();
    solve();
}
