#include <bits/stdc++.h>
using namespace std;
const int di[] = {-1,-1,1,1};
const int dj[] = {-1,1,1,-1};
const int N = 1234;
int n,m,s1,t1,s2,t2,d[N][N],kt[N][N];
void nhap()
{
    scanf("%d%d%d%d%d%d",&n,&m,&s1,&t1,&s2,&t2);
    for (int i=1; i<=m; i++)
    {
        int x,y;
        scanf("%d %d ",&x,&y);
        kt[x][y] = 1;
    }
}
void solve()
{
    queue <pair<int, int> > q;
    q.push(make_pair(s1,t1));
    d[s1][t1] = 1;
    while (q.size() > 0)
    {
        pair<int, int> b = q.front();
        q.pop();
        int u = b.first;
        int v = b.second;
        for (int i=0; i<4; i++)
        {
            for (int k=1; k<=n; k++)
            {
                int x = u + di[i] * k;
                int y = v + dj[i] * k;
                //if (u==6 && v==3) {cout<<u<<v<<" "<<x<<" "<<y<<" "<<d[x][y]<<endl;}
                if ((kt[x][y]) || (x>n) || (x<1) || (y>n) || (y<1)) {break;}
                //cout<<u<<" "<<v<<" "<<x<<" "<<y<<endl;
                if (d[x][y]==0)
                {
                    d[x][y] = d[u][v]  + 1;
                    q.push(make_pair(x,y));
                }
            }
        }
    }
    //cout<<d[5][2]<<endl;
    printf("%d",d[s2][t2] ? d[s2][t2]-1 : -1);
}
int main()
{
    nhap();
    solve();
}
