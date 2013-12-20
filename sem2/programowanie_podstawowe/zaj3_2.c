#include <stdio.h>
#include <stdlib.h>

int cyfraurodzenia(int liczba)
{
int ret=0;
int tmp=0;

printf("Rekurencja...\n");

for(;;) {
while(liczba!=0)
{
tmp = liczba % 10;
ret+=tmp;
liczba-=tmp;
liczba=liczba / 10;

printf("ret=%d, liczba=%d\n",ret, liczba);
}

if (ret>9)
ret = cyfraurodzenia(ret);
else break;
}


return ret;
}

int main()
{

char bufor[8];

int dzien, miesiac, rok;

int liczba;

printf("Podaj date (dd-mm-rrrr): ");
scanf("%d-%d-%d", &dzien, &miesiac, &rok);

sprintf(bufor,"%d%d%d", dzien,miesiac,rok);
liczba=atoi(bufor);
printf("Twoja cyfra urodzenia to: %d.\n",cyfraurodzenia(liczba));

return 0;
}
