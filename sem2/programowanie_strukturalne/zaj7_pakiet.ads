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

package zaj7_pakiet is
    
    type lista is limited private;
    type lista_record;
    type lista_ptr is access lista_record;
    type lista_record is record
        val: integer;
        nast: lista_ptr;
    end record;
    procedure free is new ada.unchecked_deallocation(lista_record,lista_ptr);

    procedure wstaw(v_lista: in out lista; liczba: integer);
    function dlugosc(v_lista: lista) return integer;
    procedure wypisz(v_lista: lista);
    procedure usun(v_lista: in out lista; liczba: integer);
    procedure wyczysc(v_lista: in out lista);
    function ilosc(v_lista: lista; liczba: integer) return integer;
    procedure usun_wszystkie(v_lista: in out lista; liczba: integer);
    function n_ty(v_lista: lista; liczba: integer) return integer;
    procedure skopiuj(v1_lista: in lista; v2_lista: in out lista);
    function "="(v1_lista: lista; v2_lista: lista) return boolean;


    private

    type lista is record
        pocz: lista_ptr;
    end record;
    

    blad_listy: exception;

end;
