#include <bits/stdc++.h>
#define ll long long
using namespace std;
const int module = 1e9+7;
const int N = 5e5+7;
struct ds
{
    int c[30],check;
};
string s;
int n,f[N],root,len;
ds t[N];
void nhap()
{
    getline(cin,s);
    scanf("%d\n",&n);
}
void add(string s)
{
    int root = 1;
    for (int i=s.size()-1; i>=0; i--)
    {
        if (t[root].c[s[i]-'a']==0)
        {
            len++;
            t[root].c[s[i]-'a']=len;
            root = len;
        }
        else {root = t[root].c[s[i]-'a'];}
    }
    t[root].check = 1;
}
void tao_mang()
{
    len = 1;
    for (int i=1; i<=n; i++)
    {
        string t;
        getline(cin,t);
        //cout<<t<<endl;
        add(t);
    }
}
void solve()
{
    f[0] = 1;
    for (int i=1; i<=s.size(); i++)
    {
        int j = i-1;
        int start = 1;
        while (j>=0 && t[start].c[s[j]-'a']!=0)
        {
            start = t[start].c[s[j]-'a'];
            if (t[start].check==1) {f[i]=(f[i]+f[j]) % 1337377;}
            j--;
        }
    }
    cout<<f[s.size()]<<endl;
}
int main()
{
    nhap();
    tao_mang();
    solve();
}