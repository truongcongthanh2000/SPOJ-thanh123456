#include <bits/stdc++.h>
using namespace std;
const int N = 2e5 + 5;
int n,m,a[N],test,b[N];
vector <int> B[N];
int bit[N + 100];
void nhap()
{
    scanf("%d",&test);
}
void nhapdulieu()
{
    scanf("%d %d",&n,&m);
    for (int i = 1; i <= n; i++) {
        scanf("%d",&a[i]);
    }
    for (int i = 0; i < m; i++) {
        B[i].clear();
    }
    for (int i = 1; i <= n; i++) {
        scanf("%d",&b[i]);
        B[b[i]].push_back(i);
    }
    for (int i = 0; i <= n; i++) {
        bit[i] = 0;
    }
}
void update(int x,int gt)
{
    for (x; x <= n; x+=x & (-x)) {bit[x] = max(bit[x],gt);}
}
int get(int x)
{
    int res = 0;
    for (x; x > 0; x-=x & (-x)) {res = max(res,bit[x]);}
    return res;
}
void solve()
{
    int res = 0;
    for (int i = 1; i <= n; i++) {
        int Sz = B[a[i]].size();
        for (int j = Sz - 1; j >= 0; j--) {
            int u = B[a[i]][j];
            int gt = get(u - 1);
            res = max(res,gt + 1);
            update(u,gt + 1);
        }
    }
    cout<<(n - res) * 2;
}
void Solve()
{
    for (int i = 1; i <= test; i++,cout<<'\n') {
        nhapdulieu();
        solve();
    }
}
int main()
{
    nhap();
    Solve();
}
