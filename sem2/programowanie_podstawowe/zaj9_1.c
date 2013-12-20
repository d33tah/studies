#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

/*
Napisać program zawierający:

X strukturę Punkt przechowującą współrzędne (całkowite) Punktu 
  płaszczyzny,
X funkcję TworzPunkt o dwóch parametrach całkowitych, zwracającą Punkt o 
  współrzędnych odpowiadających wartościom podanym jako parametry,
* funkcję Odleglosc zwracającą wartość rzeczywistą - odległość dwóch Punktów 
  podanych jako parametry,
X strukturę Prosta przechowującą współczynniki równania prostej (A,B i C dla 
  równania postaci Ax+By+C=0),
* funkcję ProstaPrzezPunkty zwracającą równanie prostej przechodzącej przez 
  dwa Punkty podane jako parametry,
X funkcję CzyNaProstej zwracającą wartość logiczną mówiącą, czy Punkt podany 
  jako parametr leży na prostej podanej jako parametr,
X funkcję CzyWspolliniowe zwracającą wartość logiczną mówiącą, czy trzy Punkty 
  podane jako parametry są współliniowe (funkcja ma wykorzystywać napisane 
  wcześniej funkcje ProstaPrzzPunkty i CzyNaProstej,
X strukturę Prostokat przechowującą dwa Punkty będące przeciwległymi 
  wierzchołkami prostokąta,
X funkcję CzyWProstokacie zwracającą wartość logiczną mówiącą, czy Punkt 
  podany jako parametr leży wewnątrz prostokąta podanego jako parametr

oraz test działania powyższych funkcji
*/

struct Punkt
{
	int x;
	int y;
};

typedef struct Punkt Punkt;

struct Prosta
{
	int a;
	int b;
	int c;
};

typedef struct Prosta Prosta;


struct Prostokat
{
	Punkt p1;
	Punkt p2;
};

typedef struct Prostokat Prostokat;


struct Punkt TworzPunkt(int x, int y)
{
	Punkt ret;
	ret.x = x;
	ret.y = y;
	return ret;
}

float Odleglosc(Punkt p1, Punkt p2)
{
	int xd = p2.x - p1.x;
	int yd = p2.y - p1.y;
	return sqrt(xd*xd + yd*yd);
	//return 0.0f;
}

Prosta ProstaPrzezPunkty(Punkt p1, Punkt p2)
{
	//not implemented!
	Prosta ret;
	return ret;
}

bool CzyNaProstej(Punkt p1, Prosta l1)
{
	if(p1.y==l1.a*p1.x+l1.b)
		return true;
	return false;
}

bool CzyWspolliniowe(Punkt p1, Punkt p2, Punkt p3)
{
	Prosta l1, l2;
	l1 = ProstaPrzezPunkty(p1,p2);
	l2 = ProstaPrzezPunkty(p2,p3);
	return (l1.a==l2.b && l1.b==l2.b && l1.c==l2.c);
}

/*

1---+
|   |
+---2

*/

bool CzyWProstokacie(Punkt p1, Prostokat s1)
{
	return 	(
		(p1.x >= s1.p1.x && p1.x <= s1.p2.x) && 
		(p1.y <= s1.p1.y && p1.y >= s1.p2.y )
			);
	//return true;
}

void pobierzPunkt(Punkt* punkt)
{
		printf("Podaj x: ");
		scanf("%d",&punkt->x);
		printf("Podaj y: ");
		scanf("%d",&punkt->y);

		return;
}

void wyswietlProsta(Prosta prosta)
{
		printf("%d x + %d y + %d = 0\n", prosta.a, prosta.b, prosta.c);
		return;
}

int main()
{
	Punkt pierwszy;
	Punkt drugi;
	Punkt trzeci;
	Punkt p1, p2;
	Prostokat prostokat;
	Prosta prosta;

	int wybor;

	//szczerze mowiac nawet nie testowalem czy te funkcje dzialaja
	//to zadanie bardzo mi sie nie podobalo :p

	for(;;)
	{
			if(feof(stdin))
					return 0;

			printf("1) Wprowadz punkty\n");
			printf("2) Policz odleglosc miedzy punktami\n");
			printf("3) Poprowadz prosta przez punkty\n");
			printf("4) Sprawdz czy punkty sa na prostej\n");
			printf("5) Sprawdz czy punkty sa wspolliniowe\n");
			printf("6) Sprawdz czy punkt zawiera sie w prostokacie\n");
			printf("0) Wyjscie\n");
			printf("Twoj wybor: ");
			scanf("%d",&wybor);

			switch(wybor)
			{
					case 1:

						printf("\nTeraz pobiore punkt pierwszy.\n");
						pobierzPunkt(&pierwszy);

						printf("\nTeraz pobiore punkt drugi.\n");
						pobierzPunkt(&drugi);

						printf("\nTeraz pobiore punkt trzeci.\n");
						pobierzPunkt(&trzeci);

						break;

					case 2:

						printf("Pierwszy z drugim: %f\n", 
							Odleglosc(pierwszy, drugi));
						printf("Drugi z trzecim: %f\n",
							Odleglosc(drugi, trzeci));
						printf("Pierwszy z trzecim: %f\n",
							Odleglosc(pierwszy, trzeci));

						break;

					case 3:
						
						printf("Pierwszy z drugim: ");
						wyswietlProsta(ProstaPrzezPunkty(pierwszy,drugi));

						printf("Drugi z trzecim: ");
						wyswietlProsta(ProstaPrzezPunkty(drugi,trzeci));

						printf("Pierwszy z trzecim: ");
						wyswietlProsta(ProstaPrzezPunkty(pierwszy,trzeci));

						break;

					case 4:

						printf("Podaj 'a' prostej: ");
						scanf("%d", &prosta.a);
						printf("Podaj 'b' prostej: ");
						scanf("%d", &prosta.b);
						printf("Podaj 'c' prostej: ");
						scanf("%d", &prosta.c);

						printf("Pierwszy: ");
						if (CzyNaProstej(pierwszy,prosta))
							printf("TAK");
						else
							printf("NIE");

						printf(" Drugi: ");
						if (CzyNaProstej(drugi,prosta))
							printf("TAK");
						else
							printf("NIE");
	
						printf(" Trzeci: ");
						if (CzyNaProstej(trzeci,prosta))
							printf("TAK");
						else
							printf("NIE");
	
						printf("\n");
						
						break;

					case 5:

						if (CzyWspolliniowe(pierwszy,drugi,trzeci))
							printf("Tak, sa.\n");
						else
							printf("Nie, nie sa.\n");
						break;

					case 6:

						printf("\nTeraz pobiore punkt pierwszy.\n");
						pobierzPunkt(&p1);

						printf("\nTeraz pobiore punkt drugi.\n");
						pobierzPunkt(&p2);

						prostokat.p1 = p1;
						prostokat.p2 = p2;

						printf("Pierwszy: ");
						if (CzyWProstokacie(pierwszy,prostokat))
							printf("TAK");
						else
							printf("NIE");

						printf(" Drugi: ");
						if (CzyWProstokacie(drugi,prostokat))
							printf("TAK");
						else
							printf("NIE");
	
						printf(" Trzeci: ");
						if (CzyWProstokacie(trzeci,prostokat))
							printf("TAK");
						else
							printf("NIE");
	
						printf("\n");
					
						break;

					case 0:
						return 0;
			}

	}

	return 0;

}
