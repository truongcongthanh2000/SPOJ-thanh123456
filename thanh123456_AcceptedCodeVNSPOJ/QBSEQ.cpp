#include <iostream>
#include <fstream>
#define Rep(i,a,b) for (int i=a; i<=b; i++)
const int maxn=1e3;
using namespace std;
int n,k;
int a[maxn];
int f[maxn][maxn];
void nhap()
{
    int i;
    scanf("%d%d",&n,&k);
    Rep(i,1,n)
    {
        scanf("%d",&a[i]);
        a[i]%=k;
        f[i][a[i]] = 1;
    }
}
void solve()
{
    int i,j;
    f[0][0] = 0;
    Rep(i,1,k) {f[0][i] = -1e5;}
    Rep(i,1,n)
    {
        Rep(j,0,k-1)
        {
            f[i][j] = max(f[i-1][j],f[i-1][(j-a[i]+k) %k]+1);
        }
    }
    cout<<f[n][0]<<endl;
}
int main()
{
    nhap();
    solve();
}
