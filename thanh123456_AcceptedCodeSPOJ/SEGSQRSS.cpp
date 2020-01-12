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
int n,Q,Test;
long long IT[N * 4];
i2 lazy[N * 4];
void nhap()
{
    scanf("%d",&Test);
}
void doc() {
    scanf("%d %d",&n,&Q);
}
void cn(int i,int l,int r) {
    if (lazy[i].first == 0) {
        return;
    }
    if (lazy[i].first == 1) {
        IT[i] = 1ll * (r - l + 1) * lazy[i].second * lazy[i].second;
    }
    else {
        long long X = 1ll * lazy[i].second * lazy[i].second;
        IT[i] += 2ll * (r - l + 1) * lazy[i].second + 1ll * (r - l + 1) * X;
    }
    if (l != r) {
        if (lazy[i].first == 1) {
            lazy[i << 1] = lazy[i];
            lazy[i << 1 | 1] = lazy[i];
        }
        else {
            if (lazy[i].first != lazy[i << 1].first) {
                lazy[i << 1] = lazy[i];
            }
            else {
                lazy[i << 1].second += lazy[i].second;
            }
            if (lazy[i].first != lazy[i << 1 | 1].first) {
                lazy[i << 1 | 1] = lazy[i];
            }
            else {
                lazy[i << 1 | 1].second += lazy[i].second;
            }
        }
    }
    lazy[i] = i2(0,0);
}
void update(int i,int l,int r,int u,int v,int type,int x) {
    cn(i,l,r);
    if (l > v || r < u) {
        return;
    }
    if (l == r) {
        lazy[i] = i2(type,x);
        cn(i,l,r);
        return;
    }
    int mid = (l + r) >> 1;
    update(i << 1,l,mid,u,v,type,x);
    update(i << 1 | 1,mid + 1,r,u,v,type,x);
    IT[i] = IT[i << 1] + IT[i << 1 | 1];
}
long long Get(int i,int l,int r,int u,int v) {
    cn(i,l,r);
    if (l > v || r < u) {
        return 0;
    }
    if (l >= u && r <= v) {
        return IT[i];
    }
    int mid = (l + r) >> 1;
    long long Left = Get(i << 1,l,mid,u,v);
    long long Right = Get(i << 1 | 1,mid + 1,r,u,v);
    return Left + Right;
}
void xuli() {
    for (int i = 1; i <= n; i++) {
        update(1,1,n,i,i,1,0);
    }
    for (int i = 1; i <= n; i++) {
        int x;
        scanf("%d",&x);
        update(1,1,n,i,i,1,x);
    }
    for (int i = 1; i <= Q; i++) {
        int Type,L,R;
        scanf("%d %d %d",&Type,&L,&R);
        if (Type == 2) {
            cout << Get(1,1,n,L,R) << '\n';
        }
        else {
            int X;
            scanf("%d",&X);
            if (Type == 0) {
                update(1,1,n,L,R,1,X);
            }
            else {
                update(1,1,n,L,R,2,X);
            }
        }
    }
}
void solve() {
    int D = 1;
    while (Test--) {
        doc();
        cout << "Case" << " " << D << ":" << '\n';
        D++;
        xuli();
    }
}
int main() {
    nhap();
    solve();
}
