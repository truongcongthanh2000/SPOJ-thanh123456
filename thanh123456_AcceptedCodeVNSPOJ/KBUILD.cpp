#include <bits/stdc++.h>

using namespace std;
#define TASK "SLQUACANH"

const int N = 3e5 + 10;
int n;
vector <int> a[N],bb[N];

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

void WriteInt(long long x) {
    if (x > 9) WriteInt(x / 10);
    putchar(x % 10 + '0');
}

void xuat(long long x) {
    if (x < 0) {
        putchar('-');
        WriteInt(0 - x);
    }
    else {
        WriteInt(x);
    }
}
int b[N][20],F[N],Res[N],d[N];
void doc() {
    //cin >> n;
    //n = ReadInt();
    scanf("%d\n",&n);
    for (int i = 1; i < n; i++) {
        int u,v;
        //cin >> u >> v;
        //u = ReadInt();
        //v = ReadInt();
        scanf("%d %d\n",&u,&v);
        a[u].push_back(v);
        a[v].push_back(u);
        bb[u].push_back(i);
        bb[v].push_back(i);
    }
}
int lg(int x) {
    int res = 0;
    for (int i = 0; i <= 20; i++) {
        if ((1 << i) > x) {
            break;
        }
        res = i;
    }
    return res;
}
void DFS(int u) {
    int limit = lg(d[u]);
    for (int i = 0; i <= limit; i++) {
        if (b[b[u][i]][i] == 0) {
            break;
        }
        b[u][i + 1] = b[b[u][i]][i];
    }
    for (int v : a[u]){
        if (b[u][0] == v) {
            continue;
        }
        b[v][0] = u;
        d[v] = d[u] + 1;
        DFS(v);
    }
}

int LCA(int u,int v) {
    if (d[u] < d[v]) {
        swap(u,v);
    }
    int k = d[u] - d[v];
    int lk = lg(k);
    for (int i = lk; i >= 0; i--) {
        if (k >= (1 << i)) {
            k -= (1 << i);
            u = b[u][i];
        }
    }
    if (u == v) {
        return u;
    }
    int res = 0;
    int lu = lg(d[u]);
    for (int i = lu; i >= 0; i--) {
        if (b[u][i] != b[v][i]) {
            u = b[u][i];
            v = b[v][i];
        }
        else {
            res = b[u][i];
        }
    }
    return res;
}

void TruyVan(int u,int v) {
    int root = LCA(u,v);
    F[u]++;
    F[v]++;
    F[root] -= 2;
}

void visit(int u) {
    for (int i = 0; i < a[u].size(); i++) {
        int v = a[u][i];
        int pos = bb[u][i];
        if (b[u][0] == v) {
            continue;
        }
        visit(v);
        Res[pos] = F[v];
        F[u] += F[v];
    }
}
void solve() {
    int Q;
    //cin >> Q;
    //Q = ReadInt();
    scanf("%d\n",&Q);
    for (int i = 1; i <= Q; i++) {
        int u,v;
        //cin >> u >> v;
        //u = ReadInt();
        //v = ReadInt();
        scanf("%d %d\n",&u,&v);
        TruyVan(u,v);
    }
    visit(1);
    int kq = 0;
    for (int i = 1; i < n; i++) {
        //cout << Res[i] << '\n';
        //xuat(Res[i]);
        //putchar('\n');
        //printf("%d\n",Res[i]);
        if (Res[i] == 0) {
        	kq++;
        }
    }
    cout << kq;
}

int main() {
//    ios_base::sync_with_stdio(0);
//    cin.tie(nullptr);
//    cout.tie(nullptr);
    doc();
    DFS(1);
    solve();
}
