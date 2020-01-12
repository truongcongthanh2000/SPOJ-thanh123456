#include <bits/stdc++.h>
using namespace std;
const int N = 1e5 + 100;
const int oo = (1 << 31) - 1;
int n,m;
struct ds
{
    int lazy,res;
}it[N * 4];
void nhap()
{
    scanf("%d %d",&n,&m);
}
void cn(int i,int l,int r)
{
    if (it[i].lazy == 0) {return;}
    it[i].res+=it[i].lazy;
    if (l != r)
    {
        it[i * 2].lazy += it[i].lazy;
        it[i * 2 + 1].lazy += it[i].lazy;
    }
    it[i].lazy = 0;
}
void update(int i,int l,int r,int u,int v,int x)
{
    cn(i,l,r);
    if (l > v || r < u) {return;}
    if (l >= u && r <= v)
    {
        it[i].lazy += x;
        cn(i,l,r);
        return;
    }
    int mid = (l + r) >> 1;
    update(i*2,l,mid,u,v,x);
    update(i*2+1,mid+1,r,u,v,x);
    it[i].res = max(it[i * 2].res,it[i * 2 + 1].res);
}
int get(int i,int l,int r,int u,int v)
{
    cn(i,l,r);
    if (l > v || r < u) {return -oo;}
    if (l >= u && r <= v) {return it[i].res;}
    int mid = (l + r) >> 1;
    int left = get(i * 2,l,mid,u,v);
    int right = get(i * 2 +1,mid + 1,r,u,v);
    return max(left,right);
}
void solve()
{
    for (int i = 1; i <= n; i++) {update(1,1,n,i,i,0);}
    for (int i = 1; i <= m; i++)
    {
        int u,v,x;
        scanf("%d %d %d",&u,&v,&x);
        update(1,1,n,u,v,x);
    }
    int q;
    scanf("%d",&q);
    for (int i = 1; i <= q; i++)
    {
        int u,v;
        scanf("%d %d",&u,&v);
        printf("%d\n",get(1,1,n,u,v));
    }
}
int main()
{
    nhap();
    solve();
}
