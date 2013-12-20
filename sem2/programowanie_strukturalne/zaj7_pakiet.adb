with ada.text_io, ada.integer_text_io, ada.unchecked_deallocation;
use  ada.text_io, ada.integer_text_io;

--Napisać pakiet implementujący listę sortowaną przechowującą liczby 
--całkowite. Pakiet ma udostępniać następujące typy, funkcje i procedury
-- * typ rekordowy Lista przechowujący początek listy (ograniczony typ 
--   prywatny),
-- * procedurę wstawiającą do listy podanej jako parametr liczbę podaną jako 
--   parametr;
-- * procedurę wypisującą listę podaną jako parametr;
-- * procedurę kasującą zawartość listy podanej jako parametr;
-- * procedurę usuwającą z listy podanej jako parametr jeden element 
--   przechowujący liczbę podaną jako parametr;
-- * procedurę usuwającą z listy podanej jako parametr wszystkie elementy 
--   przechowujące liczbę podaną jako parametr;
-- * funkcję zwracającą długość listy podanej jako parametr;
-- * funkcję zwracającą ilość elementów listy podanej jako parametr 
--   przechowujących liczbę podaną jako parametr;
-- * funkcję zwracającą liczbę będącą N-tym elementem listy podanej jako 
--   parametr (N jest podaane jako parametr) lub zwracającą odpowiedni wyjątek
--   jeśli lista ma mniej niż N elementów;
-- * funkcję (operator) "=" dla list;
-- * procedurę kopiującą zawartość listy podanej jako pierwszy parametr do 
--   listy podanej jako drugi parametr (odpowiednik operacji podstawienia; 
--   ewentualna dotychczasowa zawartość listy będącej drugim parametrem 
--   procedury ma zostać usunięta);
--oraz program testujący działanie tego pakietu.

package body zaj7_pakiet is

    procedure wstaw(v_lista: in out lista; liczba: integer) is
        ptr: lista_ptr:=v_lista.pocz;
    begin
        if ptr=null then
            ptr:=new lista_record;
            ptr.val:=liczba;
            v_lista.pocz:=ptr;
        else
            loop
                exit when ptr.nast=null;
                ptr:=ptr.nast;
            end loop;

            ptr.nast:=new lista_record;
            ptr.nast.val:=liczba;
        end if;
    end;

    function dlugosc(v_lista: lista) return integer is
        ret: integer:=0;
        ptr: lista_ptr:=v_lista.pocz;
    begin
        loop
            exit when ptr=null;
            ptr:=ptr.nast;
            ret:=ret+1;
        end loop;
        return ret;
    end;

    procedure wypisz(v_lista: lista) is
        ptr: lista_ptr:=v_lista.pocz;
    begin
        new_line;
        put("Lista ma ");
        put(dlugosc(v_lista),0);
        put(" elementow.");
        new_line;
        loop
            exit when ptr=null;
            put(ptr.val,0);
            new_line;
            ptr:=ptr.nast;
        end loop;
        new_line;
    end;

    procedure usun(v_lista: in out lista; liczba: integer) is
        pop, nast: lista_ptr;
    begin
        nast:=v_lista.pocz;
        pop:=null;
        loop
            exit when nast=null;

            put_line("Iteracja.");

            if(nast.val=liczba) then
                if(pop=null) then --mamy poczatek listy
                    if(nast.nast=null) then
                        free(nast);
                        v_lista.pocz:=null;
                        return;
                    else
                        v_lista.pocz:=nast.nast;
                        free(nast);
                        return;
                    end if;
                else
                    pop.nast:=nast.nast;
                    free(nast);
                    return;
                end if;
            end if;

            pop:=nast;
            nast:=nast.nast;
        end loop;
    end;

    procedure wyczysc(v_lista: in out lista) is
        ptr: lista_ptr:=v_lista.pocz;
    begin
        loop
            exit when dlugosc(v_lista)=0;
            usun(v_lista,v_lista.pocz.val);
        end loop;
    end;

    function ilosc(v_lista: lista; liczba: integer) return integer is
        ptr: lista_ptr:=v_lista.pocz;
        ret: integer:=0;
    begin
        loop
            exit when ptr=null;
            if(ptr.val=liczba) then
                ret:=ret+1;
            end if;
            ptr:=ptr.nast;
        end loop;
        return ret;
    end;

    procedure usun_wszystkie(v_lista: in out lista; liczba: integer) is
        chcemy: integer:=dlugosc(v_lista)-ilosc(v_lista,liczba);
    begin
        loop
            exit when dlugosc(v_lista)=chcemy;
            usun(v_lista,liczba);
        end loop;
    end;    

    function n_ty(v_lista: lista; liczba: integer) return integer is
        ptr: lista_ptr:=v_lista.pocz;
        i: integer:=1;
    begin
        loop
            exit when ptr=null;
            if i=liczba then
                return ptr.val;
            end if;
            i:=i+1;
        end loop;
        raise blad_listy;
    end;

    procedure skopiuj(v1_lista: in lista; v2_lista: in out lista) is
        ptr: lista_ptr:=v1_lista.pocz;
    begin
        wyczysc(v2_lista);

        loop
            exit when ptr=null;
            wstaw(v2_lista,ptr.val);
            ptr:=ptr.nast;
        end loop;
    end;

    function "="(v1_lista: lista; v2_lista: lista) return boolean is
        ptr1: lista_ptr:=v1_lista.pocz;
        ptr2: lista_ptr:=v2_lista.pocz;
    begin
        if(dlugosc(v1_lista)/=dlugosc(v2_lista)) then
            return false;
        end if;

        loop
            exit when ptr1=null;
            if(ptr1.val/=ptr2.val) then
                return false;
            end if;

            ptr1:=ptr1.nast;
            ptr2:=ptr2.nast;
        end loop;
        return true;
    end;

end;
