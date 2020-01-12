#include <bits/stdc++.h>
using namespace std;
int test;
void nhap()
{
    scanf("%d\n",&test);
}
void giai(int l,int r,int loai)
{
    if (l >= r) {return;}
    int mid = (l + r) >> 1;
    ios_base::sync_with_stdio(0);
    cout.tie(NULL);
    int len = r - l + 1,left,right;
    bool pre = 0;
    if (loai == 0) {
        if (len & 1) {
            left = mid - 1;
            right = mid + 1;
            pre = 0;
        }
        else {
            mid++;
            left = mid - 1;
            right = mid + 1;
            pre = 1;
        }
    }
    if (loai == 1) {
        if (len & 1) {
            left = mid - 1;
            right = mid + 1;
            pre = 1;
        }
        else {
            pre = 0;
            left = mid - 1;
            right = mid + 1;
        }
    }
    //cout<<pre<<" "<<left<<" "<<right<<" "<<mid<<" "<<loai<<endl;
    while (left >= l || right <= r) {
        if (pre == 0) {
            cout<<mid<<" "<<right<<'\n';
            mid = right;
            right++;
        }
        else {
            cout<<mid<<" "<<left<<'\n';
            mid = left;
            left--;
        }
        pre ^= 1;
    }
}
void xuat(int n,int root)
{
    ios_base::sync_with_stdio(0);
    cout.tie(NULL);
    cout<<"YES"<<'\n';
    if (n == 1) {return;}
    if (root * 2 <= n) {
        int len = root - 1;
        int r = root + len;
        int l = 1;
        giai(l,r,0);
        giai(r + 1,n,0);
        if (r < n) {cout<<1<<" "<<r + 1<<'\n';}
    }
    else {
        int len = n - root;
        int r = n;
        int l = root - len;
        giai(l,r,1);
        giai(1,l - 1,1);
        if (l > 1) {cout<<n<<" "<<l - 1<<'\n';}
    }
}
void solve()
{
    for (int i = 1; i <= test; i++) {
        int n,root;
        scanf("%d %d",&n,&root);
        n = max(n,root);
        xuat(n,root);
    }
}
int main()
{
    nhap();
    solve();
}
