#include <bits/stdc++.h>
using namespace std;
const int gh = 400;
const int N = 5;
int n;
bool kt[gh + 1][gh + 1][N];
int f[N][N];
int tam[N],stk[N];
void nhap()
{
    scanf("%d",&n);
    for (int i = 1; i <= n; i++) {
        int x,y,loai;
        scanf("%d %d %d",&x,&y,&loai);
        x+=200;
        y+=200;
        kt[x][y][loai] = true;
    }
}
void solve()
{
    int res = 0;
    for (int x1 = 0; x1 <= gh; x1++) {
        for (int x2 = x1 + 1; x2 <= gh; x2++) {
            for (int i = 1; i <= 4; i++) {
                for (int j = 1; j <= 4; j++) {
                    f[i][j] = 0;
                }
            }
            for (int y1 = 0; y1 <= gh; y1++) {
                int top = 0;
                for (int j = 1; j <= 4; j++) {
                    if (kt[x1][y1][j]) {
                        stk[top++] = j;
                    }
                    if (kt[x2][y1][j]) {
                        stk[top++] = j;
                    }
                }
                if (top <= 1) {continue;}
                if (stk[0] == stk[1]) {continue;}
                //cout<<x1<<" "<<x2<<" "<<y1<<" "<<stk[0]<<" "<<stk[1]<<endl;
                int len = 0;
                //cout<<"CC"<<endl;
                for (int j = 1; j <= 4; j++) {
                    if (j != stk[0] && j != stk[1]) {
                        tam[len++] = j;
                    }
                }
                res += f[tam[0]][tam[1]];
                res += f[tam[1]][tam[0]];
                f[stk[0]][stk[1]]++;
            }
        }
    }
    cout<<res;
}
int main()
{
    nhap();
    solve();
}
