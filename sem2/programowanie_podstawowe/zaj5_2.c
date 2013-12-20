#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/*
Napisać program tworzący dynamicznie (po pobraniu od użytkownika wartości 
naturalnej N) dwuwymiarową tablicę wartości rzeczywistych kształtu 2 x N, 
zawierającą współrzędne x i y pewnych N punktów na płaszczyźnie. Program 
pobiera od użytkownika te współrzędne oraz dodatkowo współrzędne jednego 
punktu (x0, y0) oraz liczbę rzeczywistą R, a następnie wypisuje te punkty z 
tablicy, które znajdują się wewnątrz okręgu o środku w punkcie (x0, y0) i 
promieniu R.
*/

int main()
{

float* tablica[2];
float x0,y0,r;
int n,i;

printf("Podaj liczbe punktow: ");
scanf("%d",&n);

printf("Najpierw opiszemy kolo.\n");
printf("Podaj x0: ");
scanf("%f",&x0);
printf("Podaj y0: ");
scanf("%f",&y0);
printf("Podaj r: ");
scanf("%f",&r);
printf("\nA teraz reszta punktow.\n\n");

tablica[0]=(float*) malloc(sizeof(float)*n);
tablica[1]=(float*) malloc(sizeof(float)*n);

for (i=0;i<n;i++)
{
printf("Podaj x_%d: ",i+1);
scanf("%f",&tablica[0][i]);
printf("Podaj y_%d: ",i+1);
scanf("%f",&tablica[1][i]);
printf("\n");
}

printf("Ponizsze punkty wchodza w sklad podanego na poczatku kola:\n\n");
for (i=0;i<n;i++)
{


if ( //wg http://pl.wikipedia.org/wiki/Ko%C5%82o (x-x_0)^2+(y-y_0)^2<=r^2
	(
	(pow(tablica[0][i],2) + (2*tablica[0][i]*x0)+pow(x0,2))
	+
	(pow(tablica[1][i],2) - (2*tablica[1][i]*y0)+pow(y0,2))
	)
	<=pow(r,2)
   )
{
printf("%.02f ; %.02f\n",tablica[0][i],tablica[1][i]);
}
}

free(tablica[0]);
free(tablica[1]);

return 0;

}
