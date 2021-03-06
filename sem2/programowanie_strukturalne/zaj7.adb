with ada.text_io, ada.integer_text_io, ada.unchecked_deallocation,zaj7_pakiet;
use  ada.text_io, ada.integer_text_io, zaj7_pakiet;

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

procedure zaj7 is

    type lista_arr is array(positive range <>) of lista;
    n: positive;
begin
    put("Podaj ilosc list: ");
    get(n);
    declare
        arr: lista_arr(1..n);
        aktualny: integer:=1;
        wybor: integer;
        liczba: integer;
    begin
        loop
            put_line("1: Przelacz liste");
            put_line("2: Dodaj element do listy");
            put_line("3: Wypisz liste");
            put_line("4: Usun jedno wystapienie liczby");
            put_line("5: Usun wszystkie wystapienia liczby");
            put_line("6: Wyczysc liste");
            put_line("7: Zlicz konkretny element listy");
            if n>1 then
                put_line("8: Skopiuj liste do listy");
                put_line("9: Porownaj dwie listy");
            end if;
            put_line("0: Wyjscie");
            put("Twoj wybor: ");
            get(wybor);
            exit when wybor=0;
            case wybor is
                when 1=>
                    loop
                    put("Podaj nowy numer listy: ");
                    get(aktualny);
                    exit when (aktualny<=n and aktualny>=1);
                    put_line("BLAD: taka lista nie istnieje.");
                    end loop;
                when 2=>
                    put("Podaj liczbe: ");
                    get(liczba);
                    wstaw(arr(aktualny),liczba);
                when 3=>
                    wypisz(arr(aktualny));
                when 4=>
                    put("Podaj liczbe: ");
                    get(liczba);
                    usun(arr(aktualny),liczba);
                when 5=>
                    put("Podaj liczbe: ");
                    get(liczba);
                    usun_wszystkie(arr(aktualny),liczba);
                when 6=>
                    wyczysc(arr(aktualny));
                when 7=>
                    put("Podaj liczbe: ");
                    get(liczba);
                    put("Liczba powtorzyla sie ");
                    put(ilosc(arr(aktualny),liczba));
                    put(" razy.");
                when others=>
                    if n>1 then
                        case wybor is
                                when 8=>
                                    loop
                                        put("Podaj numer drugiej listy: ");
                                        get(liczba);
                                        exit when (liczba<=n 
                                            and liczba>=1);
                                        put_line("BLAD: taka lista"&
                                            "nie istnieje.");
                                    end loop;
                                    skopiuj(arr(aktualny),arr(liczba));
                            when 9=>
                                loop
                                    put("Podaj numer drugiej listy: ");
                                    get(liczba);
                                    exit when (liczba<=n and liczba>=1);
                                    put_line("BLAD: taka lista"&
                                        "nie istnieje.");
                                end loop;

                                if(arr(aktualny)=arr(liczba)) then
                                    put_line("Podane tablice sa rowne.");
                                else
                                    put_line("Podane tablice nie sa rowne");
                                end if;
                            when others=>
                                put_line("BLAD: Nieprawidlowy wybor.");
                        end case;
                    else
                        put_line("BLAD: Nieprawidlowy wybor.");
                    end if;
                 
            end case;
        end loop;
    end;
end;
