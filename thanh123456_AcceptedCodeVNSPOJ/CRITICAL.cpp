#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
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

int n,m;
vector <int> a[N],b[N];
int SL[N],low[N],number[N],Count = 0,SLTP = 0,TP[N];
int nC[N],con[N],DD[N],parent[N];
bool khop[N];
long long res = 0;
void nhap()
{
    cin >> n >> m;
    for (int i = 1; i <= m; i++) {
        int u,v;
        cin >> u >> v;
        a[u].push_back(v);
        a[v].push_back(u);
        b[u].push_back(i);
        b[v].push_back(i);
    }
}

void DFS(int u) {
    TP[u] = SLTP;
    SL[SLTP]++;
    low[u] = n + 1;
    number[u] = ++Count;
    con[u] = 1;
    nC[u] = 0;
    for (int i = 0; i < a[u].size(); i++) {
        int v = a[u][i];
        int pos = b[u][i];
        if (DD[pos] == 0) {
            DD[pos] = 1;
            if (number[v] == 0) {
                parent[v] = u;
                nC[u]++;
                DFS(v);
                if (low[v] >= number[u]) {
                    khop[u] = true;
                }
                con[u] += con[v];
                low[u] = min(low[u],low[v]);
            }
            else {
                low[u] = min(low[u],number[v]);
            }
        }
    }
}

void visit(int u) {
    int tam = SL[TP[u]] - 1;
    for (int v : a[u]) {
        if (parent[v] != u) {
            continue;
        }
        visit(v);
        if (khop[u] && low[v] >= number[u]) {
            tam -= con[v];
            res += 1ll * tam * con[v];
        }
    }
}
void solve() {
    SLTP = 0;
    for (int i = 1; i <= n; i++) {
        if (number[i] == 0) {
            SLTP++;
            DFS(i);
            if (nC[i] < 2) {
                khop[i] = false;
            }
        }
    }
    res = 0;
    for (int i = 1; i <= n; i++) {
        if (parent[i] == 0) {
            visit(i);
        }
    }
    cout << fixed << setprecision(2) << (long double)res / n;
}
int main() {
    ios_base::sync_with_stdio(0);
    cin.tie(NULL);
    cout.tie(NULL);
    nhap();
    solve();
}
