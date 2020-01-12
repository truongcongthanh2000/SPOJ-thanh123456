#include <bits/stdc++.h>
using namespace std;
const int N = 505;
const long double sodu = 1e-10;
struct ds
{
    int x,y;
    long double z;
};
long double a[N][N];
int n,m,d,top,kt[N][N];
ds A[N * N],res[N * N];
void nhap()
{
    scanf("%d %d %d",&n,&m,&d);
    for (int i=1; i<=n; i++)
    {
        for (int j = 1; j<=m; j++)
        {
            int x;
            scanf("%d",&x);
            a[i][j] = log10l(x);
            a[i][j] += a[i-1][j] + a[i][j-1] - a[i-1][j-1];
        }
    }
}
long double get(int l,int r,int u,int v)
{
    return a[u][v] - a[l-1][v] - a[u][r-1] + a[l - 1][r - 1];
}
bool cmp(ds a,ds b)
{
//    if (a.z + sodu != b.z)
//    {
//        return a.z > b.z + sodu;
//    }
//    if (a.x != b.x) {return a.x < b.x;}
//    if (a.y != b.y) {return a.y < b.y;}
//    return a.y == b.y;
    if (a.z - b.z > sodu) {return true;}
    if (abs(a.z - b.z) < sodu && a.x < b.x) {return true;}
    if (abs(a.z - b.z) < sodu && a.x == b.x && a.y < b.y) {return true;}
    return false;
}
void taomang()
{
    top = 0;
    for (int i=1; i<=n - d + 1; i++)
    {
        for (int j = 1; j<=m - d + 1; j++)
        {
            top++;
            A[top].x = i;
            A[top].y = j;
            A[top].z = get(i,j,i + d - 1,j + d - 1);
        }
    }
    sort(A+1,A+1+top,cmp);
}
void solve()
{
    int sl = 0;
    for (int i = 1; i <= top; i++)
    {
        int l = A[i].x;
        int r = A[i].y;
        int u = l + d - 1;
        int v = r + d - 1;
        if (kt[l][r] == 1) {continue;}
        if (kt[u][v] == 1) {continue;}
        if (kt[l][v] == 1) {continue;}
        if (kt[u][r] == 1) {continue;}
        sl++;
        res[sl].x = l;
        res[sl].y = r;
        for (int j = l; j <= u; j++)
        {
            for (int k = r; k <= v; k++)
            {
                kt[j][k] = 1;
            }
        }
    }
    printf("%d\n",sl);
    for (int i = 1; i <= sl; i++) {printf("%d %d\n",res[i].x,res[i].y); }
}
int main()
{
    nhap();
    taomang();
    solve();
}
