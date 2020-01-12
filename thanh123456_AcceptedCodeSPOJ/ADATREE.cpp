#include <bits/stdc++.h>
using namespace std;
const int N = 3e5 + 1;
struct ds
{
    int x,y,l,r,res;
};
bool cmp1(ds a,ds b)
{
    return (a.x < b.x) || (a.x == b.x && a.y < b.y);
}
bool cmp2(ds a,ds b)
{
    return (a.x < b.x);
}
int n,q,it[N*4];
ds a[N],c[N];
void nhap()
{
    scanf("%d %d",&n,&q);
    for (int i=0; i<n; i++)
    {
        scanf("%d",&a[i].x);
        a[i].y = i;
    }
    for (int i=1; i<=q; i++)
    {
        scanf("%d %d %d",&c[i].l,&c[i].r,&c[i].x);
        c[i].y = i;
    }
    sort(a+1,a+1+n,cmp1);
    sort(c+1,c+1+q,cmp2);
}
void update(int i,int l,int r,int u,int v,int x)
{
    if (l > v || r < u) {return;}
    if (l >= u && r <= v)
    {
        it[i] = x;
        return;
    }
    int mid = (l + r) >> 1;
    update(i*2,l,mid,u,v,x);
    update(i*2+1,mid+1,r,u,v,x);
    it[i] = max(it[i*2],it[i*2+1]);
}
int get(int i,int l,int r,int u,int v)
{
    if (l > v || r < u) {return 0;}
    if (l >= u && r <= v) {return it[i];}
    int mid = (l + r) >> 1;
    int left = get(i*2,l,mid,u,v);
    int right = get(i*2+1,mid+1,r,u,v);
    return max(left,right);
}
bool cmp3(ds a,ds b)
{
    return a.y < b.y;
}
void solve()
{
    int start = 1;
    for (int l = 1; l <= q; )
    {
        int r = l;
        while (c[l].x == c[r].x && r <= q)
        {
            if (start == n + 1) {r++; continue;}
            while (start <= n && a[start].x <= c[l].x)
            {
                update(1,0,n-1,a[start].y,a[start].y,a[start].x);
                start++;
            }
            r++;
        }
        for (int i = l; i < r; i++)
        {
            c[i].res = get(1,0,n-1,c[i].l,c[i].r);
        }
        l = r;
    }
    sort(c+1,c+1+q,cmp3);
    for (int i=1; i<=q; i++) {printf("%d\n",c[i].res);}
}
int main()
{
    nhap();
    solve();
}
