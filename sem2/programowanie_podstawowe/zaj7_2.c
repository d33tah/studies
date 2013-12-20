#include <stdio.h>
#include <stdlib.h>

/*
Napisać następujące funkcje:
* funkcję pobierającą (z klawiatury) zawartość tablicy liczb całkowitych 
  podanej jako parametr, o długości podanej jako parametr;
* funkcję wypisującą zawartość tablicy podanej jako parametr o długości 
  podanej jako parametr;
* funkcję zwracającą ilość nieparzystych elementów tablicy podanej jako 
  parametr o długości podanej jako parametr,
* funkcję obliczającą długość najdłuższego fragmentu tablicy podanej jako 
  parametr o długości podanej jako parametr, w którym wszystkie elementy są 
  dodatnie,
* funkcję Zamien zamieniającą wartościami dwie zmienne podane jako parametry 
  (funkcja niczego nie zwraca);
* funkcję o parametrach: tablica T, długość tablicy D, dwie liczby całkowite 
  L i P, odwracającą kolejność elementów we fragmencie tablicy wyznaczonym 
  przez liczby L i P (np. gdy L=2, P=4 funkcja odwraca kolejność elementów we 
  fragmencie zaczynającym się od T[2] i kończącym się na T[4]). Jeśli L< P, to
  funkcja zamienia ich wartości (np. gdy podano L=4, P=2, to funkcja ustala 
  L=2, P=4); jeśli po tej zamianie L<0 i P<=D, to odwróceniu podlega fragment 
  tablicy of T[0] do T[P]; jeśli L>=0 i P>D, to odwróceniu podlega fragment 
  od T[L]do T[D], jeśli L<0 i P>D, to odwracamy całą tablicę. Funkcja ma 
  wykorzystywać funkcję Zamien z poprzedniego punktu.
Napisać program tworzący tablicę liczb całkowitych o podanej przez 
użytkownika długości, a następnie wykorzystujący powyższe funkcje do 
wypełnienia i wypisania tablicy oraz umożliwienia użytkownikowi wybrania 
jednej z czynności: zakończenia programu, sprawdzenia liczby elementów 
nieparzystych w tej tablicy, znalezienia długości najdłuższego fragmentu tej 
tablicy zawierającego tylko liczby dodatnie lub odwrócenia kolejności 
elementów we fragmencie tablicy o krańcach podanych przez użytkownika. 
Program ma umożliwiać wielokrotny wybór czynności.
*/

void wypisz(int *arr, int n)
{
int i;
for(i=0; i<n; i++)
printf("%d\n", arr[i]);
}

void pobierz(int *arr, int n)
{
int i;
for(i=0; i<n; i++)
{
printf("Podaj element numer %d: ",i+1);
scanf("%d",&arr[i]);
}
}

int parzyste(int *arr,int n)
{
int i,ret=0;
for (i=0; i<n; i++)
{
if (arr[i]%2==0)
ret++;
}
return ret;
}

int dodatnie(int *arr, int n)
{
int tmp,max,i,i2=0;

max=0;
for (i=0; i<n; i++)
{
tmp=0;
for (i2=i; i<n; i++)
{
if (arr[i]>0)
tmp++;
else
break;
}
if (tmp>max)
max=tmp;
}
return max;
}

void zamien(int *a, int *b)
{
int tmp=*b;
*b=*a;
*a=tmp;
}

void odwroc(int *arr, int d, int l, int p)
{

int i;
int pol;

if(l>p)
zamien(&l,&p);

pol=p-l;
if (pol %2==0)
pol/=2;
else
pol=++pol/2;
printf("DEBUG: pol=%d\n", pol);

for (i=0; i<pol; i++)
{

printf("Zamienilbym: %d i %d\n", arr[l+i-1], arr[p-i-1]);

}

}

int main()
{

int* tablica;
int n,wybor,l,p;

printf("Podaj N: ");
scanf("%d",&n);

tablica = (int*) malloc(sizeof(int)*n);

pobierz(tablica,n);

for(;;)
{
printf("Wybierz opcje:\n");
printf("0: zakonczenie programu\n");
printf("1: podaj il. nieparzystych el.\n");
printf("2: najdluzszy dodatni fragment\n");
printf("3: zamien podtablice\n\n");
printf("Twoj wybor: ");
scanf("%d", &wybor);

switch(wybor)
{

case 0: free(tablica); return 0; break;
case 1: printf("%d parzystych.\n", parzyste(tablica,n)); break;
case 2: printf("%d dodatnich.\n", dodatnie(tablica,n)); break;
case 3: 

printf("Podaj L: ");
scanf("%d", &l);

printf("Podaj P: ");
scanf("%d", &p);

odwroc(tablica,n,l,p);

wypisz(tablica,n);

break;
}
}

free(tablica);
return 0;

}
