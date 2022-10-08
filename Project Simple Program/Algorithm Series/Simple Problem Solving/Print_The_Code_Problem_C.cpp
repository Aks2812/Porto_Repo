#include <stdio.h>

int main(){

    char str[100];

    scanf("%[^\n]", str);getchar();
    printf("#include <stdio.h>\nint main()\n{\n    printf(\"%%s\\n\",\"%s\");\n    return 0;\n}",str);    
    return 0;
}