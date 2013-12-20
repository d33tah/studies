#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <math.h>

/*
Napisać program pobierający od użytkownika liczby całkowite aż do 
podania liczby 0 kończącej pobieranie. Program sprawdza, czy każda trójka 
kolejno podanych liczb może stanowić długości boków trójkąta, i jeśli tak - 
wypisuje jego pole i obwód. Końcowe zero nie jest brane pod uwagę. Jeśli 
podano mniej niż trzy liczby, program wypisuje odpowiedni komunikat. Program 
należy zrealizować za pomocą funkcji:
* Czy_Trojkat, zwracającej wartość mówiącą, czy liczby całkowite podane jako 
  parametry mogą być długościami boków trójkąta
* funkcji zwracającej obwód trójkąta o bokach podanych jako parametry,
* funkcji zwracającej pole trójkąta o bokach podanych jako parametry.
*/

bool moze(float a, float b, float c)
{
return (abs(b-c)<a && a<b+c);
}

float obwod(float a,float b,float c)
{
return a+b+c;
}

float pole(float a,float b,float c)
{
float p=obwod(a,b,c)/2.0f;
return sqrt(p*(p-a)*(p-b)*(p-c));
}

int main()
{
float a,b,c,tmp;
int licznik=0;

for(;;)
{
printf("Podaj liczbe: ");
scanf("%f",&tmp);
if (tmp==0) break;
licznik++;
c=b;
b=a;
a=tmp;

if (licznik>2)
{
if(moze(a,b,c))
{
printf("Z podanych liczb mozna stworzyc trojkat.\n");
printf("Jego obwod to %0.2f, jego pole to %0.2f.\n",obwod(a,b,c),pole(a,b,c));
}
}


}

return 0;
}
