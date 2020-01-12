#include <bits/stdc++.h>
using namespace std;
const int N = 4;
const int NN = 12345;
int n,a[N][NN],f[NN][1 << N],top = 0,stk[1 << N];
void nhap()
{
    scanf("%d",&n);
    int res = -123456789;
    for (int i=0; i<4; i++)
    {
        for (int j = 0; j < n; j++)
        {
            scanf("%d",&a[i][j]);
            res = max(res,a[i][j]);
        }
    }
    if (res <= 0) {
    	cout << res;
    	exit(0);
    }
}
int get_bit(int x,int i)
{
    return (x >> i) & 1;
}
bool check(int x)
{
    for (int i=0; i<N; i++)
    {
        int bit = get_bit(x,i);
        if (i == 0) {continue;}
        if (bit == 1 && get_bit(x,i-1) == 1) {return false;}
    }
    return true;
}
int trongso(int x,int trangthai)
{
    int res = 0;
    for (int i=0; i<N; i++)
    {
        int bit = get_bit(trangthai,i);
        if (bit == 1) {res += a[i][x];}
    }
    return res;
}
void init()
{
    for (int i=0; i<1 << N; i++)
    {
        if (check(i)) {
                //cout<<i<<endl;
                stk[++top] = i;
        }
    }
    for (int i=1; i<=top; i++)
    {
        f[0][stk[i]] = trongso(0,stk[i]);
        //cout<<trongso(0,stk[i])<<endl;
    }
}
void get(int x)
{
    for (int i=1; i<=top; i++)
    {
        int ts = trongso(x,stk[i]);
        //cout<<ts<<" "<<x<<" "<<stk[i]<<endl;
        f[x][stk[i]] = ts;
        //cout<<f[0][4]<<" "<<ts<<endl;
        for (int j = 1; j<=top; j++)
        {
            int gt = f[x-1][stk[j]] + ts;
           // cout<<stk[i]<<" "<<stk[j]<<" "<<(stk[i] & stk[j])<<endl;
            //if (x == 1 && stk[i] == 9 && stk[j] == 4) {cout<<"CC"<<" "<<f[x][stk[i]]<<" "<<f[x - 1][stk[j]] + ts<<endl;}
            if (((stk[i] & stk[j]) == 0) && (f[x][stk[i]] < gt))
            {
                //cout<<stk[i]<<" "<<stk[j]<<endl;
                f[x][stk[i]] = gt;
                //if (x == 1 && stk[i] == 9 && stk[j] == 4) {cout<<"CC"<<" "<<f[x][stk[i]]<<" "<<f[0][4] + ts<<endl;}
            }
        }
    }
}
void solve()
{
    int res = 0;
    for (int i=1; i<n; i++) {get(i);}
//    cout<<f[1][9]<<endl;
//    cout<<f[0][4]<<endl;
//    cout<<(9 & 4)<<endl;
    for (int i=0; i<n; i++)
    {
        for (int j = 1; j <= top; j++) {res = max(res,f[i][stk[j]]);}
    }
    cout<<res;
}
int main()
{
    nhap();
    init();
    solve();
}