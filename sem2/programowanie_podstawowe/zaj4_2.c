#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int n;

int main()
{

int* tablica;
bool* bylo;
int i, i2,tmp;

printf("Podaj liczbe elementow: ");
scanf("%d",&n);

tablica = (int*) malloc(sizeof(int)*n);
bylo = (bool*) malloc(sizeof(bool)*n);

for (i=0; i<n; i++)
{
printf("Podaj liczbe numer %d: ",i+1);
scanf("%d",&tablica[i]);
}

for (i=0; i<n; i++)
{
if (!bylo[i])
{
tmp=1;
bylo[i]=true;
if (i!=n) {
	for (i2=i+1; i2<n; i2++)
	{
	//printf("Sprawdze indeks %d...\n",i2);
		if (tablica[i]==tablica[i2])
		{
		tmp++;
		bylo[i2]=true;
		}
	}
}
printf("Liczba %d: %d\n", tablica[i], tmp);
}
} 

free(tablica);
free(bylo);

return 0;

}
