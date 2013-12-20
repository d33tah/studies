#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

/*
Napisać program tworzący dynamicznie (po pobraniu od użytkownika wartości 
naturalnych M i N) dwie tablice wartości rzeczywistych o długościach 
odpowiednio M i N. Program pobiera od użytkownika zawartość tablic, a 
następnie wypisuje najpierw wartości należące do sumy mnogościowej obu tablic,
 następnie wartości należące do iloczynu mnogościowego, a na koniec należące 
do różnicy mnogościowej.
*/

void pobierz(float* tablica, int n)
{
int i;
for (i=0; i<n; i++)
{
printf("Podaj element %d: ",i+1);
scanf("%f",&tablica[i]);
}
}

bool jest_w(float* tablica, int n, float el)
{
int i;
for (i=0; i<n; i++)
{
if (tablica[i]==el)
{
return true;
}
}
return false;
}

int main()
{
int m,n,i;
float* tablica_m;
float* tablica_n;

printf("Podaj m: ");
scanf("%d",&m);
printf("Podaj n: ");
scanf("%d",&n);

tablica_m = (float*)malloc(sizeof(float)*m);
tablica_n = (float*)malloc(sizeof(float)*n);

pobierz(tablica_m,m);
pobierz(tablica_n,n);

printf("Najpierw wyswietle sume mnogosciowa M+N:\n");
for (i=0;i<m;i++) { printf("%0.2f\n",tablica_m[i]); }
for (i=0;i<n;i++) { printf("%0.2f\n",tablica_n[i]); }

printf("Teraz bedzie iloczyn mnogosciowy M*N:\n");
for (i=0;i<m;i++)
{
if(jest_w(tablica_n,n,tablica_m[i]))
printf("%0.2f\n",tablica_m[i]);
}

printf("A teraz wyswietle roznice mnogosciowa:\n");
for (i=0;i<m;i++)
{
if(!jest_w(tablica_n,n,tablica_m[i]))
printf("%0.2f\n",tablica_m[i]);
}

free(tablica_m);
free(tablica_n);

return 0;
}
