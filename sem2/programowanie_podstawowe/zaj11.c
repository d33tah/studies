#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define DEBUG

/*
Napisac program w jezyku C, zawierajacy:
* typ Lancuszek odpowiadajacy strukturze dynamicznej, której elementy 
  przechowuja liczbe całkowita i wskaznik na nastepny element łancuszka;
* funkcje Wstaw dodajaca na koncu łancuszka podanego jako parametr element 
  zawierajacy liczbe podana jako parametr, przy czym jesli łancuszek zawiera 
  już taka liczbe, to wstawienie polega na „przepieciu” na koniec 
  odpowiedniego elementu łancuszka;
* funkcje Wypisz wypisujaca liczby z łancuszka bedacego parametrem. Program 
  ma wykorzystac powyższe konstrukcje do pobrania od użytkownika zawartosci 
  łancuszka (użytkownik podaje liczby i decyduje o zakonczeniu podawania) 
  oraz wypisania jego zawartosci.

Zad. 2: Rozszerzyc program z zad.1 o funkcje DodajSortLimit dodajaca do 
łancuszka bedacego parametrem element przechowujacy liczbe L podana jako 
parametr. Dodawanie ma byc wykonywane nastepujaco: zakładamy, że łancuszek 
wejsciowy jest uporzadkowany niemalejaco, dodawanie ma zachowac uporzadkowanie
łancuszka; przy tym jesli łancuszek zawiera już N elementów 
przechowujacych dodawana liczbe (gdzie N jest liczba całkowita nieujemna 
podana jako parametr), to wszystkie te elementy sa zastepowane pojedynczym 
elementem przechowujacym te liczbe (przykład: dla łancuszka 111227778, 
liczby L=7 i N=3 dostaniemy 1112278, a dla N=4 1112277778), należy przy tym 
zwalniac pamiec zajmowana przez usuwane elementy. Funkcje wykorzystac w 
programie

Zad. 3: Rozszerzyc program z zad.1 o funkcje CzyPodspisWsteczny zwracajaca 
wartosc całkowita (0 lub 1) mówiaca, czy drugi ze spisów podanych jako 
parametr jest wstecznym podspisem spisu podanego jako pierwszy parametr , tj. 
czy S1 zawiera wszystkie elementy S2, ale w odwróconym porzadku (przykład: 
dla S1 postaci 1->2->3->4->5 i S2 postaci 4->2->1 funkcja ma zwrócic 1). 
Funkcja nie może wykorzystywac tablic ani spisów pomocniczych.
*/

struct Lancuszek
{
    int val;
    struct Lancuszek* next;
};

typedef struct Lancuszek Lancuszek;

void wstaw(Lancuszek **lancuszek, int liczba)
{
    Lancuszek *ptr;
    Lancuszek *new = malloc(sizeof(Lancuszek));
    
    new->val=liczba;
    new->next=NULL;

    if(*lancuszek==NULL)
    {
        *lancuszek=new;
    }
    else
    {
        ptr=*lancuszek;
        while(ptr->next!=NULL)
        ptr=ptr->next;

        ptr->next=new;
    }

    return;
}

void wyswietl(Lancuszek *lancuszek)
{

    Lancuszek *ptr = lancuszek;

    if(lancuszek==NULL)
        return;

    while(ptr!=NULL)
    {
        printf("%d\n",ptr->val);
        ptr=ptr->next;
    }

    return;

}

void dodajMiedzy(Lancuszek *lewy, Lancuszek *prawy, Lancuszek *srodkowy)
{
    lewy->next=srodkowy;
    srodkowy->next=prawy;
    return;
}

Lancuszek* poprzedni(Lancuszek* pierwszy, Lancuszek* nastepny)
{
    Lancuszek* prev=pierwszy;

    if(nastepny==pierwszy)
        return NULL;

    while(prev!=NULL && prev->next!=nastepny)
    {
        prev=prev->next;
    }

    if(prev->next==nastepny)
    {
        #ifdef DEBUG
        printf("Victory!\n");
        #endif
        return prev;
    }


    if(prev==NULL)
    {
        #ifdef DEBUG
        printf("WTF. prev=NULL\n");
        #endif
    
    }    
    else
        if(prev->next==NULL)
        {
            #ifdef DEBUG
            printf("prev->next==NULL!!\n");
            #endif
        }
    return prev;

}

bool osiagnietoLimit(Lancuszek *lancuszek, int liczba, int n)
{
    Lancuszek *szukany = lancuszek;
    Lancuszek *tmp;
    int i;
    bool ret=false;
    
    if(n!=1)
        n-=1;
    
    while(szukany!=NULL)
    {
        tmp=szukany;
        if(tmp->val==liczba)
        {
            for(i=1; i<=n; i++)
            {
                #ifdef DEBUG
                printf("Jestem tu! ret=%d, i=%d, n=%d \n", 
                        tmp!=NULL && tmp->val==liczba, i, n);
                #endif
                
                if(tmp!=NULL)
                {
                    if(tmp->val==liczba && i==n)
                    {
                        ret=true;
                        break;
                    }
                }
                else
                {
                    break;
                }
                tmp=tmp->next;
            }
        }
        
        if(ret)
            break;
        
        szukany=szukany->next;
    }
    
    return ret;
}

