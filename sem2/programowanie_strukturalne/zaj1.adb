with ada.text_io, ada.integer_text_io, ada.Characters.Handling, 
    ada.float_text_io;
use ada.text_io, ada.integer_text_io, ada.Characters.Handling,
    ada.float_text_io;

-- Zadeklarować typ rekordowy Osoba o polach Imie, Nazwisko (ciągi znaków), 
--PESEL (ciąg znaków lub tablica cyfr), Wiek i Wzrost (liczby całkowite 
--nieujemne). Napisać:
-- * procedurę pobierającą dane osoby podanej jako parametr;
-- * procedurę wypisującą dane osoby podanej jako parametr
--oraz program testujący działanie tych procedur.
--
--Zadeklarować niezawężony typ tablicowy przechowujący osoby. Następnie 
--napisać:
-- * procedurę pobierającą tablicę osób podaną jako parametr;
-- * procedurę wypisującą tablicę osób podaną jako parametr
--oraz program testujący ich działanie.
--
--Rozszerzyć program z poprzednich punktów o następujące funkcje i procedury:
-- * funkcję zwracającą wartość logiczną mówiącą, czy w tablicy osób podanej 
--   jako parametr jest przynajmniej jeden mężczyzna (czyli czy w tablicy 
--   istnieje osoba, której przedostatni znak numeru PESEL jest nieparzysty);
-- * procedurę wypisującą wszystkie te osoby z tablicy osób podanej jako 
--   parametr, które urodziły się w miesiącu podanym jako drugi parametr 
--   (będący liczbą całkowitą z zakresu 1-12);
-- * funkcję zwracającą średni wiek osób zapisanych w tablicy podanej jako 
--   parametr;
-- * funkcję zwracającą najstarszą osobę z tablicy podanej jako parametr;
-- * procedurę wypisującą wszystkie nazwiska występujące w tablicy podanej 
--   jako parametr.
--
--Przetestować w programie ich działanie.

procedure zaj1 is

    type osoba is record
        imie: string(1..30) := (others=>character'val(0));
        nazwisko: string(1..30);
        pesel: string(1..11);
        wiek: positive;
        wzrost: positive;
    end record;

    procedure sprzatnij(str: out string; n: integer) is
    begin
        for i in (n+1)..str'last loop
            str(i):=character'val(0);
            --str(i):=' ';
        end loop;
    end;

    procedure put(tmp: in osoba) is
    begin
        put("Imie: ");
        put(tmp.imie);
        new_line;

        put("Nazwisko: ");
        put(tmp.nazwisko);
        put(".");
        new_line;

        put("PESEL: ");
        put(tmp.pesel);
        new_line;

        put("Wiek: ");
        put(tmp.wiek,0);
        new_line;

        put("Wzrost: ");
        put(tmp.wzrost,0);
        new_line(2);
    end;

    procedure get(tmp: out osoba) is
        powtorz: boolean:=true;
        last: natural;
    begin
        put("Podaj imie: ");
        skip_line(1);
        get_line(tmp.imie,last);
        sprzatnij(tmp.imie,last);
        put("Podaj nazwisko: ");
        get_line(tmp.nazwisko,last);
        sprzatnij(tmp.nazwisko,last);

        loop
            put("PESEL: ");
            get_line(tmp.pesel,last);
            sprzatnij(tmp.pesel,last);
            powtorz:=false;
            for i in tmp.pesel'range loop
                if(not is_digit(tmp.pesel(i))) then
                    powtorz:=true;
                end if;
            end loop;
            exit when not powtorz;
        end loop;

        put("Podaj wiek: ");
        get(tmp.wiek);

        put("Podaj wzrost: ");
        get(tmp.wzrost);

    end;

    type t_arr_osoba is array(integer range <>) of osoba;
    n: positive;

    procedure pobierz_tablice(arr_osoba: out t_arr_osoba) is
    begin
        for i in arr_osoba'range loop
            put("Teraz pobiore dane osoby ");
            put(i,0);
            put_line(".");
            new_line;
            get(arr_osoba(i));
        end loop;
    end;

    procedure wypisz_tablice(arr_osoba: t_arr_osoba) is
    begin
        for i in arr_osoba'range loop
            put("Osoba ");
            put(i,0);
            put_line(": ");
            new_line;
            put(arr_osoba(i));
        end loop;
    end;

    function jestmezczyzna(arr_osoba: t_arr_osoba) return boolean is
        type pol_cyfr is array(1..5) of character;
    begin
        for i in arr_osoba'range loop
            null;
            --if(znak_na_cyfre(arr_osoba(i).pesel(10)) mod 2=1 ) then
            if(integer'value(arr_osoba(i).pesel(10..10)) mod 2=1 ) then
                return true;
            end if;
        end loop;
        return false;
    end;

    function z_miesiaca(arr_osoba: t_arr_osoba; miesiac: integer)
            return t_arr_osoba is
        ilosc: integer:=0;
        rok: constant integer:=2011;
    begin
        for i in arr_osoba'range loop
            if(integer'value(arr_osoba(i).pesel(3..4))=miesiac) then
                ilosc:=ilosc+1;
            end if;
        end loop;

        declare
            ret: t_arr_osoba(1..ilosc);
        begin
			ilosc:=1;
			for i in arr_osoba'range loop
				if(integer'value(arr_osoba(i).pesel(3..4))=miesiac) then
					ret(ilosc):=arr_osoba(i);
					ilosc:=ilosc+1;
				end if;
			end loop;

            return ret;
            --null;
        end;
    end;

    function sredni_wiek(arr_osoba: t_arr_osoba) return float is
        suma: integer:=0;
    begin
        for i in arr_osoba'range loop
            suma:=suma+arr_osoba(i).wiek;
        end loop;
        return float(suma)/float(arr_osoba'length);
    end;

    function najstarszy(arr_osoba: t_arr_osoba) return osoba is
        max_wiek: integer:=arr_osoba(1).wiek;
        max_wiek_i: integer:=1;
    begin
        for i in arr_osoba'range loop
            if(arr_osoba(i).wiek > max_wiek) then
                max_wiek:=arr_osoba(i).wiek;
                max_wiek_i:=i;
            end if;
        end loop;

        return arr_osoba(max_wiek_i);
    end;

    procedure wypisz_nazwiska(arr_osoba: t_arr_osoba) is
    begin
        for i in arr_osoba'range loop
            put(arr_osoba(i).nazwisko);
            new_line;
        end loop;
    end;


begin
    put("Podaj dlugosc tablicy: ");
    get(n);
    declare
        arr_osoba: t_arr_osoba(1..n);
        srednia: float;
    begin
        pobierz_tablice(arr_osoba);

        put_line("Oto cala tablica: ");
        wypisz_tablice(arr_osoba);
        new_line;

        put_line("Oto osoby urodzone w pazdzierniku: ");
        wypisz_tablice(z_miesiaca(arr_osoba,10));
        new_line;

        if jestmezczyzna(arr_osoba) then
            put_line("W tablicy znaleziono przynajmniej jednego mezczyzne.");
        else
            put_line("W tablicy nie znaleziono zadnego mezczyzny.");
        end if;

        srednia:=sredni_wiek(arr_osoba);
        put("Sredni wiek osob w tablicy wynosi: ");
        put(srednia,0,2,0);
        put_line(".");

        put_line("Oto wszystkie nazwiska w podanych rekordach: ");
        wypisz_nazwiska(arr_osoba);

    end;
end;
