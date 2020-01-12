#include <bits/stdc++.h>
using namespace std;
const int N = 62;
int n,k,a[N],b[N],vt[N][N],thutu[N][N];
long long c[N][N],m;
struct ds
{
    int x,vt;
};
bool cmp(ds a,ds b) {
    return a.x < b.x;
}
ds A[N];
void nhap()
{
    scanf("%d %d",&n,&k);
    for (int i = 1; i <= n; i++) {
        scanf("%d",&a[i]);
    }
    for (int i = 1; i <= k; i++) {
        int len = k - i + 1;
        for (int j = i; j <= n - len + 1; j++) {
            A[j].x = a[j];
            A[j].vt = j;
        }
        int top = n - len + 1;
        sort(A+i,A+1+top,cmp);
        for (int j = i; j <= top; j++) {
            //cout<<A[j].vt<<" ";
            thutu[i][j - i + 1] = A[j].vt;
        }
        //cout<<endl;
    }
    scanf("%lld\n",&m);
    for (int i = 1; i <= k; i++) {
        int x;
        scanf("%d",&x);
        for (int j = 1; j <= n; j++) {
            if (x == a[j]) {
                b[i] = j;
                break;
            }
        }
    }
}
void qhd()
{
    c[0][0] = 1;
    for (int i = 1; i <= n; i++) {
        c[i][0] = 1;
        for (int j = 1; j <= n; j++) {
            c[i][j] = c[i - 1][j - 1] + c[i - 1][j];
        }
    }
    //cout<<c[4][2]<<endl;
}
void solve1()
{
    int dinh = 0;
    for (int i = 1; i <= k; i++) {
        for (int j = 1; j <= n - k + 1; j++) {
            int vitri = thutu[i][j];
            //cout<<vitri<<endl;
            if (vitri <= dinh) {continue;}
            //cout<<vitri<<endl;
            if (m > c[n - vitri][k - i]) {
                m-=c[n - vitri][k - i];
                //cout<<m<<endl;
            }
            else {
                cout<<a[vitri]<<" ";
                dinh = vitri;
                break;
            }
        }
    }
    cout<<endl;
}
void solve2()
{
    int dinh = 0;
    long long res = 1;
    for (int i = 1; i <= k; i++) {
        //cout<<b[i]<<endl;
        for (int j = 1; j <= n - k + 1; j++) {
            int vitri = thutu[i][j];
            if (vitri <= dinh) {continue;}
            if (vitri != b[i]) {
                //cout<<vitri<<" ";
                res+=c[n - vitri][k - i];
            }
            else {
                dinh = b[i];
                break;
            }
        }
        //cout<<endl;
    }
    cout<<res;
}
void solve()
{
    solve1();
    solve2();
}
int main()
{
    nhap();
    qhd();
    solve();
}
