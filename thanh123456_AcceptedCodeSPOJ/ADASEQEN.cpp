#include <bits/stdc++.h>
using namespace std;
const int N = 2001;
int n,m,a[N],f[N][N];
string s,t;
void nhap()
{
    scanf("%d %d\n",&n,&m);
    for (int i=0; i < 26; i++) {scanf("%d",&a[i]);}
    scanf("\n");
    getline(cin,s);
    getline(cin,t);
}
void qhd()
{
    for (int i=1; i<=n; i++)
    {
        for (int j = 1; j <= m; j++)
        {
            if (s[i-1] == t[j-1])
            {
                f[i][j] = f[i-1][j-1] + a[(int)s[i-1] - 'a'];
            }
            else {f[i][j] = max(f[i-1][j],f[i][j-1]);}
        }
    }
    cout<<f[n][m];
}
int main()
{
    nhap();
    qhd();
}
