#include <bits/stdc++.h>
using namespace std;
const int N = 2e6 + 100;
const int oo = 1e9 + 100;
int test,n,m,link[N],de[N],f[N],nhan[N],p[N],s,t;
vector <int> a[N],b[N],vt[N];
void nhap()
{
    scanf("%d %d %d %d",&n,&m,&s,&t);
}
void push(int u,int v,int c,int i)
{
    a[u].push_back(v);
    b[u].push_back(c);
    vt[u].push_back(i);
}
void taomang()
{
    for (int i = 1; i <= n; i++) {
        a[i].clear();
        b[i].clear();
        vt[i].clear();
    }
    for (int i = 1; i <= m; i++) {
        int u,v,c;
        scanf("%d %d %d",&u,&v,&c);
        push(u,v,c,i);
        link[i] = i + m;
        p[i] = c;
        push(v,u,c,i + m);
        p[i + m] = 0;
        link[i + m] = i;
    }
}
void build()
{
    for (int i = 1; i <= 2 * m; i++) {de[i] = oo;}
    for (int i = 1; i <= 2 * m; i++) {
        if (p[i] > 0) {
            if (f[i] < p[i]) {
                de[i] = p[i] - f[i];
            }
            if (f[i] > 0) {
                de[link[i]] = -f[i];
            }
        }
    }
}
bool BFS()
{
    for (int i = 1; i <= n; i++) {nhan[i] = 0;}
    queue <int> q;
    nhan[s] = s;
    q.push(s);
    while (q.size() != 0) {
        int u = q.front();
        q.pop();
        for (int i = 0; i < a[u].size(); i++) {
            int v = a[u][i];
            int pos = vt[u][i];
            //cout<<u<<" "<<v<<" "<<pos<<endl;
            if (nhan[v] == 0 && de[pos] != oo) {
                nhan[v] = u;
                if (v == t) {return true;}
                q.push(v);
            }
        }
    }
    return false;
}
void TangLuong()
{
    int v = t;
    int dem = oo;
    do
    {
        int u = nhan[v];
        for (int i = 0; i < a[u].size(); i++) {
            if (a[u][i] == v) {
                int pos = vt[u][i];
                dem = min(dem,abs(de[pos]));
                v = u;
                break;
            }
        }
    }
    while (v != s);
    v = t;
    do
    {
        int u = nhan[v];
        for (int i = 0; i < a[u].size(); i++) {
            if (a[u][i] == v) {
                int pos = vt[u][i];
                if (de[pos] > 0) {f[pos] = f[pos] + dem;}
                else {f[link[i]] = f[link[i]] - dem;}
                v = u;
                break;
            }
        }
    }
    while (v != s);
}
void LuongCucDai()
{
    do
    {
        build();
        if (BFS() == false) {break;}
        TangLuong();
        //break;
    }
    while (1 < 2);
}
int get()
{
    for (int i = 1; i <= 2 * m; i++) {f[i] = 0;}
    LuongCucDai();
    int res = 0;
//    for (int i = 1; i <= 2 * m; i++) {
//        cout<<f[i]<<endl;
//    }
    for (int i = 0; i < a[s].size(); i++) {
        int pos = vt[s][i];
        res+=f[pos];
    }
    return res;
}
void giai()
{
    int res = oo;
    res = get();
    cout<<res;
}
void solve()
{
    giai();
}
int main()
{
    nhap();
    taomang();
    solve();
}
