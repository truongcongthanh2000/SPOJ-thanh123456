#include <bits/stdc++.h>
using namespace std;
const int N = 2e5 + 100;
struct line
{
    int a;
    long long b;
};
line it[N * 4];
int n,m;
void nhap()
{
    scanf("%d %d",&n,&m);
}
long long get(line d,int x)
{
    return 1ll * d.a * x + d.b;
}
void update(int i,int l,int r,int u,int v,line val)
{
    if (l > v || r < u) {return;}
    int mid = (l + r) >> 1;
    //cout<<i<<" "<<l<<" "<<r<<endl;
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
    if (l == r) {
        return get(it[i],u);
    }
    int mid = (l + r) >> 1;
    long long left = get(i << 1,l,mid,u);
    long long right = get(i << 1 | 1,mid + 1,r,u);
    return max(get(it[i],u),max(left,right));
}
void solve()
{
    for (int i = 1; i <= m; i++) {
        int s,e,v,d;
        scanf("%d %d %d %d",&s,&e,&v,&d);
        //cout<<s<<" "<<e<<" "<<v<<" "<<d<<endl;
        line a;
        a.a = d;
        a.b = 1ll * v - 1ll * s * d;
        //cout<<a.a<<" "<<a.b<<endl;
        update(1,1,n,s,e,a);
    }
    for (int i = 1; i <= n; i++) {
        cout<<get(1,1,n,i)<<'\n';
    }
}
int main()
{
    nhap();
    solve();
}
