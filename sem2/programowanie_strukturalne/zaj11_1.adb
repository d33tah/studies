with ada.integer_text_io, ada.text_io, zaj11_1_pakiet;
use ada.integer_text_io, ada.text_io;

--Napisać pakiet rodzajowy udostępniający:
-- * niezawężony typ tablicowy Tab przechowujący elementy dowolnego typu T, 
--   indeksowany typem całkowitym;
-- * procedurę wczytującą dane do tablicy typu Tab podanej jako parametr;
-- * procedurę wypisującą zawartość tablicy typu Tab podanej jako parametr;
-- * funkcję zwracającą wartość logiczną mówiącą, czy tablica typu Tab podana 
--   jako parametr zawiera powtórzenia;
-- * funkcję zwracającą największy element w tablicy typu Tab podanej jako 
--   parametr;
-- * procedurę porządkującą niemalejąco zawartość tablicy typu Tab podanej 
--   jako parametr
--
--oraz program (lub programy) konkretyzujący ten pakiet dla (a) liczb 
--całkowitych (b) rekordów przechowujących dane osobowe i testujący jego 
--działanie

procedure zaj11_1 is

    --czesc "liczbowa"

    procedure i_get (i: out integer)is begin get(i);  end;
    procedure i_put (i: integer) is begin put(i,0);end;
    package t_liczby is new zaj11_1_pakiet(integer,i_get,i_put,">");
    use t_liczby;

    --czesc "osobowa"

    type osoba is record
        imie_nazwisko: string (1..30) := (others=>character'val(0));
        pesel: integer;
    end record;

    procedure o_get(o: out osoba) is
        tmp: integer;
    begin
        o.imie_nazwisko:=(others=>character'val(0));
        put("Podaj imie i nazwisko: ");
        skip_line;
        get_line(o.imie_nazwisko,tmp);
        put("Podaj PESEL: ");
        get(o.pesel);
    end;

    procedure o_put(o: in osoba) is
    begin
        put_line("Imie i nazwisko: " & o.imie_nazwisko & ".");
        put_line("PESEL: " & integer'image(o.pesel) & ".");
    end;

    function ">" (o1: osoba; o2: osoba) return boolean is
    begin
        return o1.pesel < o2.pesel;
    end;

        package t_osoby is new zaj11_1_pakiet(osoba,o_get,o_put,">");           
        use t_liczby;                                                              


    --reszta definicji

    liczba_n: positive;
    liczba_o: positive;
begin
    put("Podaj dlugosc listy liczbowej: ");
    get(liczba_n);
    put("...i listy osobowej: ");
    get(liczba_o);
    declare
        t: t_liczby.tab(1..liczba_n);
        t2: t_osoby.tab(1..liczba_o);
        wybor: integer;
    begin
        loop
            put_line("1: Wczytaj liste liczbowa");
            put_line("2: Wypisz liste liczbowa");
            put_line("3: Podaj najwiekszy element listy liczbowej");
            put_line("4: Uporzadkuj niemalejaco liste liczbowa");
            put_line("5: Sprawdz czy lista zawiera powtorzenia");
            put_line("6: Wczytaj liste osobowa");
            put_line("7: Wypisz liste osobowa (i sprawdz powtorzenia");
            put_line("8: Podaj najwiekszy element listy osobowej");
            put_line("9: Uporzadkuj niemalejaco liste osobowa");
            put_line("0: Wyjscie");
            put("Twoj wybor: ");
            get(wybor);
            exit when wybor=0;
            case wybor is
                when 1=>
                    wczytaj(t);
                when 2=>
                    wypisz(t);
                when 3=>
                    put_line("Najwiekszy element tej listy to:" & 
                        integer'image(max(t)) & ".");
                when 4=>
                    niemalejaco(t);
                when 5=>
                    if(zawiera_powtorzenia(t)) then
                        put_line("Lista zawiera powtorzenia.");
                    else
                        put_line("Lista nie zawiera powtorzen.");
                    end if;
                when 6=>
                    wczytaj(t);
                when 7=>
                    wypisz(t);
                    if(zawiera_powtorzenia(t)) then
                        put_line("Lista zawiera powtorzenia.");
                    else
                        put_line("Lista nie zawiera powtorzen.");
                    end if;
                when 8=>
                    put_line("Najwiekszy element tej listy to:" & 
                        integer'image(max(t)) & ".");
                when 9=>
                    niemalejaco(t);
               when others=>
                    put_line("BLAD: nieprawidlowy wybor");
            end case;
        end loop;
    end;
end;
