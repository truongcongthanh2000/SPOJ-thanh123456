#include <bits/stdc++.h>

using namespace std;
typedef pair<int,int> i2;
typedef pair<int,i2> i3;
const int N = 2e5 + 10;
const long double sodu = 1e-6;
const int limit = 15000;
const int oo = 1e9 + 100;
const int module = 1e9;
int ReadInt() {
    char c;
    bool kt = false;
    for (c = getchar(); c < '0' || c > '9'; c = getchar()) {
        if (c == '-') {
            kt = true;
        }
    }
    int res = c - '0';
    for (c = getchar(); c >= '0' && c <= '9'; c = getchar()) {
        res = res * 10 + (c - '0');
    }
    return (kt ? 0 - res : res);
}
string Read() {
    string Res = "";
    char c;
    for (c = getchar(); c < 'A' || c > 'Z'; c = getchar());
    Res.push_back(c);
    for (c = getchar(); c >= 'A' && c <= 'Z'; c = getchar()) {
        Res.push_back(c);
    }
    return Res;
}
void WriteInt(int x) {
    if (x > 9) WriteInt(x / 10);
    putchar(x % 10 + '0');
}

void xuat(int x) {
    if (x < 0) {
        putchar('-');
        WriteInt(0 - x);
    }
    else {
        WriteInt(x);
    }
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

int n,T,m;
int D[10][N];
int kt[N];
int p[10];
vector <int> a[N];
void nhap()
{
    cin >> n >> T >> m;
    for (int i = 1; i <= m; i++) {
        int u,v;
        cin >> u >> v;
        a[u].push_back(v);
    }
}

void BFS(int S) {
    queue <int> Q;
    for (int i = 0; i < n; i++) {
        D[S][i] = 0;
        kt[i] = 0;
    }
    kt[S] = 1;
    Q.push(S);
    while (Q.size() != 0) {
        int u = Q.front(); Q.pop();
        for (int v : a[u]) {
            if (kt[v] == 0) {
                Q.push(v);
                D[S][v] = D[S][u] + 1;
                kt[v] = 1;
            }
        }
    }
}
void solve() {
    for (int i = 0; i < T; i++) {
        BFS(i);
    }
    p[0] = 0; p[T] = 0;
    for (int i = 1; i < T; i++) {
        p[i] = i;
    }
    int Res = 1e9;
    do {
        int GT = 0;
        for (int i = 0; i < T; i++) {
            int u = p[i];
            int v = p[i + 1];
            GT += D[u][v];
        }
        Res = min(GT,Res);
    }
    while (next_permutation(p + 1,p + T));
    cout << Res;
}
int main() {
    ios_base::sync_with_stdio(0);
    cin.tie(NULL);
    cout.tie(NULL);
    nhap();
    solve();
}
