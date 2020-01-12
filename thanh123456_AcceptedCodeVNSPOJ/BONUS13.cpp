#include <bits/stdc++.h>
using namespace std;
const int N = 1e2 + 10;
const int di[] = {-2,-1,1,2,2,1,-1,-2};
const int dj[] = {1,2,2,1,-1,-2,-2,-1};
int n,top1 = 0,top2 = 0;
struct ds
{
    int x,y;
};
ds a[N],b[N];
int c[N][N];
bool Hau[N][N],Tuong[N][N],Xe[N][N],Ma[N][N];
void nhap()
{
    scanf("%d",&n);
    for (int i = 1; i <= n; i++) {
        int x,y,d;
        scanf("%d %d %d",&x,&y,&d);
        c[x][y] = max(c[x][y],d);
    }
    for (int i = 1; i <= 8; i++) {
        for (int j = 1; j <= 8; j++) {
            if (c[i][j] == 0) {
                top1++;
                a[top1].x = i;
                a[top1].y = j;
            }
            else {
                top2++;
                b[top2].x = i;
                b[top2].y = j;
            }
        }
    }
}
bool Cheo(int x1,int y1,int x2,int y2)
{
    if (y1 - x1 == y2 - x2) {return true;}
    if (x1 + y1 == x2 + y2) {return true;}
    return false;
}
bool Ngang(int x1,int y1,int x2,int y2)
{
    if (x1 == x2) {return true;}
    else {return false;}
}
bool Cot(int x1,int y1,int x2,int y2)
{
    if (y1 == y2) {return true;}
    else {return false;}
}
bool ma(int x1,int y1,int x2,int y2)
{
    for (int i = 0; i < 8; i++) {
        if (x1 + di[i] == x2 && y1 + dj[i] == y2) {return true;}
    }
    return false;
}
void init()
{
    for (int i = 1; i <= top1; i++) {
        for (int j = 1; j <= top2; j++) {
            int u = a[i].x;
            int v = a[i].y;
            int x = b[j].x;
            int y = b[j].y;
            if (Cheo(u,v,x,y)) {
                Hau[j][i] = true;
                Tuong[j][i] = true;
            }
            if (Cot(u,v,x,y) || Ngang(u,v,x,y)) {
                Hau[j][i] = true;
                Xe[j][i] = true;
            }
            if (ma(u,v,x,y)) {
                Ma[j][i] = true;
            }
        }
    }
}
void solve()
{
    long long res = 0;
    res = 0;
    for (int i = 1; i <= top1; i++) {
        for (int j = 1; j <= top1; j++) {
            if (i == j) {continue;}
            for (int u = 1; u <= top1; u++) {
                if (u == i || u == j) {continue;}
                for (int v = 1; v <= top1; v++) {
                    if (v == i || v == j || v == u) {continue;}
                    long long gt = 0;
                    for (int k = 1; k <= top2; k++) {
                        if (Hau[k][i] || Tuong[k][j] || Xe[k][u] || Ma[k][v]) {
                            gt += 1ll * c[b[k].x][b[k].y];
                        }
                    }
                    if (gt > res) {res = gt;}
                }
            }
        }
    }
    cout<<res;
}
int main()
{
    nhap();
    init();
    solve();
}
