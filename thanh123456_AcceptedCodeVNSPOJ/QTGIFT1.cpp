#include <bits/stdc++.h>
using namespace std;
const int N = 2e6+2;
int a[N],trace[N],n,top,bot,k,stk[N];
bool kt[N];
long long f[N],s;
void nhap()
{
    scanf("%d%d",&n,&k);
    for (int i=1; i<=n; i++)
    {
        scanf("%d",&a[i]);
        s+=(long long)a[i];
    }
}
void taomang()
{
    bot = 1;
    top = 0;
    for (int i=1; i<=k; i++)
    {
        f[i]=a[i];
        trace[i]=0;
        while (f[i]<=f[stk[top]] && top>=bot) {top--;}
        top++;
        stk[top] = i;
    }
}
void solve()
{
    for (int i=k+1; i<=n+k; i++)
    {
        f[i]=f[stk[bot]]+(long long)a[i];
        trace[i] = stk[bot];
        while (f[i]<=f[stk[top]] && top>=bot) {top--;}
        top++;
        stk[top] = i;
        if (i-stk[bot]>=k) {stk[bot]=0; bot++;}
    }
}
void truyvet()
{
    int res;
    res = n;
    for (int i=n+1; i<=n+k; i++)
    {
        if (f[i] < f[res]) {res=i;}
    }
    cout<<s-f[res]<<endl;
}
int main()
{
    nhap();
    taomang();
    solve();
    truyvet();
}
