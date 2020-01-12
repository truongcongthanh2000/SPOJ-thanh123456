#include <bits/stdc++.h>
using namespace std;
const int N = 1e5 + 100;
struct node
{
    double x,y;
}a[N];
node stk[N];
double res;
double sqr(double x)
{
    return x * x;
}
double KC(node a,node b)
{
    double x = a.x - b.x;
    double y = a.y - b.y;
    return sqr(x) + sqr(y);
}
int n,T;
bool cmp(node a,node b)
{
    return (a.y < b.y) || (a.y == b.y && a.x < b.x);;
}
bool ss(node a,node b)
{
    return (a.x < b.x) || (a.x == b.x && a.y < b.y);
}
void solve(int l,int r)
{
    //cout<<l<<" "<<r<<endl;
    if (l == r) {return;}
    int mid = (l + r) >> 1;
    solve(l,mid);
    solve(mid + 1,r);
//    cout<<"CC"<<endl;
//    cout<<l<<" "<<r<<endl;
    int top = 0;
    for (int i = l; i <= r; i++) {
        if (sqr(a[i].x - a[mid].x) < res) {
            stk[++top] = a[i];
            //cout<<stk[top].x<<" "<<stk[top].y<<" ";
        }
    }
    //cout<<endl;
    //cout<<top<<endl;
    sort(stk + 1,stk + 1 + top,cmp);
    for (int i = 1; i <= top; i++) {
        for (int j = i + 1; j <= top && sqr(stk[i].y - stk[j].y) < res; j++) {
            //cout<<stk[i].x<<" "<<stk[i].y<<" "<<stk[j].x<<" "<<stk[j].y<<endl;
            res = min(res,KC(stk[i],stk[j]));
        }
    }
    //cout<<res<<endl;
}
void nhap()
{
    scanf("%d",&n);
    for (int i = 0; i < n; i++) {
        scanf("%lf %lf",&a[i].x,&a[i].y);
    }
    sort(a,a + n,ss);
}
void solve()
{
    res = 1e18;
    solve(0,n  - 1);
    double kq = 1.0 * res;
    cout<<fixed<<setprecision(3)<<sqrt(kq);
    //printf("%.3lf",sqrt(kq));
}
int main()
{
    nhap();
    solve();
}
