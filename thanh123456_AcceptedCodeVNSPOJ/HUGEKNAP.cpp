#include <bits/stdc++.h>
using namespace std;
 
int F[1010];
int bit[1010][350];
int W[10010], V[10010];
int n, m;
 
int main() {
	int st;
	scanf("%d", &st);
	while(st--) {
		scanf("%d%d", &n, &m);
		for(int i=0;i<n;++i)
			scanf("%d", &W[i]);
		for(int i=0;i<n;++i) 
			scanf("%d", &V[i]);
		memset( F, 0, sizeof(F));
		memset( bit, 0, sizeof(bit));
		for(int i=0;i<n;++i) {
			for(int j=m;j>=W[i];--j) {
				if(F[j] < F[j-W[i]] + V[i]) {
					F[j] = F[j-W[i]] + V[i];
					bit[j][i/30] |= 1 << (i%30);
				}
			}
		}
		int max = max_element( F, F+m+1) - F;
		printf("%d ", F[max]);
		int w = max, p = n-1;
		int dem = 0;
		while(w>0) {
			if((bit[w][p/30] & (1<<(p%30))) != 0) {
				w -= W[p];
				++dem;
			}
			--p;
		}
		printf("%d\n", dem);
		w = max, p = n-1;
		while(w>0) {
			if((bit[w][p/30] & (1<<(p%30))) != 0) {
				w -= W[p];
				printf("%d ", p+1);
			}
			--p;
		}
	}
	return 0;
}
 