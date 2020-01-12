#include <bits/stdc++.h>
using namespace std;
const int module = 1e9 + 7;
int n,k;
struct node
{
    int res[51][51];
};
node a;
void nhap()
{
    scanf("%d %d",&n,&k);
    for (int i = 0; i < k - 1; i++) {
        a.res[i][i + 1] = 1;
    }
    for (int i = 0; i < k; i++) {
        a.res[k - 1][i] = 1;
    }
}
long long tinh(long long a,int b)
{
    long long res = 1;
    long long tam = a;
    for (; b; b = (b >> 1),a = (a * a) % module) {
        if (b & 1) {res = (res * a) % module;}
    }
    return res;
}
node nhan(const node &a,const node &b)
{
    node c;
    for (int i = 0; i < k; i++) {
        for (int j = 0; j < k; j++) {
            c.res[i][j] = 0;
        }
    }
    for (int i = 0; i < k; i++) {
        for (int j = 0; j < k; j++) {
            for (int x = 0; x < k; x++) {
                long long gt = (1ll * a.res[i][x] * b.res[x][j]) % (module - 1);
                c.res[i][j] = (c.res[i][j] + gt) % (module - 1);
            }
        }
    }
    return c;
}
node giai(node a,int n)
{
    node c;
    for (int i = 0; i < k; i++) {
        for (int j = 0; j < k; j++) {
            c.res[i][j] = 0;
        }
    }
    for (int i = 0; i < k; i++) {c.res[i][i] = 1;}
    for (; n; n = (n >> 1),a = nhan(a,a)) {
        if (n & 1) {
            c = nhan(c,a);
        }
    }
    return c;
}
void solve()
{
    //cout<<tinh(5,6)<<endl;
    node res = giai(a,n - k);
    long long kq = 1;
    for (int i = 0; i < k; i++) {
        long long x;
        scanf("%lld",&x);
        kq = (kq * tinh(x,res.res[k - 1][i])) % module;
    }
    cout<<kq;
}
int main()
{
    nhap();
    solve();
}
