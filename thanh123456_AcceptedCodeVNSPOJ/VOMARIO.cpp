#include <bits/stdc++.h>
using namespace std;
const int N = 1e5 + 100;
const long long oo = 1e18;
struct line
{
    long long a,b;
    line(){};
    line (long long x,long long y)
    {
        a = x;
        b = y;
    }
}it[N * 4];
vector <int> B;
struct node
{
    int x,w;
    long long e;
}a[N];
int n;
void nhap()
{
    scanf("%d",&n);
    B.push_back(0);
    for (int i = 1; i <= n; i++) {
        scanf("%d %d %lld",&a[i].x,&a[i].w,&a[i].e);
        B.push_back(a[i].x);
    }
    sort(B.begin(),B.end());
    B.resize(unique(B.begin(),B.end()) - B.begin());
}
long long get(line val,int x)
{
    return val.a * B[x] + val.b;
}
void update(int i,int l,int r,int u,int v,line val)
{
    if (l > v || r < u) {return;}
    int mid = (l + r) >> 1;
    if (l >= u && r <= v) {
        if (get(it[i],l) >= get(val,l) && get(it[i],r) >= get(val,r)) {return;}
        if (get(it[i],l) <= get(val,l) && get(it[i],r) <= get(val,r)) {
            it[i] = val;
            return;
        }
        if (get(it[i],l) >= get(val,l) && get(it[i],mid) >= get(val,mid)) {
            update(i << 1 | 1,mid + 1,r,u,v,val);
            return;
        }
        if (get(it[i],l) <= get(val,l) && get(it[i],mid) <= get(val,mid)) {
            update(i << 1 | 1,mid + 1,r,u,v,it[i]);
            it[i] = val;
            return;
        }
        if (get(it[i],mid + 1) >= get(val,mid + 1) && get(it[i],r) >= get(val,r)) {
            update(i << 1,l,mid,u,v,val);
            return;
        }
        if (get(it[i],mid + 1) <= get(val,mid + 1) && get(it[i],r) <= get(val,r)) {
            update(i << 1,l,mid,u,v,it[i]);
            it[i] = val;
            return;
        }
    }
    update(i << 1,l,mid,u,v,val);
    update(i << 1 | 1,mid + 1,r,u,v,val);
}
long long get(int i,int l,int r,int u)
{
    if (l > u || r < u) {return 0;}
    if (l >= u && r <= u) {return get(it[i],u);}
    int mid = (l + r) >> 1;
    long long left = get(i << 1,l,mid,u);
    long long right = get(i << 1 | 1,mid + 1,r,u);
    return max(max(left,right),get(it[i],u));
}
void solve()
{
    int top = B.size() - 1;
    update(1,0,top,0,top,line(0,0));
    long long res = 0;
    for (int i = 1; i <= n; i++) {
        int mid = lower_bound(B.begin(),B.end(),a[i].x) - B.begin();
        long long gt = get(1,0,top,mid) + a[i].e;
        res = max(res,gt);
        int l,r;
        if (a[i].w == 0) {
            l = 0;
            r = top;
        }
        else {
            l = lower_bound(B.begin(),B.end(),a[i].x - gt / a[i].w) - B.begin();
            r = upper_bound(B.begin(),B.end(),a[i].x + gt / a[i].w) - B.begin() - 1;
        }
        update(1,0,top,mid,r,line(0 * 1ll - 1ll * a[i].w,gt + 1ll * a[i].x * a[i].w));
        update(1,0,top,l,mid,line(1ll * a[i].w,gt - 1ll * a[i].x * a[i].w));
    }
    cout<<res;
}
int main()
{
    nhap();
    solve();
}
