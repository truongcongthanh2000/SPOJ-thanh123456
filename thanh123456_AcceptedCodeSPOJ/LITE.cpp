#include <iostream>
#include <fstream>
#define Rep(i,a,b) for (int i=a; i<=b; i++)
const int maxn=5e5;
struct danhsach
{
    int res,lazy;
};
typedef danhsach ds;
ds it[maxn];
int n,m;
using namespace std;
void rs(int i,int l,int r)
{
    if (it[i].lazy==0) {return;}
    it[i].res=(r-l+1)-it[i].res;
    it[i].lazy=0;
    if (l==r) {return;}
    it[i*2].lazy=(it[i*2].lazy+1)%2;
    it[i*2+1].lazy=(it[i*2+1].lazy+1)%2;
}
void UpDate(int i,int l,int r,int u,int v)
{
    int mid;
    rs(i,l,r);
    if ((l>v) || (r<u)) {return;}
    if ((l>=u) && (r<=v))
    {
        it[i].lazy=(it[i].lazy+1)%2;
        it[i].res=(r-l+1)-it[i].res;
        it[i*2].lazy=(it[i*2].lazy+1)%2;
        it[i*2+1].lazy=(it[i*2+1].lazy+1)%2;
        it[i].lazy=0;
        return;
    }
    mid=(l+r)/2;
    UpDate(i*2,l,mid,u,v);
    UpDate(i*2+1,mid+1,r,u,v);
    it[i].res=(it[i*2].res+it[i*2+1].res);
}
int Get(int i,int l,int r,int u,int v)
{
    int left,right,mid;
    rs(i,l,r);
    if ((l>v) || (r<u)) {return 0;}
    if ((l>=u) && (r<=v)) {return it[i].res;}
    mid=(l+r)/2;
    left=Get(i*2,l,mid,u,v);
    right=Get(i*2+1,mid+1,r,u,v);
    return (left+right);
}
void solve()
{
    int i,x,y,c,res;
    Rep(i,1,m)
    {
        scanf("%d%d%d",&c,&x,&y);
        if (c==0) {UpDate(1,1,n,x,y);}
        else {
                res=Get(1,1,n,x,y);
                cout<<res<<endl;
        }
    }
}
int main()
{
    scanf("%d%d",&n,&m);
    solve();
}
