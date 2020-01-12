#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
using namespace std;
typedef pair<int,int> i2;
typedef pair<int,i2> i3;
const int N = 1e5 + 10;
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

struct Node{
    int SL[10];
    Node(){};
    Node (int X) {
        for (int i = 0; i < 10; i++) {
            SL[i] = 0;
        }
        if (X != -1) {
            SL[X] = 1;
        }
    }
};
Node IT[N * 4];
int n,Q,lazy[N * 4];
int c[10];
void nhap()
{
    n = ReadInt();
    Q = ReadInt();
}

Node Get(Node Left,Node Right) {
    Node Root;
    for (int i = 0; i < 10; i++) {
        Root.SL[i] = Left.SL[i] + Right.SL[i];
    }
    return Root;
}
void build(int i,int L,int R) {
    if (L == R) {
        IT[i] = Node(0);
        return;
    }
    int mid = (L + R) >> 1;
    build(i << 1,L,mid);
    build(i << 1 | 1,mid + 1,R);
    IT[i] = Get(IT[i << 1],IT[i << 1 | 1]);
}
Node add(Node Root,int x,int K) {
    for (int i = 0; i < K; i++) {
        c[i] = Root.SL[i];
    }
    for (int i = 0; i < K; i++) {
        Root.SL[(i + x) % K] = c[i];
    }
    return Root;
}
void cn(int i,int L,int R) {
    if (lazy[i] == 0) {
        return;
    }
    IT[i] = add(IT[i],lazy[i] % 3,3);
    if (L != R) {
        lazy[i << 1] += lazy[i];
        lazy[i << 1 | 1] += lazy[i];
    }
    lazy[i] = 0;
}

void update(int i,int L,int R,int u,int v,int x) {
    cn(i,L,R);
    if (L > v || R < u) {
        return;
    }
    if (L >= u && R <= v) {
        lazy[i] += x;
        cn(i,L,R);
        return;
    }
    int mid = (L + R) >> 1;
    update(i << 1,L,mid,u,v,x);
    update(i << 1 | 1,mid + 1,R,u,v,x);
    IT[i] = Get(IT[i << 1],IT[i << 1 | 1]);
}
Node Get(int i,int L,int R,int u,int v) {
    cn(i,L,R);
    if (L > v || R < u) {
        return Node(-1);
    }
    if (L >= u && R <= v) {
        return IT[i];
    }
    int mid = (L + R) >> 1;
    Node Left = Get(i << 1,L,mid,u,v);
    Node Right = Get(i << 1 | 1,mid + 1,R,u,v);
    return Get(Left,Right);
}
void solve() {
    build(1,1,n);
    for (int i = 0; i < Q; i++) {
        int Type = ReadInt();
        int L = ReadInt();
        int R = ReadInt();
        L++;
        R++;
        if (Type == 0) {
            update(1,1,n,L,R,1);
        }
        else {
            Node Res = Get(1,1,n,L,R);
            cout << Res.SL[0] << '\n';
        }
    }
}
int main() {
    nhap();
    solve();
}
