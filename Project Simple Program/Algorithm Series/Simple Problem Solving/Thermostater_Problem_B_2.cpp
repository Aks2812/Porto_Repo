#include <stdio.h>

int main(){

    int T,Celcius;
    double reamur,fahrenheit,kelvin;
    double convert_re,convert_f,convert_kelv;

    scanf("%d",&T);getchar();
    for(int i=0; i<T; i++) {
        scanf("%d",&Celcius);getchar();
        
        convert_re = (4 * Celcius) / 5;
        convert_f = (9 * Celcius) / 5 + 32;
        convert_kelv = Celcius + 273; 
        
        printf("%.2lf %.2lf %.2lf\n",convert_re,convert_f,convert_kelv);
    }

    return 0;
}