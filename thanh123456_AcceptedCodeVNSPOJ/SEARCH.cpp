#include <bits/stdc++.h>
using namespace std;
const int N = 2e5;
int n,m,p,f1[N],f2[N],a[N],c[N],f3[N];
vector <int> stk(N);
void nhap()
{
    scanf("%d %d %d",&n,&m,&p);
    for (int i=1; i<=n; i++) {
            scanf("%d",&a[i]);
            f1[a[i]]=1;
    }
    sort(a+1,a+1+n);
    int top = 0;
    for (int i=1; i<=n; i++)
    {
        if (a[i] == a[i-1]) {continue;}
        a[++top] = a[i];
    }
    n = top;
    for (int i=1; i<=m; i++)
    {
        int x;
        scanf("%d",&x);
        f2[x] = 1;
    }
    for (int i=1; i<=p; i++) {scanf("%d",&c[i]);}
}
void solve()
{
    int len = 0;
    int res = 0;
    stk.clear();
    for (int i=1; i<=p; i++)
    {
        if (f2[c[i]]==0)
        {
            stk.push_back(c[i]);
            if (f1[c[i]]==1 && f3[c[i]]==0) {f3[c[i]]==1; len++;}
        }
        else
        {
            if (len >= n) {int u = stk.size(); res = max(res,u);}
            for (int i = 0; i<stk.size(); i++)
            {
                int u = stk[i];
                f3[u] = 0;
            }
            len = 0;
            stk.clear();
        }
    }
    int u = stk.size();
    if (len >= n) {res = max(res,u);}
    cout<<res<<endl;
}
int main()
{
    nhap();
    solve();
}
