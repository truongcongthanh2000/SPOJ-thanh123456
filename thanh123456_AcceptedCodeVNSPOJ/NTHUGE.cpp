#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
using namespace std;
const int N = 1e5;
int n,top,top1,pos;
long long s1,s2,s,t;
typedef struct ds
{
    long long x,y;
};
ds a[N];
long long w[N],v[N],stk1[N],stk2[N],it[N*4];
void nhap()
{
    scanf("%d%lld%lld",&n,&s,&t);
    for (int i=1; i<=n; i++)
    {
        scanf("%lld%lld",&w[i],&v[i]);
    }
}
void xuli()
{
    if (s1!=0)
    {
        top++;
        stk1[top] = s1;
        stk2[top] = s2;
    }
}
void vet(int i)
{
    for (int j=0; j<2; j++)
    {
        if (j==1)
        {
            s1+=w[i];
            s2+=v[i];
            if (i==pos)
            {
                xuli();
            }
            else vet(i+1);
            s1-=w[i];
            s2-=v[i];
        }
        else
        {
            if (i==pos) {xuli();}
            else vet(i+1);
        }
    }
}
bool cmp(ds a,ds b)
{
    return a.x < b.x;
}
void taomang()
{
    s1 = 0;
    s2 = 0;
    top = 0;
    pos = n/2;
    vet(1);
    top1 = top;
    for (int i=1; i<=top1; i++)
    {
        a[i].x = stk1[i];
        a[i].y = stk2[i];
    }
    top = 0;
    s1 = 0;
    s2 = 0;
    pos = n;
    vet((n/2)+1);
    sort(a+1,a+1+top1,cmp);
}
int tknp1(long long x)
{
    int l = 1;
    int r = top1;
    int res = 0;
    while (l<=r)
    {
        int mid = (l+r) / 2;
        if (a[mid].x>=x) {res=mid; r=mid-1;}
        else {l=mid+1;}
    }
    return res;
}
int tknp2(long long x)
{
    int l = 1;
    int r = top1;
    int res = 0;
    while (l<=r)
    {
        int mid = (l+r) / 2;
        if (a[mid].x>x) {r=mid-1;}
        else {res=mid;l=mid+1;}
    }
    return res;
}
void build(int i,int l,int r)
{
    if (l==r)
    {
        it[i] = a[l].y;
        return;
    }
    int mid = (l+r) / 2;
    build(i*2,l,mid);
    build(i*2+1,mid+1,r);
    it[i] = max(it[i*2],it[i*2+1]);
}
long long get(int i,int l,int r,int u,int v)
{
    if ((l>v) || (r<u)) {return 0;}
    if (l>=u && r<=v) {return it[i];}
    int mid = (l+r) / 2;
    long long left =get(i*2,l,mid,u,v);
    long long right = get(i*2+1,mid+1,r,u,v);
    return max(left,right);
}
void solve()
{
    long long res = 0;
    for (int i=0; i<=top; i++)
    {
        if (stk1[i]<=t  && stk1[i]>=s) {res = max(res,stk2[i]);}
        int l = tknp1(s-stk1[i]);
        int r = tknp2(t-stk1[i]);
        if ((l==0) || (r==0)) {continue;}
        res = max(res,stk2[i]+get(1,1,top1,l,r));
    }
    printf("%lld",res);
}
int main()
{
    nhap();
    taomang();
    build(1,1,top1);
    solve();
}
