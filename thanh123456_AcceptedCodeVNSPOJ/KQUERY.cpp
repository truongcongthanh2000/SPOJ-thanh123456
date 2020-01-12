#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
using namespace std;
const int N = 2e5;
const int oo = 1e9 + 100;
struct ds
{
    int x,l,r,pos;
};
bool cmp(ds a,ds b) {
    return a.x > b.x;
}
int n,m;
ds a[N],b[N];
int it[N * 4];
void nhap()
{
    scanf("%d",&n);
    for (int i = 1; i <= n; i++) {
        scanf("%d",&a[i].x);
        a[i].pos = i;
    }
    sort(a + 1,a + 1 + n,cmp);
    scanf("%d",&m);
    for (int i = 1; i <= m; i++) {
        scanf("%d %d %d",&b[i].l,&b[i].r,&b[i].x);
        b[i].pos = i;
    }
    sort(b + 1,b + 1 + m,cmp);
}
void update(int i,int l,int r,int u)
{
    if (l > u || r < u) {return;}
    it[i] += 1;
    if (l == r) {return;}
    int mid = (l + r) >> 1;
    update(i << 1,l,mid,u);
    update(i << 1 | 1,mid + 1,r,u);
}
int get(int i,int l,int r,int u,int v)
{
    if (l > v || r < u) {return 0;}
    if (l >= u && r <= v) {return it[i];}
    int mid = (l + r) >> 1;
    int left = get(i << 1,l,mid,u,v);
    int right = get(i << 1 | 1,mid + 1,r,u,v);
    return left + right;
}
void solve()
{
    int res[m + 1];
    int l = 1;
    for (int i = 1; i <= m; i++) {
        while (l <= n && b[i].x < a[l].x) {update(1,1,n,a[l++].pos);}
        res[b[i].pos] = get(1,1,n,b[i].l,b[i].r);
    }
    for (int i = 1; i <= m; i++) {
        cout<<res[i]<<'\n';
    }
}
int main()
{
    nhap();
    solve();
}
