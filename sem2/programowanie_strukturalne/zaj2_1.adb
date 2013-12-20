with ada.text_io, ada.integer_text_io, ada.float_text_io; 
use  ada.text_io, ada.integer_text_io, ada.float_text_io;

--Napisać program zawierający:
-- x typ wyliczeniowy Typ_Pojazdu o elementach Osobowy, Ciezarowy, Inny;
-- x typ rekordowy Pojazd z wyróżnikiem Rodzaj typu Typ_pojazdu, o polach: 
--   Numer_Rejestracyjny (ciąg 7 znaków), Rok_Produkcji (liczba całkowita z 
--   zakresu 1900-2010), Marka (ciąg znaków) oraz jeśli wyróżnik ma wartość 
--   Osobowy - Liczba_Osob (liczba całkowita dodatnia), a jeśli wyróżnik ma 
--   wartość Ciezarowy - Ladownosc (liczba rzeczywista nieujemna);
-- x niezawężony typ tablicowy Spis_pojazdow;
-- x procedury pobierające (Get) i wypisujące (Put) pojedynczy pojazd;
-- x procedury pobierające (Get) i wypisujące (Put) spis pojazdów (procedury 
--   powinny wykorzystywać procedury z punktu wyżej).
-- * funkcję Najstarszy zwracającą najstarszy pojazd typu podanego jako 
--   parametr, umieszczony w tablicy podanej jako parametr,
-- * funkcję Laczna_Ladownosc zwracającą łączną ładowność wszystkich pojazdów 
--   ciężarowych umieszczonych w ewidencji.
--Napisać program wczytujący i wypisujący spis pojazdów o podanej przez 
--użytkownika liczebności, a następnie znajdujący w ewidencji najstarszy 
--pojazd podanego przez użytkownika typu oraz wypisujący łączną ładowność 
--wszystkich pojazdów ciężarowych umieszczonych w ewidencji.

procedure zaj2 is

    subtype f_positive is Float range 1.0..Float'last;

    type Typ_Pojazdu is (Osobowy, Ciezarowy, Inny);
    package tmp_io is new Ada.Text_IO.Enumeration_IO(Typ_Pojazdu);
    use tmp_io;

    type Pojazd (Rodzaj: Typ_Pojazdu:=Ciezarowy) is record
        Numer_Rejestracyjny: String(1..7) := (others => character'val(0));
        Rok_Produkcji: Integer range 1900..2010;
        Marka: String(1..30) := (others => character'val(0));
        case Rodzaj is
            when Ciezarowy=>
                Ladownosc: f_positive:=1.0;
            when Osobowy=>
                Liczba_Osob: positive;
            when others=> null;
        end case;
    end record;

    type Spis_Pojazdow is array(positive range <>) of Pojazd;

    procedure get (v_pojazd: out Pojazd) is
        rodzaj: Typ_Pojazdu;
        tmp: integer;
        powtorz: boolean:=false;
    begin
        loop
            begin
                put("Podaj rodzaj pojazdu: ");
                get(rodzaj);
                powtorz:=false;
            exception
                when Data_Error=>powtorz:=true;
            end;
            exit when powtorz=false;
        end loop;

        declare
            tmp: Pojazd(rodzaj);
        begin
            v_pojazd:=tmp;
        end;

        skip_line;
        put("Podaj numer rejestracyjny: ");
        get_line(v_pojazd.Numer_Rejestracyjny,tmp);

        put("Podaj rok produkcji: ");
        get(v_pojazd.Rok_Produkcji);

        put("Podaj marke: ");
        skip_line;
        get_line(v_pojazd.Marka,tmp);

        if(v_pojazd.Rodzaj=Ciezarowy) then
            put("Podaj ladownosc: ");
            get(v_pojazd.Ladownosc); 
        end if;

        if(v_pojazd.Rodzaj=Osobowy) then
            put("Podaj liczbe osob: ");
            get(v_pojazd.Liczba_Osob);
        end if;
    end;

    procedure put (v_pojazd: in Pojazd) is
    begin
        put("Numer rejestracyjny: ");
        put(v_pojazd.Numer_Rejestracyjny);
        new_line;
        put("Marka: ");
        put(v_pojazd.Marka);
        new_line;
        put("Rok produkcji: ");
        put(v_pojazd.Rok_Produkcji);
        new_line;
        put("Rodzaj: ");
        put(v_pojazd.Rodzaj,set=>lower_case);
        new_line;

        if(v_pojazd.Rodzaj=Ciezarowy) then
            put("Ladownosc: ");
            put(v_pojazd.ladownosc,0,2,0);
            new_line;
        end if;

        if(v_pojazd.Rodzaj=Osobowy) then
            put("Liczba osob: ");
            put(v_pojazd.Liczba_Osob,0);
            new_line;
        end if;

        new_line;
    end;

    procedure get (pojazdy_arr: out Spis_Pojazdow) is
    begin
        for i in pojazdy_arr'range loop
            put("Teraz pobiore pojazd ");
            put(i,0);
            put_line(".");
            get(pojazdy_arr(i));
            new_line;
        end loop;
    end;

    procedure put (pojazdy_arr: in Spis_Pojazdow) is
    begin
        for i in pojazdy_arr'range loop
            put("Pojazd ");
            put(i,0);
            put_line(":");
            new_line;
            put(pojazdy_arr(i));
        end loop;
    end;

    function najstarszy (pojazdy_arr: in Spis_Pojazdow) return Pojazd is
        min_wiek: integer:=pojazdy_arr(pojazdy_arr'first).Rok_Produkcji;
        min_wiek_i: integer:=pojazdy_arr'first;
    begin
        for i in pojazdy_arr'range loop
            if pojazdy_arr(i).Rok_Produkcji < min_wiek then
                min_wiek:=pojazdy_arr(i).Rok_Produkcji;
                min_wiek_i:=i;
            end if;
        end loop;
        return pojazdy_arr(min_wiek_i);
    end;

    function laczna_ladownosc (pojazdy_arr: in Spis_Pojazdow) return float is
        ret: float:=0.0;
    begin
        for i in pojazdy_arr'range loop
            if (pojazdy_arr(i).rodzaj=ciezarowy) then
                ret:=ret+float(pojazdy_arr(i).ladownosc);
            end if;
        end loop;

        return ret;
    end;




    n: positive;
begin
    put("Podaj dlugosc tablicy: ");
    get(n);

    declare
        pojazdy_arr: Spis_Pojazdow(1..n);
    begin
        get(pojazdy_arr);

        put_line("Oto najstarszy z pojazdow: ");
        put(najstarszy(pojazdy_arr));

        put("Laczna ladownosc podanych pojazdow wynosi: ");
        put(laczna_ladownosc(pojazdy_arr),0,2,0);
        put_line(".");
    end;
end;
