#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
using namespace std;
typedef pair<int,int> i2;
const int N = 6e4;
const int oo = 1e9 + 100;
int n,it[N * 4 + 1];
void nhap()
{
    scanf("%d",&n);
}
void update(int i,int l,int r,int u)
{
    if (l > u || r < u) {return;}
    it[i]++;
    if (l == r) {return;}
    int mid = (l + r) >> 1;
    update(i << 1,l,mid,u);
    update(i << 1 | 1,mid + 1,r,u);
}
int get(int i,int l,int r,int u,int v)
{
    if (l > v || r < u) {return 0;}
    if (l >= u && r <= v) {
        return it[i];
    }
    int mid = (l + r) >> 1;
    int left = get(i << 1,l,mid,u,v);
    int right = get(i << 1 | 1,mid + 1,r,u,v);
    return left + right;
}
void solve()
{
    long long res = 0;
    for (int i = 1; i <= n; i++) {
        int x;
        scanf("%d",&x);
        res += get(1,1,N,x + 1,N);
        update(1,1,N,x);
    }
    cout<<res;
}
int main()
{
    nhap();
    solve();
}
