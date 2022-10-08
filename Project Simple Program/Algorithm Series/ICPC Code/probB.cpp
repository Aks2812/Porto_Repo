#include <stdio.h>

int main(){
		
	int N,a,b;
	
	scanf("%d",&N);
	int arr_N[N][N];
	for(a=0;a<N;a++){
		for(b=0;b<N;b++){
			scanf("%d",&arr_N[a][b]);
		}
	}
	
	for(int j=0; j<N; j++){
	int hitungPohonTerlihat = 1;     //hitungPohonTerlihat
	for(int i=N-1; i>0; i--){
		int flag = 1;
		int node = arr_N[i][j];
	
	for(int k=i-1; k>=0; k--){
		if(node < arr_N[k][j]){
		flag = 0;
		break;
		}
	}
		if(flag == 1)
		hitungPohonTerlihat++;
	}
	
	printf("%d ", hitungPohonTerlihat);
	}
	
	printf("\n");
	
	//hitung jumlah pohon yang terlihat di Lestari
	for(int i=0; i<N; i++){
		int hitungPohonTerlihat = 1;
		for(int j=N-1; j>0; j--){
	int flag = 1;
	int node = arr_N[i][j];
	
	for(int k = j-1; k>=0; k--){
	if(node < arr_N[i][k])
		{
		flag = 0;
		break;
		}
	}
	
	if(flag == 1)
	hitungPohonTerlihat++;
	}
	printf("%d\n", hitungPohonTerlihat);
	}
	
	return 0;
	}
	


