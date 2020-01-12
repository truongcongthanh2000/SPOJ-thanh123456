#include <bits/stdc++.h>

using namespace std;
#define TASK "IT_D"
const int N = 3e5 + 100;

struct Query {
    int L,R;
    int pos;
};
bool cmp(Query a,Query b) {
    return a.R < b.R;
}
int n,Q;
int a[N],last_pos[N];
Query c[N];
int IT[N * 4];
void doc() {
    cin >> n;
    vector <int> B;
    for (int i = 1; i <= n; i++) {
        cin >> a[i];
        B.push_back(a[i]);
        last_pos[i] = 0;
    }
    sort(B.begin(),B.end());
    B.resize(unique(B.begin(),B.end()) - B.begin());
    for (int i = 1; i <= n; i++) {
        a[i] = lower_bound(B.begin(),B.end(),a[i]) - B.begin() + 1;
    }
    cin >> Q;
    for (int i = 1; i <= Q; i++) {
        cin >> c[i].L >> c[i].R;
        c[i].pos = i;
    }
    sort(c + 1,c + 1 + Q,cmp);
}

void update(int i,int L,int R,int u,int val) {
    if (L > u || R < u) {
        return;
    }
    if (L == R) {
        IT[i] += val;
        return;
    }
    int mid = (L + R) >> 1;
    update(i << 1,L,mid,u,val);
    update(i << 1 | 1,mid + 1,R,u,val);
    IT[i] = IT[i << 1] + IT[i << 1 | 1];
}

int Get(int i,int L,int R,int u,int v) {
    if (L > v || R < u) {
        return 0;
    }
    if (L >= u && R <= v) {
        return IT[i];
    }
    int mid = (L + R) >> 1;
    int Left = Get(i << 1,L,mid,u,v);
    int Right = Get(i << 1 | 1,mid + 1,R,u,v);
    return Left + Right;
}

void solve() {
    int Start = 0;
    int Res[Q + 1];
    for (int tt = 1; tt <= Q; tt++) {
        for (int i = Start + 1; i <= c[tt].R; i++) {
            if (last_pos[a[i]] > 0) {
                update(1,1,n,last_pos[a[i]],-1);
            }
            update(1,1,n,i,1);
            last_pos[a[i]] = i;
        }
        Res[c[tt].pos] = Get(1,1,n,c[tt].L,c[tt].R);
        Start = c[tt].R;
    }
    for (int i = 1; i <= Q; i++) {
        cout << Res[i] << '\n';
    }
}

int main() {
    ios_base::sync_with_stdio(0);
    cin.tie(NULL);
    cout.tie(NULL);
    doc();
    solve();
}
