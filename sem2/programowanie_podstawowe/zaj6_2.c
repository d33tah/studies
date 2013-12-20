#include <stdio.h>
#include <stdlib.h>
#include <string.h> //naprawia jednego warninga
#include <stdbool.h>

/*
Napisać program pobierający od użytkownika dwa napisy, a następnie wypisujący 
informację czy drugi z napisów występuje w pierwszym, a jeśli tak, to ile 
razy. W programie wykorzystać funkcję strncmp.
*/

//ten snippecik pozyczylem stad: http://stackoverflow.com/questions/4309746
void chomp(char *str)
{
int len = strlen(str);
if (len > 0 && str[len-1] == '\n')
str[len-1] = '\0';
}

int main()
{
char *str1=NULL;
char *str2=NULL;
char *tmp=NULL;
int i,i2,n,m,len,tmp_i,ret=0;

printf("Podaj pierwszy napis: ");
getline(&str1,&len,stdin);

printf("Podaj drugi napis: ");
getline(&str2,&len,stdin);

chomp(str2);
chomp(str1);

n=strlen(str1);
m=strlen(str2);

if (n<m)
{
tmp=str2;
tmp_i=m;
str2=str1;
m=n;
str1=tmp;
n=tmp_i;
}

tmp = (char*)malloc(sizeof(char)*m);

for(i=0; i<(n-m+1); i++)
{
strncpy(tmp,&str1[i],m);
if (strncmp(tmp,str2,m)==0)
ret++;
}

if(ret)
printf("Wystapilo %d powtorzen.\n",ret);

free(str1);
free(str2);
free(tmp);

return 0;
}
