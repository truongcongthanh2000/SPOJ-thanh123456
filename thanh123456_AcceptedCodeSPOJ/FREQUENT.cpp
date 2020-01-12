#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
using namespace std;
typedef pair<int,int> i2;
typedef pair<int,i2> i3;
const int N = 1e5 + 100;
const long double sodu = 1e-6;
const int limit = 15000;
const int oo = 1e9 + 100;
const int module = 1e9;
int ReadInt()
{
    int res = 0;
    char c;
    bool kt = false;
    c = getchar();
    if (c == '-') {kt = true;}
    else {
        res = res * 10 + (c - '0');
    }
    for (c = getchar(); c >= '0' && c <= '9'; c = getchar()) {
        res = res * 10 + (c - '0');
    }
    return (kt ? (0 - res) : res);
}
int GCD(int a,int b) {
    if (b == 0) {
        return a;
    }
    if (a == 0) {
        return b;
    }
    return GCD(b,a % b);
}
long long Mu(long long A,long long N,long long module) {
    if (N == 0) {return 1;}
    else {
        long long Tam = Mu(A,N >> 1,module);
        Tam = Tam * Tam % module;
        if (N & 1) {
            Tam = Tam * A % module;
        }
        return Tam;
    }
}
int n,q;
int a[N];
int IT[N * 4];
void nhap()
{
}
void doc() {
    scanf("%d",&n);
    if (n == 0) {
        exit(0);
    }
    scanf("%d",&q);
    for (int i = 1; i <= n; i++) {
        scanf("%d",&a[i]);
    }
}
void build(int i,int l,int r) {
    IT[i] = 0;
    if (l == r) {
        return;
    }
    int mid = (l + r) >> 1;
    build(i << 1,l,mid);
    build(i << 1 | 1,mid + 1,r);
}
void update(int i,int l,int r,int u,int x) {
    if (l > u || r < u) {
        return;
    }
    if (l == r) {
        IT[i] = x;
        return;
    }
    int mid = (l + r) >> 1;
    update(i << 1,l,mid,u,x);
    update(i << 1 | 1,mid + 1,r,u,x);
    IT[i] = max(IT[i << 1],IT[i << 1 | 1]);
}
int Get(int i,int l,int r,int u,int v) {
    if (l > v || r < u) {
        return 0;
    }
    if (l >= u && r <= v) {
        return IT[i];
    }
    int mid = (l + r) >> 1;
    int Left = Get(i << 1,l,mid,u,v);
    int Right = Get(i << 1 | 1,mid + 1,r,u,v);
    return max(Left,Right);
}
void init() {
    for (int i = 1; i <= n; ) {
        int j = i;
        while (j <= n && a[i] == a[j]) {
            j++;
        }
        update(1,1,n,i,j - i);
        i = j;
    }
}
void solve() {
    while (1 < 2) {
        doc();
        build(1,1,n);
        init();
        for (int i = 1; i <= q; i++) {
            int L,R;
            scanf("%d %d",&L,&R);
            int Pos_Left = upper_bound(a + L,a + 1 + R,a[L]) - (a + 1);
            int Pos_Right = lower_bound(a + L,a + 1 + R,a[R]) - a;
            int GT1 = Pos_Left - L + 1;
            int GT2 = R - Pos_Right + 1;
            int GT3 = Get(1,1,n,Pos_Left + 1,Pos_Right - 1);
            cout << max(max(GT1,GT2),GT3) << '\n';
        }
    }
}
int main() {
    nhap();
    solve();
}
