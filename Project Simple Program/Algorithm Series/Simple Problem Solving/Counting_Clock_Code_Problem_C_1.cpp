#include <stdio.h>

int main() {

    int T;
    double A,B,cal;

    scanf("%d",&T);getchar();
    for(int i=0;i<T;i++) {
        scanf("%lf %lf", &A, &B);getchar();
        cal = (A*B) / 360;
        printf("%.2lf\n",cal);
    }
    return 0;
}