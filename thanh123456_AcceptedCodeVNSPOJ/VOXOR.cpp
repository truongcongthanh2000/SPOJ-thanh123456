#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
using namespace std;
const int N = 1e5 + 5;
const int BIT = 31;
int n,q;
int f[N * BIT * 2],t[N * BIT][2],sl = 0;
void nhap()
{
    scanf("%d %d\n",&n,&q);
}
int get_bit(int x,int i)
{
    return (x >> i) & 1;
}
void add(int x)
{
    int root = 0;
    for (int i = BIT - 1; i >= 0; i--)
    {
        int tam = get_bit(x,i);
        if (t[root][tam] == 0) {t[root][tam] = ++sl;}
        root = t[root][tam];
        f[root]++;
    }
}
int get(int bit,int k)
{
    int res = 0;
    int root = 0;
    for (int i = BIT - 1; i >= 0; i--)
    {
        int tam = get_bit(bit,i);
        int u = t[root][1 - tam];
        if (u !=0 && f[u] >= k) {
            res = res * 2 + 1;
            root = u;
        }
        else
        {
            root = t[root][tam];
            k -= f[u];
            res = res * 2;
        }
    }
    return res;
}
void solve()
{
    int res = 0;
    ios_base::sync_with_stdio(1);
    cin.tie(NULL);
    cout.tie(NULL);
    for (int i = 1; i <= n; i++) {
        int x;
        scanf("%d",&x);
        add(x);
    }
    scanf("\n");
    int root = 0;
    for (int i = 1; i <= q; i++)
    {
        string s;
        cin>>s;
        if (s[0] == 'F')
        {
            int x;
            cin>>x;
            cout<<get(root,x)<<'\n';
        }
        else {
            int x;
            cin>>x;
            root = root ^ x;
        }
    }
}
int main()
{
    nhap();
    solve();
}
