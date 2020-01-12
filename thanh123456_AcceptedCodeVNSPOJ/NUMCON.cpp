#include <bits/stdc++.h>
using namespace std;
const int N = 1e5 + 10;
int n;
string s[N];
bool cmp(string a,string b)
{
    return a + b > b + a;
}
void nhap()
{
    ios_base::sync_with_stdio(1);
    cin.tie(NULL);
   	n = 0;
   	while (cin>>s[n++]) {
   		;
   	}
    sort(s,s + n,cmp);
    for (int i = 0; i < n; i++) {
        cout<<s[i];
    }
}
int main()
{
    nhap();
}
