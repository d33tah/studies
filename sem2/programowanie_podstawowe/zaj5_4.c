#include <stdio.h>
#include <stdlib.h>
//#include <stdbool.h>
#include <math.h> //kompilowac z -lm

/*
Napisać program tworzący dynamicznie (po pobraniu od użytkownika wartości 
naturalnej N) dwuwymiarową tablicę wartości rzeczywistych kształtu 2 x N 
zawierającą współrzędne x i y pewnych N punktów na płaszczyźnie. Program 
pobiera od użytkownika te współrzędne oraz wyszukuje i wypisuje wszystkie 
czwórki punktów tworzących prostokąty.
*/

/*
nie bede ukrywal, logike tej funkcji zerznalem stad:
http://stackoverflow.com/questions/2303278
*/
void sprawdzprostokat(
float x1,
float y1,
float x2,
float y2,
float x3,
float y3,
float x4,
float y4)
{

  float cx,cy;
  float dd1,dd2,dd3,dd4;

  cx=(x1+x2+x3+x4)/4;
  cy=(y1+y2+y3+y4)/4;

  dd1=sqrt(cx-x1)+sqrt(cy-y1);
  dd2=sqrt(cx-x2)+sqrt(cy-y2);
  dd3=sqrt(cx-x3)+sqrt(cy-y3);
  dd4=sqrt(cx-x4)+sqrt(cy-y4);
  if(dd1==dd2 && dd1==dd3 && dd1==dd4)
  printf("Nastepujace 4 punkty tworza prostokat: A=[%0.2f ; %0.2f] B=[%0.2f ; %0.2f] \
  C=[%0.2f ; %0.2f] D=[%0.2f ; %0.2f]\n", x1,y1,x2,y2,x3,y3,x4,y4);
}

int main()
{

float* tablica[2];
int n,i,i2,i3,i4;

printf("Podaj N: ");
scanf("%d",&n);

tablica[0] = (float*) malloc(sizeof(float)*n);
tablica[1] = (float*) malloc(sizeof(float)*n);

for (i=0; i<n; i++)
{
printf("Podaj x[%d]: ", i+1);
scanf("%f",&tablica[0][i]);
printf("Podaj y[%d]: ", i+1);
scanf("%f",&tablica[1][i]);
printf("\n");
}

for(i=0; i+3<n; i++)
{
	printf("[%f] : [%f]\n",tablica[0][i],tablica[1][i]);
	for(i2=i+1; i2<n; i2++)
	{
		for(i3=i2+1; i3<n; i3++)
		{
			for(i4=i3+1; i4<n; i4++)
			{
				sprawdzprostokat(
				tablica[0][i],
				tablica[1][i],
                                tablica[0][i2],
                                tablica[1][i2],
                                tablica[0][i3],
                                tablica[1][i3],
                                tablica[0][i4],
                                tablica[1][i4]
				);
			}
		}
	}
}

free(tablica[0]);
free(tablica[1]);

return 0;

}
