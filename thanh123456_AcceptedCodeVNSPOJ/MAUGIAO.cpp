#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
using namespace std;
const int N = 20;
const int maxn = 1e7;
const int oo = 1e9 + 100;
int a[N][N],n;
int dp[1 << N];
long long sl[1 << N];
void nhap()
{
    scanf("%d",&n);
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            scanf("%d",&a[i][j]);
        }
    }
}
int get_bit(int x,int i)
{
    return (x >> i) & 1;
}
int tat_bit(int x,int i) {
    return x ^ (1 << i);
}
void get(int x)
{
    int sll = 0;
    for (int i = 0; i < n; i++) {
        int bit = get_bit(x,i);
        if (bit & 1) {sll++;}
    }
    for (int i = 0; i < n; i++) {
        int bit = get_bit(x,i);
        if (bit & 1) {
            int pre = tat_bit(x,i);
            if (dp[x] < dp[pre] + a[sll - 1][i]) {
                dp[x] = dp[pre] + a[sll - 1][i];
                sl[x] = sl[pre];
            }
            else {
                if (dp[x] == dp[pre] + a[sll - 1][i]) {
                    sl[x] += sl[pre];
                }
            }
        }
    }
}
void solve()
{
    dp[0] = 0;
    sl[0] = 1;
    for (int i = 1; i < 1 << n; i++) {
        get(i);
    }
    int mask = (1 << n) - 1;
    cout<<dp[mask]<<" "<<sl[mask];
}
int main()
{
    nhap();
    solve();
}
