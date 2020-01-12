#include <bits/stdc++.h>

using namespace std;
typedef pair<int,int> i2;
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

vector <int> A,B;
vector <int> hang[N],cot[N];
int n,x[N],y[N];
void nhap()
{
    n = ReadInt();
    for (int i = 1; i <= n; i++) {
        x[i] = ReadInt();
        y[i] = ReadInt();
        A.push_back(x[i]);
        B.push_back(y[i]);
    }
    sort(A.begin(),A.end());
    sort(B.begin(),B.end());
    A.resize(unique(A.begin(),A.end()) - A.begin());
    B.resize(unique(B.begin(),B.end()) - B.begin());
    for (int i = 1; i <= n; i++) {
        int u = lower_bound(A.begin(),A.end(),x[i]) - A.begin();
        int v = lower_bound(B.begin(),B.end(),y[i]) - B.begin();
        //cout << u << " " << v << '\n';
        hang[u].push_back(y[i]);
        cot[v].push_back(x[i]);
    }
    for (int i = 0; i <= n; i++) {
        sort(hang[i].begin(),hang[i].end());
        sort(cot[i].begin(),cot[i].end());
    }
}

int Get(vector <int> &X,vector <int> &A,int x,int Real,int L,int R) {
    if (x == X.size() || X[x] != Real) {
        return 0;
    }
    int Left = lower_bound(A.begin(),A.end(),L) - A.begin();
    int Right = upper_bound(A.begin(),A.end(),R - 1) - A.begin();
    return Right - Left;
}
void solve() {
    int Test = ReadInt();
    while (Test--) {
        int x1 = ReadInt();
        int y11 = ReadInt();
        int x2 = ReadInt();
        int y2 = ReadInt();
        //cout << x1 << " " << x2 << '\n';
        int xL = lower_bound(A.begin(),A.end(),x1) - A.begin();
        int xR = lower_bound(A.begin(),A.end(),x2) - A.begin();
        int yL = lower_bound(B.begin(),B.end(),y11) - B.begin();
        int yR = lower_bound(B.begin(),B.end(),y2) - B.begin();
        int Res = 0;
        Res += Get(B,cot[yL],yL,y11,x1,x2);
        //cout << Res << ' ';
        Res += Get(A,hang[xR],xR,x2,y11,y2);
        //cout << Res << ' ';
        Res += Get(B,cot[yR],yR,y2,x1 + 1,x2 + 1);
        //cout << Res << ' ';
        Res += Get(A,hang[xL],xL,x1,y11 + 1,y2 + 1);
        //cout << Res << '\n';
        WriteInt(Res);
        putchar('\n');
    }
}
int main() {
    ios_base::sync_with_stdio(0);
    cin.tie(nullptr);
    cout.tie(nullptr);
    nhap();
    solve();
}
