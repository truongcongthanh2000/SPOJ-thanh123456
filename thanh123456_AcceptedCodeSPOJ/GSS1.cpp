#include <bits/stdc++.h>
using namespace std;
const int N = 1e5 + 100;
const int oo = (1 << 30) - 1;
int n,m;
struct ds
{
    int left,right,res,sum;
    ds(){};
    ds (int l,int r,int s,int kq)
    {
        left = l;
        right = r;
        sum = s;
        res = kq;
    }
}it[N * 4];
int a[N];
void nhap()
{
    scanf("%d",&n);
    for (int i = 1; i <= n; i++) {scanf("%d",&a[i]);}
}
ds get(const ds &left,const ds &right)
{
    ds root;
    root.sum = left.sum + right.sum;
    root.left = max(left.left,left.sum + right.left);
    root.right = max(right.right,right.sum + left.right);
    root.res = max(max(left.res,right.res),left.right + right.left);
    return root;
}
void update(int i,int l,int r,int u,int v,int x)
{
    if (l > v || r < u) {return;}
    if (l >= u && r <= v)
    {
        it[i] = ds(x,x,x,x);
        return;
    }
    int mid = (l + r) >> 1;
    update(i*2,l,mid,u,v,x);
    update(i*2+1,mid+1,r,u,v,x);
    it[i] = get(it[i * 2],it[i * 2 + 1]);
}
ds get(int i,int l,int r,int u,int v)
{
    if (l > v || r < u) {return ds(-oo,-oo,0,-oo);}
    if (l >= u && r <= v) {return it[i];}
    int mid = (l + r) >> 1;
    ds left = get(i * 2,l,mid,u,v);
    ds right = get(i * 2 +1,mid + 1,r,u,v);
    return get(left,right);
}
void solve()
{
    for (int i = 1; i <= n; i++) {update(1,1,n,i,i,a[i]);}
    int m;
    scanf("%d",&m);
    for (int i = 1; i <= m; i++)
    {
        int u,v;
        scanf("%d %d",&u,&v);
        ds res = get(1,1,n,u,v);
        printf("%d\n",res.res);
    }
}
int main()
{
    nhap();
    solve();
}
