#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
using namespace std;
const int module = 1e9;
const int di[] = {0,-1,0,1,0};
const int dj[] = {0,0,1,0,-1};
int n,m,dem,cau;
const int N=1e2+7;
char c[N][N];
int f[N][N];
vector <pair<int,int> >  a;
void nhap()
{
    scanf("%d%d\n",&m,&n);
    for (int i=1; i<=n; i++)
    {
        for (int j=1; j<=m; j++)
        {
            scanf("%c",&c[i][j]);
            if (c[i][j] == 'C')
            {
                a.pb(mp(i,j));
            }
        }
        scanf("\n");
    }
}
void BFS()
{
    queue <pair<int, int> > q;
    int x = a[0].first;
    int y = a[0].second;
    f[x][y] = 1 ;
    q.p(mp(x,y));
    int maxk = max(n,m);
    while (q.size()!=0)
    {
        pair<int, int> b = q.front();
        int x = b.first; int y = b.second;
        int kc = f[x][y];
        //cout<<x<<" "<<y<<endl;
        q.pop();
        for (int k=1; k<=4; k++)
        {
            for (int i=1; i<=maxk; i++)
            {
                int u = x + di[k] * i;
                int v = y + dj[k] * i;
                if (u>=1 && u<=n && v>=1 && v<=m && (c[u][v]!='*'))
                {
                    if (f[u][v] ==0 )
                    {
                        f[u][v] = kc + 1;
                        if (u==a[1].first && v == a[1].second)
                        {
                            cout<<kc-1<<endl;
                            return;
                        }
                        q.p(mp(u,v));
                    }
                }
                else {break;}
            }
        }
    }
}
void solve()
{
    BFS();
//    for (int i=1; i<=n; i++)
//    {
//        for (int j=1; j<=m; j++)
//        {
//            int maxk = 1e9;
//            for (int k=1; k<=4; k++)
//            {
//                maxk = min(maxk,f[i][j][k]);
//            }
//            if (maxk==module) {cout<<0<<" ";}
//            else {cout<<maxk<<" ";}
//        }
//        cout<<""<<endl;
//    }
//    cout<<""<<endl;
}
int main()
{
    nhap();
    solve();
    return 0;
}
