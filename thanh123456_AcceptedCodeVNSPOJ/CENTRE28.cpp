#include <bits/stdc++.h>

using namespace std;
typedef pair<long long,int> i2;
typedef pair<int,i2> i3;
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
string ReadString() {
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

const int N = 3e5 + 10;
const long double sodu = 1e-6;
const int limit = 15000;
const int oo = 1e9 + 100;
const int module = 1e9;

int n,m;
int d1[N],d2[N];
long long bac1[N],bac2[N];
vector <int> a[N],b[N];

void nhap()
{
    n = ReadInt();
    m = ReadInt();
    for (int i = 0; i < m; i++) {
        int u = ReadInt();
        int v = ReadInt();
        int w = ReadInt();
        a[u].push_back(v);
        a[v].push_back(u);
        b[u].push_back(w);
        b[v].push_back(w);
    }
}

void Dijkstra(int S,int d[],long long bac[]) {
    priority_queue <i2, vector<i2>, greater<i2> > Q;
    for (int i = 1; i <= n; i++) {
        d[i] = oo;
        bac[i] = 0;
    }
    Q.push(i2(0,S));
    d[S] = 0;
    bac[S] = 1;
    while (Q.size() != 0) {
        i2 B = Q.top(); Q.pop();
        int u = B.second;
        int du = B.first;
        if (d[u] != du) {
            continue;
        }
        for (int i = 0; i < a[u].size(); i++) {
            int v = a[u][i];
            int w = b[u][i];
            if (d[v] > d[u] + w) {
                d[v] = d[u] + w;
                bac[v] = bac[u];
                Q.push(i2(d[v],v));
            }
            else {
                if (d[v] == d[u] + w) {
                    bac[v] += bac[u];
                }
            }
        }
    }
}
void solve() {
    Dijkstra(1,d1,bac1);
    Dijkstra(n,d2,bac2);
    vector <int> Res;
//    for (int i = 1; i <= n; i++) {
//        cout << bac1[i] << " " << bac2[i] << '\n';
//    }
    for (int i = 2; i < n; i++) {
        if (d1[i] + d2[i] != d1[n] || d1[i] + d2[i] == d1[n] && bac1[i] * bac2[i] != bac1[n]) {
            Res.push_back(i);
        }
    }
    cout << Res.size() << '\n';
    for (int i : Res) {
        cout << i << '\n';
    }
}
int main() {
    ios_base::sync_with_stdio(0);
    cin.tie(nullptr);
    cout.tie(nullptr);
    nhap();
    solve();
}
