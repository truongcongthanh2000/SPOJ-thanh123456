#include <bits/stdc++.h>
using namespace std;
const int N = 24;
const int maxN = 6e5;
struct ds
{
    int x,y,z;
};
int a[1 << (N >> 1) + 1],n,mu3[N + 1],top1 = 0,top2 = 0;
ds A[maxN],B[maxN];
void nhap()
{
    scanf("%d",&n);
    for (int i=1; i<=n; i++) {scanf("%d",&a[i]);}
    mu3[0] = 1;
    for (int i = 1; i<=N / 2; i++) {mu3[i] = mu3[i-1] * 3;}
}
int get_bit(int x,int i)
{
    return (x >> i) & 1;
}
void duyet(ds *A,const int N,int vt,int &top,const int loai)
{
    //cout<<N<<endl;
    for (int i = 0; i < mu3[N]; i++)
    {
        int gt_1 = 0;
        int gt_2 = 0;
        for (int j = 0; j < N; j++)
        {
            int bit = (i / mu3[j]) % 3;
            //cout<<i<<" "<<j<<" "<<bit<<endl;
            if (bit == 1) {gt_1+=a[vt + j];}
            if (bit == 2) {gt_2+=a[vt + j];}
        }
        if (loai == 1)
        {
            top++;
            A[top].z = gt_1 - gt_2;
            A[top].x = gt_1;
            A[top].y = gt_2;
        }
        else
        {
            top++;
            A[top].z = gt_2 - gt_1;
            A[top].x = gt_1;
            A[top].y = gt_2;
        }
    }
}
bool cmp(ds a,ds b)
{
    return (a.z < b.z) || (a.z == b.z && a.x < b.x);
}
void taomang()
{
    int mid = n >> 1;
    duyet(A,mid,1,top1,1);
    duyet(B,n - mid,mid + 1,top2,2);
    sort(B+1,B+1+top2,cmp);
}
int tknp(int x,const int top,const ds *A)
{
    int l = 1;
    int r = top;
    int res = 0;
    while (l <= r)
    {
        int mid = (l + r) >> 1;
        if (A[mid].z == x) {res = mid;}
        if (A[mid].z <= x) {l = mid + 1;}
        else {r = mid-1;}
    }
    return res;
}
void solve()
{
    int res = 0;
    for (int i = 1; i <= top1; i++)
    {
        int vt = tknp(A[i].z,top2,B);
        if (vt == 0) {continue;}
        res = max(res,A[i].x + B[vt].x);
    }
    cout<<res;
}
int main()
{
    nhap();
    taomang();
    solve();
}
