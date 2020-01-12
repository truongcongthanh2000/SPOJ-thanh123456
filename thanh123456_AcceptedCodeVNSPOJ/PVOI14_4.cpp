#include <bits/stdc++.h>

using namespace std;
#define TASK "CHUM"

const int N = 2e5 + 100;
int n,a[N],m;
int IT[5][N * 4];

void doc() {
    cin >> n;
    assert(n >= 1 && n <= 200000);
    vector <int> B;
    for (int i = 1; i <= n; i++) {
        cin >> a[i];
        B.push_back(a[i]);
        assert(a[i] >= 1 && a[i] <= 1000000000);
    }
    sort(B.begin(),B.end());
    B.resize(unique(B.begin(),B.end()) - B.begin());
    for (int i = 1; i <= n; i++) {
        a[i] = lower_bound(B.begin(),B.end(),a[i]) - B.begin() + 1;
    }
    m = B.size();
}

void update(int i,int L,int R,int u,int mask,int val) {
    if (L > u || R < u) {
        return;
    }
    if (L == R) {
        IT[mask][i] = max(IT[mask][i],val);
        return;
    }
    int mid = (L + R) >> 1;
    update(i << 1,L,mid,u,mask,val);
    update(i << 1 | 1,mid + 1,R,u,mask,val);
    IT[mask][i] = max(IT[mask][i << 1],IT[mask][i << 1 | 1]);
}

int Get(int i,int L,int R,int u,int v,int mask) {
    if (L > v || R < u) {
        return 0;
    }
    if (L >= u && R <= v) {
        return IT[mask][i];
    }
    int mid = (L + R) >> 1;
    int Left = Get(i << 1,L,mid,u,v,mask);
    int Right = Get(i << 1 | 1,mid + 1,R,u,v,mask);
    return max(Left,Right);
}

void solve() {
    int Res = 0;
    for (int i = 1; i <= n; i++) {
        int D;
        D = Get(1,1,m,1,a[i] - 1,1);
        update(1,1,m,a[i],1,D + 1);
        int D1 = Get(1,1,m,a[i] + 1,m,1);
        int D2 = Get(1,1,m,a[i] + 1,m,2);
        D = max(D1,D2);
        if (D >= 2) {
            update(1,1,m,a[i],2,D + 1);
        }
        D1 = Get(1,1,m,1,a[i] - 1,2);
        D2 = Get(1,1,m,1,a[i] - 1,3);
        D = max(D1,D2);
        if (D >= 3) {
            update(1,1,m,a[i],3,D + 1);
        }
        D1 = Get(1,1,m,a[i] + 1,m,3);
        D2 = Get(1,1,m,a[i] + 1,m,4);
        D = max(D1,D2);
        if (D >= 4) {
            update(1,1,m,a[i],4,D + 1);
            Res = max(Res,D + 1);
        }
    }
    cout << Res;
}

int main() {
    ios_base::sync_with_stdio(0);
    cin.tie(NULL);
    cout.tie(NULL);
    doc();
    solve();
}
