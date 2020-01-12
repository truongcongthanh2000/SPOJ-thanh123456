#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
using namespace std;
const int N = 1e3+7;
int test,n,m,k;
typedef struct danhsach
{
    int x,y;
}ds;
ds a[N*N];
int it[N*8],pos[N*8];
bool cmp(ds a,ds b)
{
    return (a.x < b.x) || ((a.x==b.x) && (a.y < b.y));
}
void nhap()
{
    scanf("%d",&test);
}
void nhapmang()
{
    scanf("%d%d%d",&n,&m,&k);
    for (int i=1; i<=k; i++)
    {
        scanf("%d%d",&a[i].x,&a[i].y);
    }
    sort(a+1,a+1+k,cmp);
//    for (int i=1; i<=k; i++)
//    {
//        cout<<a[i].x<<" "<<a[i].y<<endl;
//    }
}
void build(int i,int l,int r)
{
    if (l==r)
    {
        it[i]=0;
        pos[l]=i;
        return;
    }
    int mid = (l+r) / 2;
    build (i*2,l,mid);
    build(i*2+1,mid+1,r);
    it[i] = 0 ;
}
void update(int x)
{
    int vt = pos[x];
    while (vt>0)
    {
        it[vt]++;
        vt = vt / 2;
    }
}
int get(int i,int l,int r,int u,int v)
{
    if ((l>v) || (r<u)) {return 0;}
    if (l>=u && r<=v) {return it[i];}
    int mid = (l+r) / 2;
    int left = get(i*2,l,mid,u,v);
    int right = get(i*2+1,mid+1,r,u,v);
    return left+right;
}
void xuli()
{
    long long res=0;
    for (int i=1; i<=k; i++)
    {
        res+=get(1,1,m,a[i].y+1,m);
        update(a[i].y);
    }
    printf("%lld\n",res);
}
void solve()
{
    for (int t=1; t<=test; t++)
    {
        nhapmang();
        build(1,1,m);
        printf("Test case %d: ",t);
        //printf("%s%d%s","Test case ",t,": ");
        xuli();
    }
}
int main()
{
    nhap();
    solve();
    return 0;
}
