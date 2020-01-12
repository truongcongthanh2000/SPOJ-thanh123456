#include <bits/stdc++.h>
using namespace std;
 
int main() {
	int m, n; cin >> m >> n;
	int arr[m][n];
	for (int i = 0; i < m; i++) {
		for (int j = 0; j < n; j++) cin >> arr[i][j];
	}
	for (int i = 1; i < n; i++) {
		for (int j = 0; j < m; j++) {
			int maxx = -10000;
			if (j - 1 >= 0) maxx = max(maxx, arr[j - 1][i - 1]);
			maxx = max(maxx, arr[j][i - 1]);
			if (j + 1 < m) maxx = max(maxx, arr[j + 1][i - 1]);
			arr[j][i] += maxx;
		}
	}
	int res = -100000000;
	for (int i = 0; i < m; i++) res = max(res, arr[i][n - 1]);
	cout << res;
}