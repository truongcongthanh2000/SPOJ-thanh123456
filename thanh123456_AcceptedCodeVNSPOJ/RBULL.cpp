#include <bits/stdc++.h>
using namespace std;
const int N = 5e3 + 100;
int n,m,a[N][N],b[N][N],n1,n2,m1,m2;
int f1[N][N],f2[N][N],f3[N][N],f4[N][N],f[N][N];
void nhap()
{
    scanf("%d %d\n",&n,&m);
    for (int i = 1; i <= n; i++) {
        char s[N];
        scanf("%s\n",&s);
        for (int j = 1; j <= m; j++) {
            if (s[j - 1] == '*') {a[i][j] = 1;}
            else {a[i][j] = 0;}
            b[i - j + m][i + j] = a[i][j];
        }
    }
    n1 = 1 - m + m;
    n2 = n - 1 + m;
    m1 = 2;
    m2 = n + m;
    for (int i = n1; i <= n2; i++) {
        for (int j = m1; j <= m2; j++) {
            f[i][j] = f[i - 1][j] + f[i][j - 1] - f[i - 1][j - 1] + b[i][j];
        }
    }
}
int get(int l,int r,int u,int v)
{
    return f[u][v] - f[l - 1][v] - f[u][r - 1] + f[l - 1][r - 1];
}
int check(int x,int y,int u,int v)
{
    return (a[x][y] & a[u][v]);
}
void qhd()
{
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= m; j++) {
            if (check(i,j,i - 1,j) || check(i,j,i,j - 1)) {f1[i][j] = 1;}
            else {f1[i][j] = 1 + min(f1[i - 1][j],f1[i][j - 1]);}
        }
        for (int j = m; j >= 1; j--) {
            if (check(i,j,i,j + 1) || check(i,j,i - 1,j)) {f2[i][j] = 1;}
            else {f2[i][j] = 1 + min(f2[i - 1][j],f2[i][j + 1]);}
        }
    }
    for (int i = n; i >= 1; i--) {
        for (int j = 1; j <= m; j++) {
            if (check(i,j,i,j - 1) || check(i,j,i + 1,j)) {f4[i][j] = 1;}
            else {f4[i][j] = 1 + min(f4[i][j - 1],f4[i + 1][j]);}
        }
        for (int j = m; j >= 1; j--) {
            if (check(i,j,i,j + 1) || check(i,j,i + 1,j)) {f3[i][j] = 1;}
            else {f3[i][j] = 1 + min(f3[i][j + 1],f3[i + 1][j]);}
        }
    }
}
void solve()
{
    int res = 0;
    int x_ = 1;
    int y_ = 1;
    int R = 0;
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= m; j++) {
            int r = min(min(min(f1[i][j],f2[i][j]),f3[i][j]),f4[i][j]);
            r--;
            //cout<<i<<" "<<j<<" "<<r<<endl;
            int x = i - j + m;
            int y = i + j;
            int l = x - r;
            int rr = y - r;
            x += r;
            y += r;
            int sl = get(l,rr,x,y);
            if (sl > res) {
                res = sl;
                x_ = i;
                y_ = j;
                R = r;
            }
        }
    }
    cout<<res<<" "<<x_<<" "<<y_<<" "<<R;
}
int main()
{
    nhap();
    qhd();
    solve();
}
