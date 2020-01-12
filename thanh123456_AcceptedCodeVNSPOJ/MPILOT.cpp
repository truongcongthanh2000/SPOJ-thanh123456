#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
using namespace std;
const int N = 1e6 + 100;
int n,m;
void nhap()
{
    scanf("%d",&n);
}
void solve()
{
    int res = 0;
    priority_queue <int, vector<int> > q;
    for (int i = 1; i <= n; i++)
    {
        int x,y;
        scanf("%d %d",&x,&y);
        res+=x;
        q.push(x - y);
        if ((i % 2) == 1)
        {
            int top = q.top();
            res-=top;
            q.pop();
        }
    }
    cout<<res;
}
int main()
{
    nhap();
    solve();
}
