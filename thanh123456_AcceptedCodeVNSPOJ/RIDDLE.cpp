#include <bits/stdc++.h>
using namespace std;
const int N = 5e5;
int n,test,k,a[N],b[N];
void nhap()
{
    scanf("%d",&test);
}
void doc()
{
    scanf("%d%d",&n,&k);
    memset(a,0,sizeof(a));
    for (int i=1; i<=n; i++) {scanf("%d",&b[i]);}
    //sort(a+1,a+1+n);
}
bool check(int m)
{
	for (int i=1; i<=m; i++) {a[i] = b[i];}
	sort(a+1,a+1+m);
    long long s = 0;
    for (int i=1; i<=m; i++)
    {
        if (s+1 < a[i]) {return false;}
        s+=(long long)a[i];
    }
    if (s<k) {return false;}
    return true;
}
void giai()
{
    int l = 1;
    int r = n;
    int res = 0;
    while (l<=r)
    {
        int mid = (l+r) /  2;
        if (check(mid)) {res=mid; r=mid-1;}
        else {l=mid+1;}
    }
    printf("%d\n",res ? res : -1);
}
void solve()
{
    for (int i=1; i<=test; i++)
    {
        doc();
        giai();
    }
}
int main()
{
    nhap();
    solve();
}
