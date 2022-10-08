#include <stdio.h>

int main() {

    int a,b,c,d,i,count = 0;
    int j = 3;
    int hasil[j];

    for(i = 1; i<=j; i++) {
        scanf("(%d+%d)x(%d-%d)", &a, &b,&c, &d);getchar();
        count = (a+b)*(c-d);
        hasil[i] = count;
    }
    for(i = 1; i<=j; i++) {
        printf("%d ",hasil[i]);
    }
    
    return 0;
}