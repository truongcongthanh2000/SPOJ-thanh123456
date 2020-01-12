#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
using namespace std;
typedef pair<int,int> i2;
const int N = 5e5 + 1;
const int limit = 15000;
const int oo = 1e9 + 100;
int ReadInt()
{
    int res = 0;
    char c;
    bool kt = false;
    c = getchar();
    if (c == '-') {kt = true;}
    else {
        res = res * 10 + (c - '0');
    }
    for (c = getchar(); c >= '0' && c <= '9'; c = getchar()) {
        res = res * 10 + (c - '0');
    }
    return (kt ? (0 - res) : res);
}
int n,D;
void nhap()
{
    n = ReadInt();
    D = ReadInt();
}
void solve()
{
    int F[n + 1];
    for (int i = 1; i <= n; i++) {
        F[i] = 2e9 + 100;
    }
    F[0] = -1e9 + 10;
    for (int i = 1; i <= n; i++) {
        int x;
        x = ReadInt();
        for (int j = i; j >= 1; j--) {
            int pre = F[j - 1];
            if (x + D < pre) {
                continue;
            }
            if (x < pre) {
                F[j] = min(F[j],pre);
            }
            else {
                F[j] = min(F[j],max(pre,x - D));
            }
        }
    }
    for (int i = 1; i <= n; i++) {
        if (F[n - i + 1] < (int)2e9 + 100) {
            cout << n - i + 1;
            return;
        }
    }
}
int main()
{
    nhap();
    solve();
}
