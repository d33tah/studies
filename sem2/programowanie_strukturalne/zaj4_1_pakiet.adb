with Ada.Text_IO; 
with Ada.Integer_Text_IO;
use Ada.Text_IO;
use Ada.Integer_Text_IO;

--Napisać pakiet implementujący stosy liczb całkowitych przy użyciu tablic,        
--tj. udostępniający:                                                              
-- *  typ prywatny stos, będący typem rekordowym z wyróżnikiem całkowitym          
--    max_rozmiar, o polach: dane (tablica rozmiaru max_rozmiar indeksowana        
--    typem całkowitym) i wierzcholek (liczba całkowita - indeks elementu          
--    będącego na wierzchu stosu),                                                 
-- *  wyjątki stos_pusty i stos_pelny,                                             
-- *  procedurę wypisującą zawartość stosu podanego jako parametr,                 
-- *  procedurę wkładającą na stos podany jako parametr liczbę podaną jako         
--    parametr (w przypadku, kiedy włożenie liczby na stos jest niemożliwe,        
--    procedura ma zgłaszać wyjątek stos_pelny),                                   
-- *  procedurę zdejmującą element ze stosu podanego jako parametr (wartość        
--    zdjętego elementu ma być przekazana do programu, w przypadku gdy na          
--    stosie nie ma elementu do zdjęcia procedura ma zwracać wyjątek               
--    stos_pusty),                                                                 
-- *  funkcję zwracającą rozmiar stosu podanego jako parametr                      
--                                                                                 
--oraz program testujący działanie pakietu.

package body zaj4_1_pakiet is
    procedure poloz(
        obj: in out stos; 
        liczba: in integer) is
    begin
        if obj.wierzcholek=obj.max_rozmiar then
            raise stos_pelny;
        end if;

        obj.wierzcholek:=obj.wierzcholek+1;
        obj.dane(obj.wierzcholek):=liczba;
    end;

    procedure zdejmij(
        obj: in out stos;
        ret: out integer) is
    begin
        if obj.wierzcholek=0 then
            raise stos_pusty;
        end if;

        ret:=obj.dane(obj.wierzcholek);
        obj.wierzcholek:=obj.wierzcholek-1;
    end;

    function rozmiar(
        obj: in stos) return integer is
    begin
        return obj.wierzcholek;
    end;

    procedure wyswietl(
        obj: in stos) is
    begin
        for i in 1..obj.wierzcholek loop
            put(obj.dane(i),0);
            new_line;
        end loop;
    end;
end zaj4_1_pakiet;
