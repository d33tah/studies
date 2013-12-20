#include <stdio.h>
#include <stdlib.h>

/*
Napisać program pobierający od użytkownika napisy do momentu decyzji 
zakończenia pobierania, a po pobraniu każdego z napisów wypisujący napis 
powstały przez zamianę liter małych na duże (Uwaga - do zamiany należy 
wykorzystać "właściwości" typu char, a nie standardową funkcję do zamiany 
znaków)
*/

int main()
{

char* bufor;
int len=0;
int i,tmp;

for(;;)

{

printf("Podaj tekst (pusty lancuch konczy): ");
tmp=getline(&bufor,&len,stdin);
if (bufor[0]=='\0' || (bufor[0]=='\n' && bufor[1]=='\0' ))
break;

for(i=0; i<strlen(bufor); i++)
{
if (bufor[i]=='\0')
break;

if (bufor[i]>=97 && bufor[i]<=122)
{
bufor[i]-=32;
}
}

printf("%s",bufor);

}

return 0;
}
