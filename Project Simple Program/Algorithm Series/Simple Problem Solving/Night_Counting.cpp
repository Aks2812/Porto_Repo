#include <stdio.h>

int main(){

    int N,M,i,j;

    scanf("%d %d",&N, &M);getchar();
    for(i = 0; i < M; i++){
        printf("%d\n", N++);
    }
    return 0;
}