#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

/*
Liczbami bliźniaczymi nazywamy dwie liczby pierwsze p i q takie, że q=p+2.
Napisać program znajdujący 20 pierwszych par liczb bliźniaczych.
*/

bool pierwsza(int n)
{
int i;
for (i=2; i<=n/2 ; i++)
	if (n%i == 0) return 0;
return 1;
}

int main()
{

int n, n1, n2;

n=0;

n1=5;
n2=3;

while(n!=20)
{
if (pierwsza(n1)&&pierwsza(n2)&& n1==n2+2)
{
n++;
printf("Znalazlem nowa pare: %d i %d\n", n1, n2);
}

n2+=2;
n1+=2;

//printf("DEBUG: %d i %d\n", n1, n2);


}

return 0;
}
