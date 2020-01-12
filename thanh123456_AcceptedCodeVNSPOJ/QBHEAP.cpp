#include <bits/stdc++.h>
#define pb push_back
#define p push
#define mp make_pair
using namespace std;
typedef pair<int,int> i2;
const int N = 5e5 + 1;
const int limit = 15000;
const int oo = 1e9 + 100;
int ReadInt()
{
    int res = 0;
    char c;
    bool kt = false;
    c = getchar();
    if (c == '-') {kt = true;}
    else {
        res = res * 10 + (c - '0');
    }
    for (c = getchar(); c >= '0' && c <= '9'; c = getchar()) {
        res = res * 10 + (c - '0');
    }
    return (kt ? (0 - res) : res);
}
int top = 0;
int a[limit + 1];
void nhap()
{
    //freopen("solve.inp","r",stdin);
    //freopen("solve.out","w",stdout);
    memset(a,0,sizeof(a));
}
// HEAP MAX
void UpHeap(int i)
{
    if (i == 1 || a[i] <= a[i / 2]) {return;}
    swap(a[i],a[i / 2]);
    UpHeap(i / 2);
}
void DownHeap(int i)
{
    int j = 2 * i;
    if (j > top) {return;}
    if (j < top && a[j] < a[j + 1]) {j++;}
    if (a[i] < a[j]) {
        swap(a[i],a[j]);
        DownHeap(j);
    }
}
void push(int x)
{
    top++;
    a[top] = x;
    UpHeap(top);
}
int Get_Heap()
{
    return a[1];
}
void Pop()
{
    swap(a[1],a[top]); //Cho thằng cuối cùng làm đỉnh Heap tạm thời
    a[top] = 0; // Clear thằng được swap
    top--;
    DownHeap(1);
}
void solve()
{
    bool ThanhYeuThu = true;
    while (ThanhYeuThu) {
        char c = getchar();
        if (c != '+' && c != '-') {
            return;
        }
        if (c == '-') {
            int Gt_Heap = Get_Heap(); // Lấy thằng lớn nhất ra
            while (top && Get_Heap() == Gt_Heap) {
                Pop();
            }
            scanf("\n");
            continue;
        }
        int x;
        scanf("%d\n",&x);
        if (top < limit) {
            push(x);
        }
    }
}
void Print()
{
    vector <int> Res;
    Res.clear();
    while (top) {
        int Gt_Heap = Get_Heap();
        while (Get_Heap() == Gt_Heap) {
            Pop();
        }
        Res.push_back(Gt_Heap);
    }
    cout << Res.size() << '\n';
    for (int i = 0; i < Res.size(); i++) {
        cout << Res[i] << '\n';
    }
}
int main()
{
    nhap();
    solve();
    Print();
}
