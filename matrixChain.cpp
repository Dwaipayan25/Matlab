#include <bits/stdc++.h>
using namespace std;
#define int long long int

int mChain(int arr[],int i,int j){
	if(i+1==j)
		return 0;
	int res=INT_MAX;
	for(int k=i+1;k<j;k++){
		res=min(res,( mChain(arr,i,k)+mChain(arr,k,j)+ (arr[i]*arr[k]*arr[j]) ));
	}
	return res;
}

int mChain1(int arr[],int n){
	int dp[n][n];
	for(int i=0;i<n;i++){
		dp[i][i+1]=0;
	}
	for(int gap=2;gap<n;gap++){
		for(int i=0;i+gap<n;i++){
			int j=i+gap;
			dp[i][j]=INT_MAX;
			for(int k=i+1;k<j;k++){
				dp[i][j]=min(dp[i][j],dp[i][k]+dp[k][j]+arr[i]*arr[j]*arr[k]);
			}
		}
	}

	return dp[0][n-1];
}

signed main(){

	#ifndef ONLINE_JUDGE
    //for getting input from input.txt
    freopen("input.txt","r",stdin);
    //for getting output from output.txt
    freopen("output.txt","w",stdout);
    freopen("Error.txt", "w", stderr);
    #endif

	int n;cin>>n;
	int arr[n];
	for(int i=0;i<n;i++)cin>>arr[i];
	// int ans=mChain(arr,0,n-1);
	int ans=mChain1(arr,n);
	cout<<ans<<endl;
}