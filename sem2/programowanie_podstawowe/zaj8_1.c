#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

//#define DEBUG 
/*
Napisać program zawierający następujące funkcje:
* funkcję pobierającą dane do tablicy liczb całkoitych podanej jako 
  parametr (długość tablicy ma być przekazana przez parametr);
* funkcję wypisującą zawartość tablicy liczb całkowitych podanej jako parametr
  o długości podanej jako parametr;
* funkcję zwracającą tablicę (wskaźnik) zawierającą liczby nieparzyste 
  z tablicy podanej jako parametr o długości podanej jako parametr. Funkcja ma
  mieć dodatkowy parametr służący przekazaniu do programu długości tablicy 
  wynikowej;
* funkcję zwracającą tablicę powstałą poprzez połączenie dwóch tablic
  podanych jako parametry o długościach podanych jako paramery; połączenie 
  mabyć wykonane tak, aby w tablicy wynikowej występowały najpierw na 
  przemian elementy tablic wejściowych, a dalej ewentualnie pozostały 
  fragment dłuższej z tablic wejściowych. Funkcja może zawierać dodatkowy 
  parametr zwracający do programu długość tablicy wynikowej.
*/

inline int max(int i, int j) { if (i>j) return i; return j; }
inline int min(int i, int j) { if (i>j) return j; return i; }

void pobierz(int *arr, int n)
{
    int i;
    for(i=0; i<n; i++)
    {
        printf("Podaj liczbe na pozycji %d: ",i+1);
        scanf("%d",&arr[i]);
    }
}

void wypisz(int *arr, int n)
{
    int i;
    for(i=0; i<n; i++)
        printf("%d\n",arr[i]);
}

int* nieparzyste(int *arr, int n, int m)
{
    int *ret;
    int tmp,i;

    #ifdef DEBUG
    printf("Nieparzyste z n=%d, m=%d\n",n,m);
    printf("Dostalem tablice: \n"); wypisz(arr,n);
    fflush(stdin);
    #endif
    
    ret =(int*) malloc(sizeof(int)*m);


    tmp=0;
    for(i=0; i<n; i++)
    {
        if(i%2==0)
        {
            ret[tmp]=arr[i];
            if (tmp>=m)
                break;
            tmp++;
        }
    }

    return ret;
}

int* naprzemian(int *arr_n, int *arr_m, int n, int m)
{
    bool parzysta,mniejsza_n=true;
    int *ret;
    int *arr_nieparzyste;
    int *arr_parzyste;
    int i_min, i_max,tmp,i;

    i_min=min(n,m);
    i_max=max(n,m);

    ret = (int*)malloc(sizeof(int)*i_max);

    if(i_max==1)
    {
	ret[0]=arr_m[0];
	return ret;	
    }


    if(i_min%2==1) 
        tmp=(i_min+1)/2; 
    else 
        tmp=i_min/2;

    #ifdef DEBUG
    printf("Ustawiam nieparzyste. tmp=%d\n", tmp);
    #endif

    arr_nieparzyste=nieparzyste(arr_n,n,tmp);

    #ifdef DEBUG
    printf("ustawilem: \n");
    wypisz(arr_nieparzyste,tmp);
    printf("end.\n");
    #endif

    if(i_min%2==1) 
        tmp=(i_min-1)/2; 
    else 
        tmp=i_min/2;


    #ifdef DEBUG
    printf("Ustawiam parzyste.i_min=%d tmp=%d\n",i_min, tmp);
    #endif

    arr_parzyste=nieparzyste(&arr_m[1],m-1,tmp);

    #ifdef DEBUG
    printf("\n");
    wypisz(arr_parzyste,tmp);
    #endif

    if(m>n) 
        mniejsza_n=true; 
    else 
        mniejsza_n=false;

    parzysta=false; tmp=0;
    for(i=0; i<i_min; i++)
    {
        #ifdef DEBUG
        printf("i=%d\n",i);
        #endif
        
        if(parzysta)
        {
            #ifdef DEBUG
            printf("z parzystych\n");
            #endif
            
            ret[i]=arr_parzyste[tmp];
            tmp++;
        }
        else
        {
            #ifdef DEBUG
            printf("z nieparzystych\n");
            #endif
            
            ret[i]=arr_nieparzyste[tmp];
        }
        parzysta=!parzysta;
    }

    if(i_min!=i_max)
    {
        #ifdef DEBUG
        printf("dopelniam!\n");
        #endif
        
        for(i=i_min; i<i_max; i++)
        {
            if(mniejsza_n)
            {
                #ifdef DEBUG
                printf("ret[%d]=arr_m[%d]\n",i,i);
                #endif
                
                ret[i]=arr_m[i];
            }
            else
            {
                #ifdef DEBUG
                printf("ret[%d]=arr_n[%d]\n",i,i);
                #endif
                
                ret[i]=arr_n[i];
            }
        }
    }

    free(arr_nieparzyste);
    free(arr_parzyste);
    return ret;
}

int main()
{

int n,m;
int *arr_n;
int *arr_m;
int *wyniczek;

printf("Podaj N: ");
scanf("%d",&n);
printf("Podaj M: ");
scanf("%d",&m);

printf("Teraz pobiore tablice N.\n");
arr_n = (int*)malloc(sizeof(int)*n);
pobierz(arr_n,n);

printf("Teraz pobiore tablice M.\n");
arr_m = (int*)malloc(sizeof(int)*m);
pobierz(arr_m,m);

wyniczek=naprzemian(arr_n,arr_m,n,m);
wypisz(wyniczek,max(n,m));

free(arr_m);
free(arr_n);
free(wyniczek);
}
