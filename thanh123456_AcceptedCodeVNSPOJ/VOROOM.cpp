#include <bits/stdc++.h>
using namespace std;
const int N = 2e5 + 100;
int n,stk[N],top = 0,match[N],nlink,link[N],kt[N],bac[N],f[N];
int low[N],number[N],tp[N],tplt = 0,Count = 0,sl[N],Loai = 0;
bool dd[N],Found;
stack <int> st;
vector <int> a[N],b[N],pos[N],t[N];
struct ds
{
    int u,v;
}c[N];
void nhap()
{
    scanf("%d",&n);
    for (int i = 1; i <= n; i++) {
        int x,y;
        scanf("%d %d",&x,&y);
        a[i].push_back(x);
        a[i].push_back(y);
        b[x].push_back(y);
        b[y].push_back(x);
        pos[x].push_back(i);
        pos[y].push_back(i);
        c[i].u = x;
        c[i].v = y;
    }
}
void dfs(int u)
{
    for (int i = 0; i < a[u].size(); i++) {
        int v = a[u][i];
        if (dd[v] == false) {
            dd[v] = true;
            stk[++top] = v;
            if (match[v] == 0) {Found = true;}
            else {dfs(match[v]);}
            if (Found) {
                match[v] = u;
                return;
            }
        }
    }
}
void init(int u,int v)
{
    a[n + 1].clear();
    a[n + 1].push_back(u);
    a[n + 1].push_back(v);
    nlink = n + 1;
    for (int i = 1; i <= n + 1; i++) {
        match[i] = 0;
        link[i] = i;
    }
}
bool CapGhep()
{
    int Old;
    do
    {
        Old = nlink;
        for (int i = 1; i <= top; i++) {
            dd[stk[i]] = false;
        }
        top = 0;
        for (int i = nlink; i >= 1; i--) {
            Found = false;
            dfs(link[i]);
            if (Found) {
                link[i] = link[nlink];
                nlink--;
            }
        }
    }
    while (Old != nlink);
    if (nlink == 0) {return true;}
    else {return false;}
}
void vet()
{
    int res = 0;
    for (int i = 1; i <= n + 1; i++) {
        for (int j = i + 1; j <= n + 1; j++) {
            init(i,j);
            if (CapGhep()) {
                //cout<<i<<" "<<j<<endl;
                res++;
            }
        }
    }
    cout<<res;
}
bool cmp(ds a,ds b)
{
    return (a.u < b.u) || (a.u == b.u && a.v < b.v);
}
void visit(int u)
{
    low[u] = number[u] = ++Count;
    st.push(u);
    for (int i = 0; i < b[u].size(); i++) {
        int v = b[u][i];
        int vt = pos[u][i];
        if (f[vt] == 0) {
            f[vt] = 1;
            if (number[v]) {low[u] = min(low[u],number[v]);}
            else {
                visit(v);
                low[u] = min(low[u],low[v]);
            }
        }
    }
    if (low[u] >= number[u]) {
        int v;
        tplt++;
        do {
            v = st.top();
            st.pop();
            tp[v] = tplt;
            sl[tplt]++;
        }
        while (u != v);
    }
}
void tarjan()
{
    for (int i = 1; i <= n + 1; i++) {
        if (number[i] == 0) {
            int tam = Count;
            visit(i);
        }
    }
}
void taomang()
{
    for (int i = 1; i <= n; i++) {
            int u = c[i].u;
            int v = c[i].v;
            if (tp[u] == tp[v]) {
                bac[u]++;
                bac[v]++;
            }
            else {
                t[tp[u]].push_back(tp[v]);
                t[tp[v]].push_back(tp[u]);
            }
    }
}
void tham(int u)
{
    kt[u] = 1;
    Loai += sl[u];
    for (int i = 0; i < t[u].size(); i++) {
        int v = t[u][i];
        if (kt[v] == 0) {
            if (sl[v] >= 2) {
                Found = false;
                return;
            }
            tham(v);
            if (Found == false) {return;}
        }
    }
}
void FULL()
{
    sort(c + 1,c + 1 + n,cmp);
    for (int i = 1; i <= n; ) {
        int j = i;
        while (c[i].u == c[j].u && c[i].v == c[j].v) {
            j++;
        }
        if (j - i > 2) {cout<<0; return;}
        i = j;
    }
    tarjan();
    taomang();
    Loai = 0;
    for (int i = 1; i <= n + 1; i++) {
        if (bac[i] > 2) {cout<<0; return;}
    }
    for (int i = 1; i <= n + 1; i++) {
        kt[i] = 0;
    }
    Found = true;
    for (int i = 1; i <= tplt; i++) {
        if (kt[i] == 0 && sl[i] >= 2) {
            tham(i);
            if (Found == false) {
                cout<<0;
                return;
            }
        }
    }
    int Chon = (n + 1) - Loai;
    //cout<<Loai<<" "<<Chon<<endl;
    long long res = 1ll * Loai * Chon + 1ll * Chon * (Chon - 1) / 2;
    cout<<res;
}
void solve()
{
    //FULL();
    if (n <= 100) {
        vet();
    }
    else {
        FULL();
    }
}
int main()
{
    nhap();
    solve();
}

