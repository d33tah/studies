----Napisać pakiet implementujący stosy liczb całkowitych przy użyciu tablic,        
----tj. udostępniający:                                                              
---- *  typ prywatny stos, będący typem rekordowym z wyróżnikiem całkowitym          
----    max_rozmiar, o polach: dane (tablica rozmiaru max_rozmiar indeksowana        
----    typem całkowitym) i wierzcholek (liczba całkowita - indeks elementu          
----    będącego na wierzchu stosu),                                                 
---- *  wyjątki stos_pusty i stos_pelny,                                             
---- *  procedurę wypisującą zawartość stosu podanego jako parametr,                 
---- *  procedurę wkładającą na stos podany jako parametr liczbę podaną jako         
----    parametr (w przypadku, kiedy włożenie liczby na stos jest niemożliwe,        
----    procedura ma zgłaszać wyjątek stos_pelny),                                   
---- *  procedurę zdejmującą element ze stosu podanego jako parametr (wartość        
----    zdjętego elementu ma być przekazana do programu, w przypadku gdy na          
----    stosie nie ma elementu do zdjęcia procedura ma zwracać wyjątek               
----    stos_pusty),                                                                 
---- *  funkcję zwracającą rozmiar stosu podanego jako parametr                      
----                                                                                 
----oraz program testujący działanie pakietu.

package zaj4_1_pakiet is


    type stos(max_rozmiar: integer:=10) is private;
    procedure poloz(obj: in out stos; liczba: in integer);
    procedure zdejmij(obj: in out stos; ret: out integer);
    function rozmiar(obj: in stos) return integer;
    procedure wyswietl(obj: in stos);

    stos_pusty: Exception;
    stos_pelny: Exception;

    type t_dane is array(integer range <>) of integer;
    private type stos(max_rozmiar: integer:=10) is record
        dane: t_dane(1..max_rozmiar);
        wierzcholek: integer:=0;
    end record;


end zaj4_1_pakiet;
