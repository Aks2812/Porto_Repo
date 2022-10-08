#include <stdio.h>

int main() {

    int N,X,Y;
    float disc,tax,total;

    scanf("%d %d %d", &N, &X, &Y);getchar();
    disc = N - (N*X/100);
    tax = Y * disc / 100;
    total = tax + disc;
    printf("%.2f\n",disc);
    return 0;
}