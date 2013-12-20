#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <time.h>

//#define rok 2011
int rok;
bool popraw=false;
#define DEBUG
/*
Zadeklarować strukturę Pracownik o polach przechowujących: imię, nazwisko, 
stanowisko, staż pracy, rok urodzenia i miejsce urodzenia. Napisać:

X funkcję pobierającą dane pojedynczego pracownika;
X funkcję pobierającą dane do tablicy pracowników podanej jako parametr, o 
  długości podanej jako parametr;
X funkcję wypisującą dane pojedynczego pracownika;
X funkcję wypisującą zawartość tablicy pracowników podanej jako parametr, o 
  długości podanej jako parametr;
X funkcję zwracającą pracownika o największym stażu (parametrami funkcji mają 
  być tablica pracowników i jej długość);
X funkcję zwracającą średni wiek pracowników w tablicy (parametrami funkcji 
  mają być tablica pracowników i jej długość);
X funkcję wypisującą wszystkie osoby pracujące na stanowisku podanym jako 
  parametr (parametrami funkcji mają być tablica pracowników, jej długość 
  oraz poszukiwane stanowisko);
* funkcję zwracającą wartość logiczną mówiącą, czy w tablicy są osoby 
  urodzone w tym samym mieście (parametrami funkcji mają być tablica 
  pracowników i jej długość);
* funkcję wypisującą wszystkie stanowiska występujące w tablicy oraz liczbę 
  osób zatrudnionych na poszczególnych stanowiskach (parametrami funkcji mają 
  być tablica pracowników i jej długość);

oraz program pobierający tablicę pracowników o podanej przez użytkownika 
długości i testujący na niej działanie powyższych funkcji.
*/

//wiem ze brzydkie ale kodzilem w tramwaju i nie moglem googlac ;)
float itof(int i)
{
    char *buf = malloc(sizeof(float));
    float ret;
    sprintf(buf,"%d",i);
    ret = atof(buf);
    free(buf);
    return ret;
}

void hack()
{
    if(popraw)
    {
        int zero=0;
        char *buf;
        getline(&buf,&zero,stdin);
        free(buf);
	popraw=false;
    }
}

char* chomp(char* str)
{
    if(str[strlen(str)-1]=='\n')
        str[strlen(str)-1]='\0';
    return str;
}

struct Pracownik
{
    char* imie;
    char* nazwisko;
    int stanowisko;
    int staz;
    int rok_urodzenia;
    char* miejsce_urodzenia;
};

typedef struct Pracownik Pracownik;

Pracownik pobierz()
{
    Pracownik ret;
    char* imie=NULL;
    char* nazwisko=NULL;
    int stanowisko;
    int staz;
    int rok_urodzenia;
    char* miejsce_urodzenia=NULL;
    int zero = 0;

    printf("Podaj imie: ");
    hack();
    getline(&imie,&zero,stdin);
    chomp(imie);
    ret.imie=imie;

    printf("Podaj nazwisko: ");
    hack();
    getline(&nazwisko,&zero,stdin);
    chomp(nazwisko);
    ret.nazwisko=nazwisko;

    printf("Podaj stanowisko: ");
    scanf("%d",&stanowisko);
    ret.stanowisko=stanowisko;

    printf("Podaj staz: ");
    scanf("%d",&staz);
    ret.staz=staz;

    printf("Podaj rok urodzenia: ");
    scanf("%d",&rok_urodzenia);
    popraw=true;
    ret.rok_urodzenia=rok_urodzenia;

    ///*
    printf("Podaj miejsce urodzenia: ");
    hack();
    getline(&miejsce_urodzenia,&zero,stdin);
    chomp(miejsce_urodzenia);
    ret.miejsce_urodzenia=miejsce_urodzenia;
    //*/

    return ret;
}

void pobierz_tab(Pracownik* arr, int n)
{
    int i;
    for(i=0; i<n; i++)
    {
        #ifdef DEBUG
        printf("Teraz pobiore pracownika nr %d.\n",i+1);
        #endif
        arr[i]=pobierz();
        printf("\n");
    }
}

void wypisz(Pracownik tmp)
{
    printf("Imie: %s\n",tmp.imie);
    printf("Nazwisko: %s\n",tmp.nazwisko);
    printf("Stanowisko: %d\n",tmp.stanowisko);
    printf("Staz: %d\n",tmp.staz);
    printf("Rok urodzenia: %d\n",tmp.rok_urodzenia);
    printf("Miejsce urodzenia: %s\n\n",tmp.miejsce_urodzenia);
}

