#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
using namespace std;
typedef pair<int,int> i2;
const int N = 5e3 + 1;
const int oo = 1e9 + 100;
int n;
int ReadInt()
{
	int res;
    scanf("%d",&res);
    return res;
}
set <int> S;
void nhap()
{
}
void add(int x)
{
    S.insert(x);
}
void DEL(int x)
{
    S.erase(x);
}
int Min()
{
    set <int> :: iterator it = S.begin();
    int res = *it;
    return res;
}
int Max()
{
    set <int> :: iterator it = S.end();
    it--;
    int res = *it;
    return res;
}
void Get_Succ(int x,int gt)
{
    if (S.size() == 0) {cout << "empty" << '\n'; return;}
    set <int> :: iterator pos;
    if (gt) {pos  = S.upper_bound(x);}
    else {pos = S.lower_bound(x);}
    if (pos == S.end()) {cout<<"no"<<'\n'; return;}
    cout << *pos << '\n';
}
void Get_Pred(int x,int gt)
{
    if (S.size() == 0) {cout << "empty" << '\n'; return;}
    set <int> :: iterator pos;
    if (gt) {pos = S.lower_bound(x);}
    else {pos = S.upper_bound(x);}
    if (pos == S.begin()) {cout<<"no"<<'\n'; return;}
    pos--;
    cout << *pos << '\n';
}
void solve()
{
    while (1 < 2) {
        int type = ReadInt();
        if (type == 0) {break;}
        if (type == 1) {
            int x = ReadInt();
            add(x);
        }
        if (type == 2) {
            int x = ReadInt();
            DEL(x);
        }
        if (type == 3) {
            if (S.size() == 0) {cout << "empty" << '\n';}
            else cout << Min() <<'\n';
        }
        if (type == 4) {
            if (S.size() == 0) {cout << "empty" << '\n';}
            else cout << Max() <<'\n';
        }
        if (type == 5) {
            int x = ReadInt();
            Get_Succ(x,1);
        }
        if (type == 6) {
            int x = ReadInt();
            Get_Succ(x,0);
        }
        if (type == 7) {
            int x = ReadInt();
            Get_Pred(x,1);
        }
        if (type == 8) {
            int x = ReadInt();
            Get_Pred(x,0);
        }
    }
}
int main()
{
    nhap();
    solve();
}
