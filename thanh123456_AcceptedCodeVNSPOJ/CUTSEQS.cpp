#include <bits/stdc++.h>
using namespace std;
const int N = 2e5 + 100;
const long long oo = 1e18 + 100;
int n,a[N],parent[N];
long long m,s[N],f[N];
void nhap()
{
    scanf("%d %lld",&n,&m);
    long long s = 0;
    int tam = 0;
    for (int i=1; i<=n; i++)
    {
        scanf("%d",&a[i]);
        s+=1ll * a[i];
        tam = max(tam,a[i]);
    }
    if (s <= m)
    {
        cout<<tam;
        exit(0);
    }
    if (tam > m) {cout<<-1; exit(0);}
}
void Stack()
{
    stack <int> stk;
    for (int i = 1; i<=n; i++)
    {
        while (stk.size() > 0 && a[i] >= a[stk.top()]) {stk.pop();}
        if (stk.size() == 0) {parent[
            i] = 0;}
        else {parent[i] = stk.top();}
        stk.push(i);
    }
//    for (int i=1; i<=n; i++) {cout<<parent[i]<<" ";}
//    cout<<endl;
}
void solve()
{
    long long s = 0;
    int l = 1;
    for (int i = 1; i <= n; i++)
    {
        f[i] = oo;
        s+=1ll * a[i];
        while (s > m) {s-=a[l]; l++;}
        int u = i;
        while (parent[u] >= l)
        {
            //cout<<u<<" "<<endl;
            f[i] = min(f[i],f[parent[u]] + a[u]);
            u = parent[u];
        }
        f[i] = min(f[i],f[l - 1] + a[u]);
    }
    if (f[n] == oo) {cout<<-1;}
    else {cout<<f[n];}
}
int main()
{
    nhap();
    Stack();
    solve();
}