void wypisz_tab(Pracownik* arr, int n)
{
    int i;
    for(i=0; i<n; i++)
    {
        printf("Pracownik %d:\n",i+1);
        wypisz(arr[i]);
    }
}

Pracownik* najwiekszy_staz(Pracownik* arr, int n)
{
    int i;
    int max=arr[0].staz;
    Pracownik* max_ptr = &arr[0];
    for(i=0; i<n; i++)
    {
        if (arr[i].staz>max)
        {
            max=arr[i].staz;
            max_ptr=&arr[i];
        }
}

return max_ptr;
}

float sredni_wiek(Pracownik* arr, int n)
{
    int i,suma=0;
    for(i=0;i<n; i++)
    {
        suma+=rok-arr[i].rok_urodzenia;
    }
    return itof(suma)/itof(n);
}

void na_stanowisku(Pracownik* arr, int n, int stanowisko)
{
    int i;
    int tmp=0;
    Pracownik* ret;

    #ifdef DEBUG
    printf("Przeszukuje...\n");
    #endif
    for(i=0; i<n; i++)
    {
        if(arr[i].stanowisko==stanowisko)
        {
            tmp++;
        }
    }

    if(tmp==0) 
    {
        printf("Brak pracownikow na podanym stanowisku.\n");
        return;
    }
    else
    {
        printf("Znaleziono %d rekordow.\n",tmp);
    }

    #ifdef DEBUG
    printf("Alokuje...\n");
    #endif
    ret = malloc(sizeof(Pracownik)*tmp);

    #ifdef DEBUG
    printf("Wypelniam...\n");
    #endif
    tmp=0;
    for(i=0; i<n; i++)
    {
        if(arr[i].stanowisko==stanowisko)
        {
            ret[tmp]=arr[i];
            tmp++;
        }
    }

    #ifdef DEBUG
    printf("tmp=%d\n",tmp);
    printf("Wypisuje...\n");
    #endif
    wypisz_tab(ret,tmp);
    
    #ifdef DEBUG
    printf("Zwalniam...\n");
    #endif
    free(ret);
}

bool ur_w_tym_samym(Pracownik* arr, int n)
{
    int i,i2;
    bool ret=false;
    for(i=0; i<n; i++)
    {
        if(i!=n)
        {
            for(i2=i+1; i2<n; i2++)
            {
            #ifdef DEBUG
            printf("Porownuje %s z %s.\n",arr[i].miejsce_urodzenia,arr[i2].miejsce_urodzenia);
            #endif
            if(strcmp(arr[i].miejsce_urodzenia, arr[i2].miejsce_urodzenia)==0)
                ret=true;
            }
        }

    }
    return ret;
}

int znajdz(int* arr, int len, int val)
{
    int i;
    #ifdef DEBUG
    printf("jest_w(,len=%d,val=%d)...", len, val);
    #endif
    for(i=0; i<len; i++)
    {
        if(arr[i]==val)
        {
            #ifdef DEBUG
            printf("zwracam PRAWDE\n");
            #endif
            return i;
        }
    }
    #ifdef DEBUG
    printf("zwracam FALSZ\n");
    #endif
    return -1;
}

int* dodaj_do(int* arr,int len,int val)
{
    #ifdef DEBUG
    printf("-->dodaj_do(len=%d,val=%d,newsize=%d)\n",len,val,sizeof(int)*(len+1));
    #endif
    arr=realloc(arr,sizeof(int)*(len+1));
    arr[len]=val;
    #ifdef DEBUG
    printf("-->arr[len]=%d\n",arr[len]);
    #endif
    return arr;
}

void wypisz_stanowiska(Pracownik* arr, int n)
{
    int i,i2;
    int found=1;
    int curr=0;
    int* tmp;
    int* tmp2;
    tmp=malloc(sizeof(int)*1);
    tmp2=malloc(sizeof(int)*1);
    tmp[curr]=arr[curr].stanowisko;
    tmp2[curr]=1;

    #ifdef DEBUG
    printf("->tmp2[curr=%d]=%d; tmp[curr=%d]=%d\n",curr,tmp2[curr],curr,tmp[curr]);
    #endif
    
    curr++;
    for(i=1; i<n; i++)
    {
        
        #ifdef DEBUG
        printf("->%d: Przetwarzam %s %s... [curr=%d]\n",i, arr[i].imie, arr[i].nazwisko, curr);
        #endif
        
        if(znajdz(tmp,curr,arr[i].stanowisko)==-1)
        {
            printf("->Nie znaleziono.\n");
            tmp=dodaj_do(tmp,curr,arr[i].stanowisko);
            tmp2=dodaj_do(tmp2,curr,1);
            curr++;
        }
        else
        {
            found=znajdz(tmp,curr,arr[i].stanowisko);
            #ifdef DEBUG
            printf("->tmp2[found=%d]=%d; tmp[found=%d]=%d\n",found,tmp2[found],found,tmp2[found]);
            #endif
            tmp2[found]++;
        }
        
            printf("POCZ\n");
            for(i2=0; i2<=(curr-1); i2++)
            {
                printf("STANOWISKO [%d] %d: %d\n", i2, tmp[i2], tmp2[i2]);
            }
            printf("KONIEC\n");
    }

    for(i=0; i<curr; i++)
    {
        printf("STANOWISKO [%d] %d: %d\n", i, tmp[i], tmp2[i]);
    }
}

