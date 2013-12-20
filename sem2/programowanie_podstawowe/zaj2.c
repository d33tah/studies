#include <stdio.h>
#include <stdlib.h>

int przestepny (int rok)
{
if (rok%4 == 0 && rok%100 != 0 || rok%400 == 0)
return 1;
return 0;
}

int poprawny (int dzien, int miesiac, int rok)
{

//printf("DEBUG: Ogolna poprawnosc...\n");

if (dzien<1 || dzien>31 || miesiac <1 || miesiac >12) return 0;


if (miesiac==2)
	if (przestepny(rok))
		return dzien<=29;
	else
		return dzien<=29;


switch(miesiac)
{
	case  1:
	case  3:
	case  5:
	case  7:
	case  8:
	case 10:
	case 12: return dzien<=31; break;
}


return dzien<=30;

}

int dni(int dzien, int miesiac, int rok)
{
switch(miesiac)
{
	case 1: return dzien; break;
	case 2: return 31+dzien; break;
	case 3: return 59+przestepny(rok)+dzien; break;
	case 4: return 90+przestepny(rok)+dzien; break;
	case 5: return 120+przestepny(rok)+dzien; break;
	case 6: return 151+przestepny(rok)+dzien; break;
	case 7: return 181+przestepny(rok)+dzien; break;
	case 8: return 212+przestepny(rok)+dzien; break;
	case 9: return 243+przestepny(rok)+dzien; break;
	case 10: return 273+przestepny(rok)+dzien; break;
	case 11: return 304+przestepny(rok)+dzien; break;
	case 12: return 334+przestepny(rok)+dzien; break;
}
}

int main() {

int dzien;
int miesiac;
int rok;

int wybor;

printf("Podaj date w formacie dd-mm-rrrr: ");
scanf("%d-%d-%d",&dzien,&miesiac,&rok);

printf("\nNo dobra. A teraz wybierz:\n");
printf("1: Sprawdzamy poprawnosc daty\n");
printf("2: Ktory to dzien roku\n");
printf("3: Czy podany rok jest rokiem przestepnym\n");

printf("\nPodaj swoj wybor: ");
scanf("%d",&wybor);

switch(wybor)
{

case 1:
	if (poprawny(dzien,miesiac,rok))
		printf("Data jest poprawna.");
	else
		printf("Data nie jest poprawna.");
break;

case 2:
	if (poprawny(dzien,miesiac,rok))
		printf("Od poczatku roku minelo %d dni.",dni(dzien,miesiac,rok));
	else
		printf("Podana data nie jest poprawna.");
break;

case 3: 

	if (przestepny(rok))
		printf("Tak, jest przestepny.\n"); 
	else 
		printf("Nie, nie jest przestepny.\n");  
break;


}

return 0;
}
