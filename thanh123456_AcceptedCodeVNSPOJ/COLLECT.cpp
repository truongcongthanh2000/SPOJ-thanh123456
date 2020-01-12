#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
using namespace std;
const int N = 1e5 + 100;
int k,z,s,m,z0,s0,m0,n,top = 0,a1[N],a2[N],a3[N],a4[N],a5[N],a6[N];
int f[10][10][10],q[N][6],d[10][10][10];
struct ds
{
    int x,y,z,kc;
};
ds res[N];
void nhap()
{
    scanf("%d",&k);
    scanf("%d %d %d %d %d %d",&z,&s,&m,&z0,&s0,&m0);
    int z1,s1,m1,z2,s2,m2;
    while (scanf("%d %d %d %d %d %d",&z1,&s1,&m1,&z2,&s2,&m2) != EOF)
    {
        n++;
        a1[n] = z1; a2[n] = s1; a3[n] = m1;
        a4[n] = z2; a5[n] = s2; a6[n] = m2;
        //cout<<a1[n]<<" "<<a2[n]<<" "<<a3[n]<<" "<<a4[n]<<" "<<a5[n]<<" "<<a6[n]<<endl;
    }
    //cout<<n<<endl;
}
void bfs()
{
    int l = 1;
    int r = 1;
    f[z][s][m] = 0;
    d[z][s][m] = 1;
    q[1][1] = z; q[1][2] = s; q[1][3] = m;
    while (l<=r)
    {
        int u = q[l][1];
        int v = q[l][2];
        int c = q[l][3];
        //cout<<u<<" "<<v<<" "<<c<<endl;
        l++;
        if (f[u][v][c] > k) {break;}
        if (u >=z0 && v>=s0 && c>=m0 && f[u][v][c] <= k)
        {
            top++;
            res[top].x = u;
            res[top].y = v;
            res[top].z = c;
            res[top].kc = f[u][v][c];
        }
        else
        {
            for (int i=1; i<=n; i++)
            {
                int uu = u - a1[i] + a4[i];
                int vv = v - a2[i] + a5[i];
                int cc = c - a3[i] + a6[i];
                //cout<<uu<<<" "<<vv<<" "<<c<<endl;
                if (u>=a1[i] && uu<=4 && v>=a2[i] && vv<=4 && cc<=4 && c>=a3[i] && d[uu][vv][cc]==0)
                {
                        f[uu][vv][cc] = f[u][v][c] + 1;
                        r++;
                        q[r][1] = uu; q[r][2] = vv; q[r][3] = cc;
                        d[uu][vv][cc] = 1;
                }
            }
        }
    }
}
bool cmp(ds a,ds b)
{
    if (a.x < b.x) {return true;}
    if (a.x == b.x && a.y < b.y) {return true;}
    if (a.x == b.x && a.y == b.y && a.z < b.z) {return true;}
    return false;
}
void xuat()
{
    if (top==0) {cout<<-1; return;
    }
    sort(res+1,res+1+top,cmp);
    printf("%d\n",top);
    for (int i=1; i<=top; i++)
        {
            printf("%d %d %d %d\n",res[i].x,res[i].y,res[i].z,res[i].kc);
        }
}
int main()
{
    nhap();
    bfs();
    xuat();
}
