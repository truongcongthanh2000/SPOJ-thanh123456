#include <bits/stdc++.h>
using namespace std;
const int N = 4e5;
int n,a[N],test,bac[N];
void nhap()
{
    scanf("%d",&test);
}
void nhap_mang()
{
    scanf("%d",&n);
    for (int i=1; i<=2*n; i++) {scanf("%d",&a[i]);}
}
void solve()
{
    stack <int> stk;
    memset(bac,0,sizeof(bac));
    for (int i=1; i<=n*2; i++)
    {
        stk.push(a[i]);
        if (stk.size()==1) {continue;}
        int u = stk.top();
        stk.pop();
        int v = stk.top();
        if (u!=v) {stk.push(u); continue;}
        stk.pop();
        if (stk.size()==0) {break;}
        int root = stk.top();
        bac[root]++; bac[u]++;
        //cout<<u<<" "<<root<<endl;
    }
    int res = 0;
    for (int i=1; i<=n; i++)
    {
        res = max(res,bac[i]);
    }
    printf("%d\n",res);
}
void Solve()
{
    for (int i=1; i<=test; i++)
    {
        nhap_mang();
        solve();
    }
}
int main()
{
    nhap();
    Solve();
}
