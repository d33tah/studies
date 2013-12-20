#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

struct stos
{
    int val;
    struct stos* poprz;
};

typedef struct stos stos;

void push(stos** arr, int val)
{
    stos* next;
    next=malloc(sizeof(stos));
    
    if(*arr==NULL)
    {
        #ifdef DEBUG
        printf("Inicjalizuje\n");
        #endif
        next->poprz=NULL;
    }
    else
    {
        #ifdef DEBUG
        printf("Klade na stosie\n");
        #endif
        next->poprz=*arr;
    }
    
    next->val=val;
    *arr=next;
}

int pop(stos** arr)
{ //myslalem tez czy by zamiast tego nie zwracac int*, ale wolalem dodac stos_pusty()
    int ret=-1;
    stos* tmp=*arr;
    
    if(tmp==NULL)
    {
        #ifdef DEBUG
        printf("pop(): pusty stos!\n");
        #endif
        
        return ret;
    }
    ret = tmp->val;
    
    #ifdef DEBUG
    printf("Zwracam...\n");
    #endif
    
    tmp=tmp->poprz;
    free(*arr);
    *arr=tmp;
    
    return ret;
}

bool stos_pusty(stos* arr)
{
    if(arr==NULL)
        return true;
    return false;
}

void zwolnij_stos(stos* arr)
{
    while(!stos_pusty(arr))
        pop(&arr);
}

int main()
{
    stos* arr=NULL;
    int wybor;
    int wynik;

    for(;;)
    {
        printf("1: Poloz na stosie\n");
        printf("2: Zdejmij ze stosu\n");
        printf("0: Wyjscie\n");
        printf("Twoj wybor: ");
        scanf("%d",&wybor);

        switch(wybor)
        {
            case 1:
                printf("Podaj liczbe: ");
                scanf("%d",&wybor);
                push(&arr,wybor);
                break;

            case 2:
                if(!stos_pusty(arr))
                {
                    printf("\nZebralem: %d\n\n", pop(&arr));
                }
                else
                {
                    printf("Stos jest pusty.\n");
                }
                break;

            case 0:
                if(arr!=NULL)
                zwolnij_stos(arr);
                return 0;

        }
    }

if(arr!=NULL)
zwolnij_stos(arr);
return 0;
}
