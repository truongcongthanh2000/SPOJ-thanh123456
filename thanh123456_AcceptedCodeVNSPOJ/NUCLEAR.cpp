#include <bits/stdc++.h>
using namespace std;
const int N = 3e5;
struct ds
{
    long long r;
    int vt;
};
struct thu
{
    int l,r,vt,res;
};
long long kc(int x1,int y1,int x2,int y2)
{
    long long x = 1ll * (x2-x1) * (x2-x1);
    long long y = 1ll * (y2-y1) * (y2-y1);
    return x + y;
}
bool cmp(ds a,ds b)
{
    return (a.r < b.r) || ((a.r==b.r) && (a.vt < b.vt));
}
bool ss(thu a,thu b)
{
    return (a.l < b.l) || ((a.l == b.l) && (a.r < b.r));
}
int n,x[N],y[N],q,pos[N],it[N*4];
ds a[N],b[N];
thu c[N];
int tknp(long long x,ds *a)
{
    int l = 1;
    int rr = n;
    int res = 0;
    while (l<=rr)
    {
        int mid = (l+rr) / 2;
        if (a[mid].r <= x) {res = mid; l = mid+1;}
        else {rr = mid-1;}
    }
    return res;
}
void nhap()
{
    scanf("%d",&n);
    for (int i=1; i<=n; i++) {scanf("%d %d",&x[i],&y[i]);}
    int ax,bx,ay,by;
    scanf("%d %d %d %d %d",&ax,&bx,&ay,&by,&q);
    for (int i=1; i<=n; i++)
    {
        a[i].r = kc(ax,bx,x[i],y[i]);
        b[i].r = kc(ay,by,x[i],y[i]);
        a[i].vt = b[i].vt = i;
    }
    sort(a+1,a+1+n,cmp);
//    for (int i=1; i<=n; i++)
//    {
//        cout<<a[i].r<<" "<<a[i].vt<<endl;
//    }
//    cout<<endl;
    sort(b+1,b+1+n,cmp);
    for (int i=1; i<=n; i++) {pos[b[i].vt] = i;}
//    for (int i=1; i<=n; i++) {cout<<pos[a[i].vt]<<" ";}
//    cout<<endl;
//    for (int i=1; i<=n; i++)
//    {
//        cout<<b[i].r<<" "<<b[i].vt<<endl;
//    }
    for (int i=1; i<=q; i++)
    {
        long long x,y;
        scanf("%lld %lld",&x,&y);
        x*=x; y*=y;
        //cout<<x<<" "<<y<<" ";
        c[i].l = tknp(x,a);
        c[i].r = tknp(y,b);
        c[i].vt = i;
        //cout<<c[i].l<<" "<<c[i].r<<endl;
    }
    sort(c+1,c+1+q,ss);
}
void update(int i,int l,int r,int u,int v)
{
    if (l > v || r < u) {return;}
    if (l>=u && r<=v)
    {
        it[i] = max(1,it[i]+1);
        return;
    }
    int mid = (l+r) / 2;
    update(i*2,l,mid,u,v);
    update(i*2+1,mid+1,r,u,v);
    it[i] = it[i*2] + it[i*2+1];
}
int get(int i,int l,int r,int u,int v)
{
    if (l > v || r < u) {return 0;}
    if (l>=u && r<=v) {return it[i];}
    int mid = (l+r) / 2;
    int left = get(i*2,l,mid,u,v);
    int right = get(i*2+1,mid+1,r,u,v);
    return (left + right);
}
bool tt(thu a,thu b)
{
    return a.vt < b.vt;
}
void solve()
{
    for (int i=1; i<=q; i++)
    {
        //cout<<c[i].l<<" "<<c[i].r<<" ";
        for (int j = c[i-1].l + 1; j<=c[i].l; j++)
        {
            //cout<<pos[a[j].vt]<<" ";
            update(1,1,n,pos[a[j].vt],pos[a[j].vt]);
        }
        //cout<<it[1]<<" ";
        int res = c[i].l + c[i].r - get(1,1,n,1,c[i].r);
        c[i].res = res;
        //cout<<c[i].res<<endl;
    }
    sort(c+1,c+1+q,tt);
    for (int i=1; i<=q; i++)
    {
        //cout<<c[i].vt<<" "<<c[i].res<<endl;
        printf("%d\n",c[i].res);
    }
}
int main()
{
    nhap();
    solve();
}