int main()
{

int n,wybor;
Pracownik* arr=NULL;
Pracownik* tmp=NULL;

time_t now = time ( NULL );
struct tm *date = localtime ( &now );

rok = 1900+date->tm_year;

#ifdef DEBUG
printf("Mamy rok %d.\n",rok);
#endif

#ifndef DEBUG
printf("Podaj wielkosc tablicy: ");
scanf("%d",&n);

arr = malloc(sizeof(Pracownik)*n);
#else
Pracownik foo;
int i=0;
n=5;
printf("Wypelniam tablice...");
arr = malloc(sizeof(Pracownik)*n);

/*
foo.imie="asd";
foo.nazwisko="asd";
foo.stanowisko=9;
foo.staz=2;
foo.rok_urodzenia=1990;
foo.miejsce_urodzenia="Lodz";
arr[0]=foo;

foo.imie="asd";
foo.nazwisko="asd";
foo.stanowisko=7;
foo.staz=2;
foo.rok_urodzenia=1991;
foo.miejsce_urodzenia="Lodzz";
arr[1]=foo;
*/

foo.imie="jacek";
foo.nazwisko="wielemborek";
foo.stanowisko=666;
foo.staz=20;
foo.rok_urodzenia=1990;
foo.miejsce_urodzenia="Lodz";
arr[i]=foo; i++;
foo.imie="Fred";
foo.nazwisko="Durst";
foo.stanowisko=123;
foo.staz=30;
foo.rok_urodzenia=1980;
foo.miejsce_urodzenia="Nowhere";
arr[i]=foo; i++;
foo.imie="Trzeci";
foo.nazwisko="Wpis";
foo.stanowisko=123;
foo.staz=20;
foo.rok_urodzenia=1995;
foo.miejsce_urodzenia="Testowo";
arr[i]=foo; i++;
foo.imie="Barack";
foo.nazwisko="Obama";
foo.stanowisko=231;
foo.staz=123;
foo.rok_urodzenia=1970;
foo.miejsce_urodzenia="USA";
arr[i]=foo; i++;
foo.imie="Jaroslaw";
foo.nazwisko="Kaczynski";
foo.stanowisko=9;
foo.staz=3;
foo.rok_urodzenia=1950;
foo.miejsce_urodzenia="Polska";
arr[i]=foo; i++;
#endif

for(;;)
{

    printf("1) Pobierz tablice\n");
    printf("2) Wypisz tablice\n");
    printf("3) Podaj sredni wiek\n");
    printf("4) Podaj najwiekszy staz\n");
    printf("5) Szukaj pracownikow na stanowisku\n");
    printf("6) Sprawdz czy powtarzaja sie miasta\n");
    printf("7) Wypisz stanowiska\n");
    printf("0) Wyjdz\n");

    printf("\nPodaj wybor: ");
    scanf("%d",&wybor);
    popraw=true;
    printf("\n");

    switch(wybor)
    {
        case 0: free(arr); return 0; break;
        case 1: pobierz_tab(arr,n); break;
        case 2: wypisz_tab(arr,n); break;
        case 3: printf("\n\nSredni wiek w podanych danych to %f\n\n",sredni_wiek(arr,n)); break;
        case 4: printf("Najwiekszy staz to: "); wypisz(*najwiekszy_staz(arr,n)); break;
        case 5: printf("\nPodaj stanowisko: "); scanf("%d",&wybor); printf("\n"); na_stanowisku(arr,n,wybor); break;
        case 6: if(ur_w_tym_samym(arr,n)) printf("Tak.\n"); else printf("Nie.\n"); break;
        case 7: wypisz_stanowiska(arr,n); break;
    }
}

free(arr);
return 0;
}
