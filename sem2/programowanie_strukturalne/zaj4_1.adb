with ada.text_io, ada.integer_text_io, zaj4_1_pakiet;
use ada.text_io, ada.integer_text_io, zaj4_1_pakiet;

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

procedure zaj4_1 is
    n: positive;
begin
    put("Podaj wielkosc stosu: ");
    get(n);
    declare
        wybor: integer;
        obj: stos(n);
        liczba: integer;
    begin
        loop
            put("Stos ma rozmiar ");
            put(rozmiar(obj),0);
            put_line(".");
            put_line("1: Poloz na stosie");
            put_line("2: Zdejmij ze stosu");
            put_line("3: Wyswietl stos");
            put_line("0: Wyjscie");
            put("Twoj wybor: ");
            get(wybor);
            exit when wybor=0;


            if(wybor=1) then
                begin
                put("Podaj liczbe: ");
                get(liczba);
                poloz(obj,liczba);
                exception
                    when stos_pelny=>
                        put_line("BLAD: Stos jest juz pelny.");
                end;
            elsif(wybor=2) then
                begin
                zdejmij(obj,liczba);
                put("Zdjeto ze stosu liczbe: ");
                put(liczba,0);
                put_line(".");
                exception
                    when stos_pusty=>
                        put_line("BLAD: Stos jest pusty.");
                end;
            elsif (wybor=3) then
                wyswietl(obj);
            else
                put_line("Nieprawidlowy wybor.");
            end if;

        end loop;
    end;
end;
