#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

struct Data{
    char GameName[100];
    char DevName[50];
    int DayRel;
    int MonthRel;
    int YearRel;
    int GamePrice;

    Data *left,*right;
    int height;
};


Data *createdata(char GameName[100],char DevName[50],int DayRel,int MonthRel,int YearRel,int GamePrice) {
    Data *newdata = (Data*)malloc(sizeof(Data));
    strcpy(newdata->GameName,GameName);
    strcpy(newdata->DevName,DevName);
    newdata->DayRel = DayRel;
    newdata->MonthRel = MonthRel;
    newdata->YearRel = YearRel;
    newdata->GamePrice = GamePrice;

    newdata->height = 1;
    newdata->left = NULL;
    newdata->right = NULL;

    return newdata;
}


int Max(int x, int y){
    
    return x > y ? x : y; 
}


int getHeight(Data *root){
    if(root == NULL){
        return 0;
    }
    else{
        return root->height;
    }
}


void updateHeight(Data *root){
    root->height = Max(getHeight(root->left), getHeight(root->right)) + 1;
}

int getbalancefactor(Data *root){
    return getHeight(root->left) - getHeight(root->right);
}

Data *rightrotate(Data *root){
    Data *child = root->left;
    Data *gchild = child->right;

    child->right = root;
    root->left = gchild;

    updateHeight(root);
    updateHeight(child);

    return child;
}

Data *leftrotate(Data *root){
    Data *child = root->right;
    Data *gchild = child->left;

    child->left = root;
    root->right = gchild;

    updateHeight(root);
    updateHeight(child);

    return child;
}

Data *Insert(Data *root,char GameName[100],char DevName[50],int DayRel,int MonthRel,int YearRel,int GamePrice){
    if(root == NULL){
        return createdata(GameName,DevName,DayRel,MonthRel,YearRel,GamePrice);
    }else if(strcmp(DevName, root->DevName) < 0){
        root->left = Insert(root->left,GameName,DevName,DayRel,MonthRel,YearRel,GamePrice);
    }else if(strcmp(DevName, root->DevName) > 0){
        root->right = Insert(root->right,GameName,DevName,DayRel,MonthRel,YearRel,GamePrice);
    }

    updateHeight(root);

    int balancefactor = getbalancefactor(root);

    if(balancefactor > 1 && getbalancefactor(root->left) >= 0){
        return rightrotate(root);
    }
    else if(balancefactor < -1 && getbalancefactor(root->right) <= 0){
        return leftrotate(root);
    }
    else if(balancefactor > 1 && getbalancefactor(root->left) < 0){
        root->left = leftrotate(root);
        return rightrotate(root);
    }
    else if(balancefactor < -1 && getbalancefactor(root->right) > 0){
        root->right = rightrotate(root);
        return leftrotate(root);
    }
    return root;
}

Data *searchDev(Data *root, char dname[10]){
    if(root==NULL){
        return NULL;
    }
    else if(strcmp(dname, root->DevName) < 0){
        return searchDev(root->left, dname);
    }
    else if(strcmp(dname, root->DevName) > 0){
        return searchDev(root->right, dname);
    }
    else return root;
}

bool dnamevalid(Data *root, char dname[10]){
    for(int i = 0; i < strlen(dname); i++) {
        if(isspace(dname[i]))return false;
    }  
    
    if(searchDev(root,dname)) return false;

    return true;
}

Data *InsertData(Data *root){
    char GameName[100];
    char DevName[50];
    int DayRel;
    int MonthRel;
    int YearRel;
    int GamePrice;
    char confirmation;

    do{
        printf("Input Game Name [3 or more chars] : ");
        scanf("%[^\n]",GameName);getchar();
    }while(strlen(GameName) < 3);

    do{
        printf("Input Developer Name [VALID] : ");
        scanf("%[^\n]",DevName);getchar();
    }while(!dnamevalid(root,DevName));

    do{
        printf("Input Release Date [DD-MM-YY] : ");
        scanf("%d-%d-%d",&DayRel,&MonthRel, &YearRel);getchar();    
    }while(MonthRel < 1 || MonthRel > 12);

    do{
        printf("Input Game Price [US Dollar]: ");
        scanf("%d $",&GamePrice);getchar();    
    }while(GamePrice < 0);

    do{
        printf("ARE YOU SURE WANT TO INSERT THIS DATA? [Y|N] > ");
        scanf("%c",&confirmation);getchar();
    }while(confirmation != 'Y' && confirmation != 'N');

    if(confirmation == 'Y'){

        root = Insert(root,GameName,DevName,DayRel,MonthRel,YearRel,GamePrice);
    }
    return root; 
}

void InOrder(Data *root){
    if(root == NULL){
        return;
    }
    InOrder(root->left);
    printf("===========================\n");
    printf("Game         : %s\n",root->GameName);
    printf("Developer    : %s\n",root->DevName);
    printf("Release Date : %d-%d-%d\n",root->DayRel,root->MonthRel,root->YearRel);
    printf("Price        : %d $\n",root->GamePrice);
    printf("===========================\n\n");
    InOrder(root->right);
}


int main(){

    int input;
    Data *root = NULL;
    do{
        puts("||==================================||");
        puts("||        DATABASE OF AMBUSH        ||");         
        puts("||==================================||");
        puts("||     1. INSERT DATABASE GAME      ||");
        puts("||==================================||");
        puts("||     2. SEE ALL DATABASE GAME     ||");
        puts("||==================================||");
        puts("||     3. REMOVE DATABASE GAME      ||");
        puts("||==================================||");
        puts("||     4. RESET DATABASE GAME       ||");
        puts("||==================================||");
        puts("||            0. EXIT               ||");
        puts("||==================================||");
        printf(">> ");
        scanf("%d",&input);getchar();
        if(input == 1){
            root = InsertData(root);
            system("cls");
        }else if(input == 2){
            // viewData(root);
            InOrder(root);
        }else if(input == 3){
            // root = removeData(root);
        }else if(input == 4){
            // root = resetData(root);
        }else if(input == 0){
            puts("THANK YOU");
        }
    }while(input != 0);
    return 0;
}