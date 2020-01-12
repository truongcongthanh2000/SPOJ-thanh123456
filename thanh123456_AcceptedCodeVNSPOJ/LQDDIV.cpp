#include <bits/stdc++.h>
using namespace std;
const int N = 34;
long long a[N],A[1 << (N >> 1) + 1],B[1 << (N >> 1) + 1],s;
int n,top1 = 0,top2 = 0;
void nhap()
{
    scanf("%d",&n);
    s = 0;
    for (int i=1; i<=n; i++) {scanf("%d",&a[i]); s+=a[i];}
}
int get_bit(int x,int i)
{
    return (x >> i) & 1;
}
void duyet(long long *A,int N,int vt,int& top)
{
    for (int i = 0; i < 1 << N; i++)
    {
        long long ts = 0;
        for (int j = 0; j < N; j++)
        {
            int bit = get_bit(i,j);
            if (bit == 1)
            {
                ts+=a[j + vt];
            }
        }
        top++;
        A[top] = ts;
    }
}
void taomang()
{
    int mid = (n >> 1);
    duyet(A,mid,1,top1);
    duyet(B,n - mid,mid + 1,top2);
    sort(A+1,A+1+top1);
    sort(B+1,B+1+top2);
}
int tknp(const long long *A,int &top,long long x)
{
    int l = 1;
    int r = top;
    int res = 0;
    while (l <= r)
    {
        int mid = (l + r) >> 1;
        if (A[mid] <= x) {res = mid; l = mid + 1;}
        else {r = mid - 1;}
    }
    return res;
}
int tknp3(long long x,const long long *A,const int &top)
{
    x = x >> 1;
    int l = 1;
    int r = top;
    int res = 0;
    while (l <= r)
    {
        int mid = (l + r) >> 1;
        if (A[mid] == x) {res = mid;}
        if (A[mid] < x) {l = mid + 1;}
        else {r = mid - 1;}
    }
    return res;
}
int tknp4(long long x,const long long *A,const int &top)
{
    x = x >> 1;
    //cout<<x<<endl;
    int l = 1;
    int r = top;
    int res = 0;
    while (l <= r)
    {
        int mid = (l + r) >> 1;
        if (A[mid] == x) {res = mid;}
        if (A[mid] <= x) {l = mid + 1;}
        else {r = mid - 1;}
    }
    return res;
}
void solve()
{
    long long giua = s >> 1;
    long long lech = s;
    for (int i = 1; i <= top1; i++)
    {
        //cout<<A[i]<<" ";
        int vt = tknp(B,top2,giua - A[i]);
        if (vt == 0) {continue;}
        //cout<<B[vt]<<endl;
        lech = min(lech,s - (A[i] + B[vt]) * 2);
    }
    for (int i = 1; i <= top2; i++)
    {
        int vt = tknp(A,top1,giua - B[i]);
        if (vt == 0) {continue;}
        lech = min(lech,s - (A[vt] + B[i]) * 2);
    }
    long long sl = 0;
//    if (lech == 0)
//    {
        for (int i=1; i<=top1; i++)
        {
            int le = tknp3(s - 2 * A[i] - lech,B,top2);
            int ri = tknp4(s - 2 * A[i] - lech,B,top2);
            if (le == 0) {continue;}
            sl+=1ll * (ri - le + 1);
        }
//    }
//    else
//    {
//        for (int i=1; i<=top1; i++)
//        {
//            int le = tknp3(s - 2 * A[i] - lech,B,top2);
//            int ri = tknp4(s - 2 * A[i] - lech,B,top2);
//            if (le == 0) {continue;}
//            sl+=ri - le + 1;
//        }
//        for (int i=1; i<=top2; i++)
//        {
//            int le = tknp3(s - 2 * B[i] - lech,A,top1);
//            int ri = tknp4(s - 2 * B[i] - lech,A,top1);
//            if (le == 0) {continue;}
//            sl+=ri - le + 1;
//        }
//    }
    if (lech == 0) {sl = sl >> 1;}
    cout<<lech<<" "<<sl<<endl;
}
int main()
{
    nhap();
    taomang();
    solve();
}
