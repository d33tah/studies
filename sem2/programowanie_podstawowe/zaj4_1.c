#include <stdio.h>
#include <stdlib.h>

int n,g;

int main()

{

int* tablica;
int i,i2;

printf("Podaj dlugosc tablicy: ");
scanf("%d",&n);
printf("Podaj liczbe G: ");
scanf("%d",&g);

tablica = (int *) malloc(sizeof(int)*n);

for (i=0; i<n ;  i++)
{
printf("Podaj liczbe numer %d: ",i+1);
scanf("%d",&tablica[i]);
}

for (i=0; i<n; i++)
{

for (i2=0; i2<n; i2++)
{
if (tablica[i]+tablica[i2]>=g)
printf("Znalazlem pare: %d i %d\n",tablica[i],tablica[i2]);

}

free(tablica);
}

return 0;
}
