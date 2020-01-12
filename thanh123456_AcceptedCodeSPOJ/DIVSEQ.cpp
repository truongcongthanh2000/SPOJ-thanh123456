#include <bits/stdc++.h>
#define pb push_back
#define Rep(i,a,b) for (int i=a; i<=b; i++)
using namespace std;
const int module = 1e9+9;
int n,k;
void nhap()
{
    scanf("%d%d",&n,&k);
}
const int N = 1e3+7;
vector <int> a(N);
void pt(int x)
{
    int i;
    a.clear();
    int y=(int)sqrt(x);
    if (y == sqrt(x)) {a.pb(y); y--;}
    Rep(i,1,y)
    {
        if (x % i ==0)
        {
            a.pb(i);
            a.pb(x / i);
        }
    }
}
void solve()
{
    int i,j,u;
    int f[N],b[N];
//    cout<<n<<" "<<k<<endl;
    Rep(i,1,k) {f[i] = 1;}
    Rep(i,1,k) {b[i] = 1;}
    Rep(i,2,n)
    {
        Rep(j,1,k) {f[j] = 0;}
        Rep(j,1,k)
        {
            pt(j);
            for (u=0; u < a.size(); u++)
            {
                f[j] = (f[j] + b[a[u]]) % module;
            }
            u = j+j;
            while (u<=k)
            {
                f[j] = (f[j] + b[u]) % module;
                u = u+j;
            }
        }
        Rep(j,1,k)
        {
            b[j] = f[j];
        }
    }
//    pt(25);
//    for (u=0; u < a.size(); u++)
//    {
//        cout<<a[u]<<endl;
//    }
    int res=0;
    Rep(i,1,k)
    {
        //cout<<f[i]<<endl;
        res = (res + f[i]) % module;
    }
    cout<<res<<endl;
}
int main()
{
    nhap();
    solve();
}
