#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

/*
Napisać program tworzący dynamicznie (po pobraniu od użytkownika wartości 
naturalnych M i N takich, że M <N) dwie tablice wartości rzeczywistych o dł. 
odpowiednio M i N. Program pobiera od użytkownika zawartość tablic, a 
następnie wypisuje liczbę wystąpień pierwszej tablicy w drugiej oraz pozycje, 
w których zaczynają się te wystąpienia.
*/

int m,n;

void pobierz(int tablica[], int n)
{
int i;
for (i=0; i<n; i++)
{
printf("Podaj element nr %d: ",i+1);
scanf("%d",&tablica[i]);
}
}


int main()
{

int* tablica_m;
int* tablica_n;
int i,i2,razy;
bool sukces;

for(;;)
{
printf("Podaj M: ");
scanf("%d",&m);

printf("Podaj N: ");
scanf("%d",&n);

if (m < n)
break;
}

tablica_m = (int*) malloc(sizeof(int)*m);
tablica_n = (int*)  malloc(sizeof(int)*n);

printf("\nNajpierw pobiore pierwsza tablice.\n");
pobierz(tablica_m,m);

printf("\nTeraz pobiore druga tablice.\n");
pobierz(tablica_n,n);

razy=0;
for(i=0; i<n; i++)
{
sukces=false;
if (i+m<=n) {
sukces=true;
for (i2=0; i2<m; i2++)
{
//printf("m: %d[%d]:n: %d[%d]\n",tablica_m[i2],i2, tablica_n[i+i2],i+i2);
if(tablica_m[i2]!=tablica_n[i+i2])
sukces=false;
}
}

if(sukces)
{
razy++;
printf("Znaleziono powtorzenie na indeksie %d.\n",i+1);
}

}

printf("Znaleziono %d powtorzen.\n",razy);

free(tablica_m);
free(tablica_n);

if(razy)
return 0;
return 1;

}
