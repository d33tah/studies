#include <stdio.h>
#include <stdlib.h>

int n;

int main()

{

int* tablica;
int i,i2;
int tmp;

printf("Podaj dlugosc tablicy: ");
scanf("%d", &n);

tablica = (int*) malloc (sizeof(int)*n);

for (i=0; i<n; i++)
{
printf("Podaj element numer %d: ",i+1);
scanf("%d",&tablica[i]);
}

for (i2=0;i2<n; i2++ ) {
for (i=1; i<n-i2; i++)
{
if (tablica[i] < tablica[i-1])
{
tmp=tablica[i];
tablica[i]=tablica[i-1];
tablica[i-1]=tmp;
}
}
}

printf("Po sortowaniu:\n");

for (i=0; i<n; i++)
{
printf("%d\n", tablica[i]);
}

return 0;
}
