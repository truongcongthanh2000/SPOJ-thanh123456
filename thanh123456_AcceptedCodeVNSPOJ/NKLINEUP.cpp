#include <bits/stdc++.h>

using namespace std;
#define TASK "QUERY3"

struct Node {
    int Min,Max;
    Node(){};
    Node (int a,int b) {
        Min = a;
        Max = b;
    }
};

const int N = 1e5 + 100;
Node IT[N * 4];
int n,a[N],q;

void doc() {
    scanf("%d %d",&n,&q);
    for (int i = 1; i <= n; i++) {
        scanf("%d",&a[i]);
    }
}

Node Get(Node Left,Node Right) {
    Node Res;
    Res.Min = min(Left.Min,Right.Min);
    Res.Max = max(Left.Max,Right.Max);
    return Res;
}

void build(int i,int l,int r) {
    if (l == r) {
        IT[i] = Node(a[l],a[l]);
        return;
    }
    int mid = (l + r) >> 1;
    build(i << 1,l,mid);
    build(i << 1 | 1,mid + 1,r);
    IT[i] = Get(IT[i << 1],IT[i << 1 | 1]);
}

Node Get(int i,int l,int r,int u,int v) {
    if (l > v || r < u) {
        return Node(13082000,-13082000);
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
    for (int i = 1; i <= q; i++) {
        int L,R;
        scanf("%d %d",&L,&R);
        Node GT = Get(1,1,n,L,R);
        cout << GT.Max - GT.Min << '\n';
    }
}
int main() {
    doc();
    build(1,1,n);
    solve();
}
