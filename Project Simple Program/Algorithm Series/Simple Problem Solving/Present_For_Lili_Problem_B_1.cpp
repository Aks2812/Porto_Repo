#include <stdio.h>

int main(){

    double L,B,H,cal;

    scanf("%lf %lf %lf",&L,&B,&H);getchar();
    cal = (2*(0.5 * B * H)) + (3*(L*B));
    printf("%.3lf\n",cal);

    return 0;
}