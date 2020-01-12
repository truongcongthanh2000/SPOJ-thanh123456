#include <bits/stdc++.h>
using namespace std;
const int N = 34;
const int oo = 2e9 + 1;
int n,test,top1 = 0,top2 = 0;
long long a[N + 1];
struct ds
{
    long long x;
    int y;
};
ds A[1 << (14) + 2],B[1 << (20) +2];
void nhap()
{
    scanf("%d",&test);
    n = 34;
    a[1] = 2;
    a[2] = 3;
    a[3] = 5;
    for (int i=4; i<=34; i++) {a[i] = a[i-1] + a[i-2] + a[i-3];}
}
int get_bit(int x,int i)
{
    return (x >> i) & 1;
}
void duyet(ds *A,int N,int vt,int& top)
{
    for (int i=0; i< 1 << N; i++)
    {
        long long sl = 0;
        int gt = 0;
        for (int j = 0; j < N; j++)
        {
            int bit = get_bit(i,j);
            if (bit == 1)
            {
                sl+=a[vt + j];
                gt++;
                if (sl > oo) {sl = -oo; break;}
            }
        }
        if (sl == -oo) {continue;}
        top++;
        A[top].x = sl;
        A[top].y = gt;
    }
}
bool cmp(ds a,ds b)
{
    return (a.x < b.x) || (a.x == b.x && a.y < b.y);
}
void taomang()
{
    int mid = 14;
    duyet(A,mid,1,top1);
    duyet(B,n - mid,mid + 1,top2);
    sort(B+1,B+1+top2,cmp);
    sort(A+1,A+1+top1,cmp);
}
int tknp(int x)
{
    int l = 1;
    int r = top2;
    int res = 0;
    while (l <= r)
    {
        int mid = (l+r) >> 1;
        if (B[mid].x == x) {res = mid;}
        if (B[mid].x > x) {r = mid - 1;}
        else {l = mid + 1;}
    }
    return res;
}
void giai(int x)
{
    int res = -1;
    for (int i=1; i<=top1; i++)
    {
        if (A[i].x > x) {break;}
        int mid = tknp(x - A[i].x);
        if (mid == 0) {continue;}
        res = max(res,A[i].y + B[mid].y);
    }
    printf("%d\n",res);
}
void solve()
{
    for (int i=1; i<=test; i++)
    {
        int x;
        scanf("%d",&x);
        printf("Case #%d: ",i);
        giai(x);
    }
}
int main()
{
    nhap();
    taomang();
    solve();
}
