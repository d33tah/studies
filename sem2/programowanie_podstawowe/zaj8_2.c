#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

/*
Napisać program zawierający następujące funkcje działające a łańcuchach znakowych:
* funkcję zwracającą napis powstały z napisu podanego jako parametr poprzez 
  odwrócenie kolejności znaków w łańcuchu podanym jako parametr;
* funkcję zwracającą napis powstały z napisu podanego jako parametr poprzez 
  usunięcie z niego takich samych znaków stojących koło siebie;
* funkcję zwracającą napis powstały poprzez sklejenie z sobą dwóch napisów 
  podanych jako parametry.
*/

char* chomp(char *str)
{
if (str[strlen(str)]='\n')
{
//printf("Jest co chompowac\n");
str[strlen(str)-2]='\0';
}
return str;
}

char* zamien(char *str)
{

int dlugosc = strlen(str);
int pol;
int i;
char* ret;

ret = (char*)malloc(sizeof(char)*dlugosc);

if (dlugosc%2==1)
{
pol = (dlugosc+1)/2;
}
else
pol=dlugosc/2;

for(i=0; i<pol; i++)
{
//printf("Zamienie '%c' z '%c'\n", str[i], str[dlugosc-i-1]);
ret[dlugosc-i-1]=str[i];
ret[i]=str[dlugosc-i-1];
}

return ret;
}

char* sprzatnij(char* str)
{

int i;
int offset;
char *ret;

offset=0;
for(i=1; i<strlen(str); i++)
{
if(str[i]==str[i-1])
offset++;
}

ret = (char*)malloc(sizeof(char)*strlen(str)- sizeof(char)*offset);
offset=0;
for(i=0; i<strlen(str); i++)
{
if(str[i]!=str[i-1] || i==0)
{
ret[offset]=str[i];
offset++;
}


}

ret[offset]='\0';

return ret;
}


char* sklej(char* str1, char* str2)
{

int rozmiar = strlen(str1)+strlen(str2)+1;
char* ret =  malloc(sizeof(char)*rozmiar);

printf("Ustawilem rozmiar na %d.\n",rozmiar);

memcpy(ret,str1,strlen(str1));
printf("still alive\n");
memcpy(  &ret[strlen(str1)], str2,strlen(str2));
printf("still alive\n");
ret[rozmiar]='\0';


return ret;

}


/*
char* sklej(char* str1, char* str2)
{
int rozmiar = strlen(str1)+strlen(str2);
char* ret = (char*) malloc(sizeof(char)*rozmiar);

sprintf(ret,"%s%s",str1,str2);

return ret;
}
*/

/*
char* sklej(char* str1, char* str2)
{

int rozmiar = strlen(str1)+strlen(str2);
char* ret = (char*) malloc(sizeof(char)*rozmiar);

memcpy(&ret,&str1,strlen(str1)-1);
memcpy( (char*) &ret[strlen(str1)-1], str2,strlen(str2));

return ret;

}
*/


int main()
{
char* str1=NULL;
char* str2=NULL;
char* tmp=NULL;
char* tmp2=NULL;
int len;

len=0;

printf("Podaj napis: ");
getline(&str1,&len,stdin);

tmp2 = zamien(chomp(str1));
//tmp = zamien(str1);
printf ("Po zamienieniu kolejnosci: %s\n",tmp2);

printf("Podaj drugi napis: ");
getline(&str2,&len,stdin);


tmp = sklej(chomp(str1),chomp(str2));
//sklej(str1,str2);
printf("Efekt: %s\n",tmp);

printf("Po sprzatnieciu: %s\n", sprzatnij(tmp));

free(str1);
free(str2);
free(tmp);
free(tmp2);

return 0;
}
