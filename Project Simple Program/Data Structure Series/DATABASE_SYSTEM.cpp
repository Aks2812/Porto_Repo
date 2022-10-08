#include <stdio.h>
#include <string.h>
#include <stdlib.h>

struct data{
    char Name[100];
    char Code[7];
    char Platform[20];

    data *right,*left;
    int height;
};

data *createData(char Name[100], char Code[7], char Platform[20]){
    data *newdata = (data *)malloc(sizeof(data));
    strcpy(newdata->Name,Name);
    strcpy(newdata->Code,Code);
    strcpy(newdata->Platform,Platform);

    newdata->right = NULL;
    newdata->left = NULL;
    newdata->height = 1;

    return newdata;
}

int getMax(int a,int b){
    return a > b ? a : b;
}

int getHeight(data *root){
    if(root == NULL){
        return 0;
    }else {
        return root->height;
    }
}

void updateHeight(data *root){
    root->height = getMax(getHeight(root->left), getHeight(root->right)) + 1;
}

int getbalancefactor(data *root){
    return getHeight(root->left) - getHeight(root->right);
}

data *leftRotate(data *root){
    data *child = root->right;
    data *gchild = child->left;

    child->left = root;
    root->right = gchild;

    updateHeight(root);
    updateHeight(child);

    return child;
}

data *rightRotate(data *root){
    data *child = root->left;
    data *gchild = child->right;

    child->right = root;
    root->left = gchild;

    updateHeight(root);
    updateHeight(child);

    return child;
}


data *Insert(data *root,char Name[100],char Code[7],char Platform[20]){
    if(root == NULL){
        return createData(Name,Code,Platform);
    }else if(strcmp(Code,root->Code) < 0){
        root->left = Insert(root->left,Name,Code,Platform);
    }else if(strcmp(Code,root->Code) > 0){
        root->right = Insert(root->right,Name,Code,Platform);
    }

    updateHeight(root);

    int balancefactor = getbalancefactor(root);

    if(balancefactor > 1 && getbalancefactor(root->left) >= 0){
        return rightRotate(root);
    }else if(balancefactor < -1 && getbalancefactor(root->right) <= 0){
        return leftRotate(root);
    }else if(balancefactor > 1 && getbalancefactor(root->left) < 0){
        root->left = leftRotate(root);
        return rightRotate(root);
    }else if(balancefactor < -1 && getbalancefactor(root->right) > 0){
        root->right = rightRotate(root);
        return leftRotate(root);
    }
    return root;
}

bool NameValid(data *root,char Name[100]){
    if(Name[0] >= 'A' && Name[0] <= 'Z')return true;

    return false;
}

bool CodeValid(data *root, char Code[7]){
    if(strlen(Code) < 5 || strlen(Code) > 5)return false;

    return true;
}

data *pushData(data *root){
    char Name[100];
    char Code[7];
    char Platform[20];

    do{
        printf("Input Your Name [Capital Letter]: ");
        scanf("%[^\n]",Name);getchar();
    }while(!NameValid(root,Name));

    do{
        printf("Input Your Code [5 Char for Code]: ");
        scanf("%[^\n]",Code);getchar();
    }while(!CodeValid(root,Code));

    do{
        printf("Input Platform Name [Steam | Epic Games | Origin]: ");
        scanf(" %[^\n]",Platform);getchar();
    }while(strcmp(Platform, "Steam") != 0 &&
           strcmp(Platform, "Epic Games") != 0 &&
           strcmp(Platform, "Origin") != 0
    );

    root = Insert(root,Name,Code,Platform);
    return root;
}

void View(data *root){
    if(root == NULL){
        return;
    }
    View(root->left);
    puts("=========================");
    printf("Name        : %s",root->Name);
    printf("Code        : %s",root->Code);
    printf("Platform    : %s",root->Platform);
    puts("=========================");
    View(root->right);
}

int main(){

    data *root = NULL;
    int input;

    do{
        puts("1. Input Data ");
        puts("2. View ");
        puts("0. Exit" );
        printf(">> ");
        scanf("%d",&input);getchar();
        
        if(input==1){
            root = pushData(root);
            system("cls");
        }else if(input==2){
            View(root);
        }else if(input==0){
            puts("GOOD BYE");
        }
    }while(input!=0);

    return 0;
}