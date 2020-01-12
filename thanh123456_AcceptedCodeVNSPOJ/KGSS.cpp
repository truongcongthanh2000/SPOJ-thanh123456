#include <bits/stdc++.h>

using namespace std;
#define TASK "PAIRMAX"

struct Node {
    int Res,Pos;
    Node(){};
    Node (int a,int b) {
        Res = a;
        Pos = b;
    }
};

const int N = 1e5 + 100;
const int oo = 1e9 + 100;
int n,a[N];
Node IT[N * 4];

void doc() {
    scanf("%d",&n);
    for (int i = 1; i <= n; i++) {
        scanf("%d",&a[i]);
    }
}

Node Get(Node Left,Node Right) {
    if (Left.Res >= Right.Res) {
        return Left;
    }
    else {
        return Right;
    }
}
void build(int i,int l,int r) {
    if (l == r) {
        IT[i] = Node(a[l],l);
        return;
    }
    int mid = (l + r) >> 1;
    build(i << 1,l,mid);
    build(i << 1 | 1,mid + 1,r);
    IT[i] = Get(IT[i << 1],IT[i << 1 | 1]);
}

void update(int i,int l,int r,int u,int x) {
    if (l > u || r < u) {
        return;
    }
    if (l == r) {
        IT[i] = Node(x,u);
        return;
    }
    int mid = (l + r) >> 1;
    update(i << 1,l,mid,u,x);
    update(i << 1 | 1,mid + 1,r,u,x);
    IT[i] = Get(IT[i << 1],IT[i << 1 | 1]);
}

Node Get(int i,int l,int r,int u,int v) {
    if (l > v || r < u) {
        return Node(0,0);
    }
    if (l >= u && r <= v) {
        return IT[i];
    }
    int mid = (l + r) >> 1;
    Node Left = Get(i << 1,l,mid,u,v);
    Node Right = Get(i << 1 | 1,mid + 1,r,u,v);
    return Get(Left,Right);
}

void solve() {
    int q;
    scanf("%d\n",&q);
    ios_base::sync_with_stdio(1);
    cin.tie(NULL);
    for (int i = 1; i <= q; i++) {
    	char Type;
        int L,R;
        cin >> Type >> L >> R;
        if (Type == 'U') {
            update(1,1,n,L,R);
        }
        else {
            Node Res1 = Get(1,1,n,L,R);
            Node Res2 = Get(1,1,n,L,Res1.Pos - 1);
            Node Res3 = Get(1,1,n,Res1.Pos + 1,R);
            cout << Res1.Res + max(Res2.Res,Res3.Res) << '\n';
        }
    }
}
int main() {
    doc();
    build(1,1,n);
    solve();
}