void usun(Lancuszek **lancuszek, Lancuszek *usuwany)
{
    Lancuszek *prev;

    if((*lancuszek)==NULL)
    {
        #ifdef DEBUG
        printf("Nie ma co usuwac!\n");
        #endif
        
        return;
    }

    if(*lancuszek==usuwany && (*lancuszek)->next==NULL)
    {
        #ifdef DEBUG
        printf("Usuwamy lancuszek jednoelementowy!\n");
        #endif
        
        free(*lancuszek);
        *lancuszek=NULL;
        return;
    }

    if(*lancuszek==usuwany)
    {
        #ifdef DEBUG
        printf("Usuwamy od dolu!\n");
        #endif
        
        *lancuszek=(*lancuszek)->next;
        free(usuwany);
        return;
    }

    prev=poprzedni(*lancuszek, usuwany);

    if(usuwany->next==NULL)
    {
        #ifdef DEBUG
        printf("Usuwamy od gory!\n");
        #endif
        
        prev->next=NULL;
        free(usuwany);
        return;
    }

    prev->next = usuwany->next;
    free(usuwany);
}

void DodajSortLimit(Lancuszek **lancuszek, int liczba, int n)
{
    Lancuszek *new;
    Lancuszek *prawy = *lancuszek;
    int i;

    if(*lancuszek==NULL)
    {
        #ifdef DEBUG
        printf("*lancuszek=NULL, omijam\n");
        #endif
        
        wstaw(lancuszek,liczba);
        return;
    }
    
    if(osiagnietoLimit(*lancuszek,liczba,n))
    {
        #ifdef DEBUG
        printf("Osiagnieto limit.\n");
        #endif
        
        while(prawy!=NULL)
        {
            if(prawy->val==liczba)
            {
                #ifdef DEBUG
                printf("Znalazlem liczbe, bede usuwac.\n");
                #endif
                
                if(prawy->next!=NULL && prawy->next->val==liczba)
                {
                    #ifdef DEBUG
                    printf("Usune element...\n");
                    #endif
                    
                    usun(lancuszek,prawy->next);
                }
                
                break;
            }
            prawy=prawy->next;
        }
        
        return;
    }
    
    new = malloc(sizeof(Lancuszek));
    new->val=liczba;

    while(prawy!=NULL)
    {
        #ifdef DEBUG
        printf("Znaleziono liczbe: %d. ", prawy->val);
        #endif
        
        if(prawy->val>=liczba)
        {
            #ifdef DEBUG
            printf("Tu bym wstawil\n");
            #endif
            
            break;
        }
        else
        {
            #ifdef DEBUG
            printf("Szukam dalej.\n");
            #endif
        }
        
        prawy=prawy->next;
    }

    if(prawy==NULL)
    {
        wstaw(lancuszek,liczba);
    }
    else
    {
        if(prawy==*lancuszek)
        {
            new->next=*lancuszek;
            *lancuszek=new;
        }
        else
            dodajMiedzy( poprzedni(*lancuszek,prawy), prawy, new );
    }
    
    return;
}

void zwolnij(Lancuszek *lancuszek)
{
    while(lancuszek!=NULL)
        usun(&lancuszek,lancuszek);
    return;
}

bool CzyPodspisWsteczny(Lancuszek *pierwszy, Lancuszek *drugi)
{
	int pierwszy_len=1;
	int drugi_len=1;
	int razem=0;

	Lancuszek *pierwszy_ost=pierwszy;
	Lancuszek *drugi_ost=drugi;

	if(pierwszy==NULL || drugi==NULL)
		return false;

	while(pierwszy_ost->next!=NULL)
	{
		pierwszy_ost=pierwszy_ost->next;
		pierwszy_len++;
	}

	while(drugi_ost->next!=NULL)
	{
		drugi_ost=drugi_ost->next;
		drugi_len++;
	}

	#ifdef DEBUG
	printf("pierwszy_len=%d, drugi_len=%d\n", pierwszy_len, drugi_len);
	#endif

	if (drugi_len > pierwszy_len)
		return false;

	while(pierwszy_ost!=NULL)
	{
		if(pierwszy_ost->val==drugi->val)
		{
			#ifdef DEBUG
			printf("Powtorka!\n");
			#endif

			razem++;
			drugi=drugi->next;
		}
		pierwszy_ost=poprzedni(pierwszy,pierwszy_ost);

	}

	#ifdef DEBUG
	printf("Razem=%d\n",razem);
	#endif

	return razem==drugi_len;
}

int main()
{
    Lancuszek *lancuszek=NULL;
    Lancuszek *drugi=NULL;
    int wybor, liczba, n;

    for(;;)
    {
        if(feof(stdin)) 
            break;

        printf("1: Dodaj do lancuszka\n");
        printf("2: Wyswietl lancuszek\n");
        printf("3: Dodaj sortowane\n");
        printf("4: Dodaj do drugiego\n");
        printf("5: Wyswietl drugi\n");
        printf("6: CzyPodspisWsteczny()\n");
        printf("0: Wyjdz\n");
        printf("Twoj wybor: ");
        scanf("%d",&wybor);

        switch(wybor)
        {
            case 1: 
                printf("Podaj liczbe: ");
                scanf("%d",&liczba);
                wstaw(&lancuszek,liczba);
                break;

            case 2:
                wyswietl(lancuszek);
                break;

            case 3:
                printf("Podaj liczbe: ");
                scanf("%d",&liczba);
                printf("Podaj N: ");
                scanf("%d",&n);
                
                DodajSortLimit(&lancuszek,liczba,n);
                break;
                
            case 4: 
                printf("Podaj liczbe: ");
                scanf("%d",&liczba);
                wstaw(&drugi,liczba);
                break;

            case 5:
                wyswietl(drugi);
                break;
                
            case 6:
                if (CzyPodspisWsteczny(lancuszek,drugi))
					printf("Funkcja zwrocila prawde.\n");
				else
					printf("Funkcja zwrocila falsz.\n");
                break;

            case 0:
                zwolnij(lancuszek);
                return 0;

        }


    }

    zwolnij(lancuszek);
    return 0;
}
