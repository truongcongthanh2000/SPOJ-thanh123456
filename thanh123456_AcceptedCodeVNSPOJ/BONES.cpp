#include <bits/stdc++.h>
using namespace std;
int s1,s2,s3,f[100000];
int main() {
	scanf("%d%d%d",&s1,&s2,&s3);
	for (int i=1; i<=s1; i++)
	{
		for (int j=1; j<=s2; j++)
		{
			for (int k=1; k<=s3; k++)
			{
				f[i+j+k]++;
			}
		}
	}
	int res = 0 ;
	for (int i=1; i<=s1+s2+s3; i++)
	{
		if (f[i]>f[res]) {res=i;}
	}
	cout<<res<<endl;
	return 0;
}