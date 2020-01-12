#include <bits/stdc++.h>
using namespace std;
const int N = 1e5 + 100;
int test,n,a[N],top1 = 0,top2 = 0;
long long M,A[N],B[N];
void nhap()
{
    scanf("%d",&test);
}
void nhapdulieu()
{
    scanf("%d %lld",&n,&M);
    for (int i = 1; i <= n; i++) {
        scanf("%d",&a[i]);
    }
}
int get_bit(int x,int i)
{
    return (x >> i) & 1;
}
void duyet(int N,int vt,int &top,long long *A)
{
    for (int i = 0; i < (1 << N); i++) {
        long long gt = 0;
        for (int j = 0; j < N; j++) {
            int bit = get_bit(i,j);
            if (bit) {
                gt+=1ll * a[vt + j];
            }
        }
        top++;
        A[top] = gt;
    }
}
void taomang()
{
    top1 = 0;
    top2 = 0;
    int mid = n >> 1;
    duyet(mid,1,top1,A);
    duyet(n - mid,mid + 1,top2,B);
//    for (int i = 1; i <= top2; i++) {
//        cout<<B[i]<<" ";
//    }
//    cout<<endl;
    sort(A + 1,A + 1 + top1);
}
int tknp(long long gt)
{
    int l = 1;
    int r = top1;
    int res = 0;
    while (l <= r)
    {
        int mid = (l + r) >> 1;
        if (A[mid] <= gt) {res = mid; l = mid + 1;}
        else {r = mid - 1;}
    }
    return res;
}
void giai()
{
    long long res = 0;
    for (int i = 1; i <= top2; i++) {
        if (B[i] > M) {continue;}
        int vt = tknp(M - B[i]);
        res = max(res,A[vt] + B[i]);
    }
    cout<<res<<'\n';
}
void solve()
{
    for (int i = 1; i <= test; i++) {
        nhapdulieu();
        taomang();
        giai();
    }
}
int main()
{
    nhap();
    solve();
}
