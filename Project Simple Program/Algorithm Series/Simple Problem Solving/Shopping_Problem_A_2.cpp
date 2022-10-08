#include <stdio.h>

int main() {

    int i;
    double n,p, cal = 0, count = 0;
    int j = 4;
    double hasil[j];

    for(i = 1; i <= j; i++) {
        scanf("%lf %lf", &n, &p);getchar();
        cal = p*100;
        count = cal / (100-n);
        hasil[i] = count;
    }
    puts("");
    for(i = 1; i <= j; i++) {
        printf("$%.2lf\n", hasil[i]);
    }

    return 0;
}