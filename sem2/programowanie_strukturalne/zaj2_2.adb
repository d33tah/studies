with ada.text_io, ada.integer_text_io;
use ada.text_io, ada.integer_text_io;

--Napisać program zawierający:
-- * typ rekordowy Osoba z wyróżnikiem kierowca typu logicznego domyślnie 
--   fałszywym; o polach Imie, Nazwisko, Pesel (ciągi znaków), data_urodzenia 
--   (typu rekordowego Data o polach Dzien, Miesiac i Rok), i w przypadku gdy 
--   osoba jest kierowcą - Tablica_Kategorii (tablica wartości logicznych 
--   indeksowana typem wyliczeniowym Kategorie_PJ o wartościach 
--   odpowiadających kategoriom prawa jazdy),
-- * niezawęzony typ tablicowy TabOs przechowujący osoby,
-- * procedury: pobierającą (Pobierz) i wypisującą (Wypisz) osobę podaną jako 
--   parametr. W procedurze Pobierz data urodzenia ma być wypełniana 
--   automatycznie na podstawie podanego numeru pesel,
-- * procedury: pobierającą (Pobierz) i wypisującą (Wypisz) tablicę osób 
--   podaną jako parametr,
-- * procedurę OdbierzPJ modyfikującą zawartość tablicy osób podaną jako 
--   parametr poprzez odebranie prawa jazdy osobie o peselu podanym jako 
--   parametr; procedura przed zmianą danych ma wypisać osobę i zażądać 
--   potwierdzenia decyzji o zmianie,
-- * procedurę DodajPJ modyfikującą zawartość tablicy osób podanej jako 
--   parametr poprzez dodanie prawa jazdy lub dodanie kategorii posiadanego 
--   prawa jazdy osobie o peselu podanym jako parametr
--
--oraz test powyższych procedur, wykonany na tablicy o podanej przez 
--użytkownika długości.

pragma Warnings(Off);

procedure zaj2_2 is
    type taknie is (Tak, Nie);
    type kategorie is (A, A1, B, B1, C, C1, D, D1, T, BE, CE, DE, C1E, D1E);
    type kategorie_PJ is array(kategorie) of boolean;

    package taknie_io is new Ada.Text_IO.Enumeration_IO(taknie);
    use taknie_io;

    package kategorie_io is new Ada.Text_IO.Enumeration_IO(kategorie);
    use kategorie_io;

    package boolean_io is new Ada.Text_IO.Enumeration_IO(boolean);
    use boolean_io;

    type Data is record
        Dzien: Integer range 1..31;
        Miesiac: Integer range 1..12;
        Rok: Integer;
    end record;


    type Osoba (kierowca: boolean:=false) is record
        Imie: String(1..20) := (others=>character'val(0));
        Nazwisko: String(1..30) := (others=>character'val(0));
        Pesel: String(1..11) := (others=>character'val(0));
        Data_Urodzenia: Data;
        case kierowca is
            when true=> Tablica_Kategorii: Kategorie_PJ:=(others=>false);
            when false=> null;
        end case;
    end record;

    type TabOs is array(positive range <>) of Osoba;

    procedure pobierzprawko(os: out Osoba) is
        tmp_k: kategorie;
        n: positive;
    begin
        put("Podaj liczbe kategorii do wprowadzenia: ");
        get(n);
        for i in 1..n loop
            put("Podaj kategorie ");
            put(i,0);
            put(": ");
            get(tmp_k);
            skip_line;
            os.Tablica_Kategorii(tmp_k):=true;
        end loop;
    end;

    procedure wypiszprawko(os: in Osoba) is
    begin
        put_line("Posiadane kategorie prawa jazdy: ");
        for i in kategorie loop
            --put("Sprawdzam ");
            --put(i);
            --put("...");
            --put(os.Tablica_Kategorii(i));
            --new_line;
            if os.Tablica_Kategorii(i)=true then
                put(i);
                new_line;
            end if;
        end loop;
    end;

    procedure pobierz(os: out Osoba) is
        tmp: integer;
        czykierowca: taknie;
        czykierowca_bool: boolean:=false;
    begin
        put("Czy jest to kierowca? ");
        get(czykierowca);
        skip_line;

        if(czykierowca=Tak) then
            czykierowca_bool:=true;
        end if;

        declare
            ret: Osoba(czykierowca_bool);
        begin
            pobierzprawko(ret);
            os:=ret;
        end;

        put("Podaj imie: ");
        get_line(os.Imie,tmp);
        put("Podaj nazwisko: ");
        get_line(os.Nazwisko,tmp);
        put("Podaj PESEL: ");
        get_line(os.pesel,tmp);

        os.Data_Urodzenia.dzien := integer'value(os.pesel(5..6));
        os.Data_Urodzenia.miesiac := integer'value(os.pesel(3..4));
        os.Data_Urodzenia.rok := 1900 + integer'value(os.pesel(1..2));

    end;

    procedure pobierz(arr: out TabOs) is
    begin
        for i in arr'range loop
            put("Teraz pobiore osobe numer ");
            put(i,0);
            put_line(".");
            pobierz(arr(i));
            new_line;
        end loop;
    end;

    procedure wypisz(os: in Osoba) is
    begin
        put("Imie: ");
        put(os.Imie);
        new_line;
        put("Nazwisko: ");
        put(os.Nazwisko);
        new_line;
        put("PESEL: ");
        put(os.Pesel);
        new_line;
        put("Data urodzenia: ");
        put(os.Data_Urodzenia.dzien,0);
        put("-");
        put(os.Data_Urodzenia.miesiac,0);
        put("-");
        put(os.Data_Urodzenia.rok,0);
        new_line;

        put("Kierowca: ");
        if(os.Kierowca) then
            put_line("Tak");
            wypiszprawko(os);
        else
            put_line("Nie");
        end if;
    end;

    procedure wypisz(arr: in TabOs) is
    begin
        for i in arr'range loop
            put("Teraz wypisze osobe numer ");
            put(i,0);
            put_line(".");
            wypisz(arr(i));
            new_line;
        end loop;
    end;

    procedure odbierzPJ(arr: out TabOs; pesel: in string) is
        potwierdzenie: taknie;
        tmp_os: Osoba(false);
    begin
        for i in arr'range loop
            if(arr(i).pesel=pesel and arr(i).kierowca) then
                put_line("Znaleziono ta osobe. Wyswietlam jej dane...");
                wypisz(arr(i));
                put("Czy na pewno chcesz odebrac tej osobie prawo jazdy? " &
                "TAK/NIE: ");
                get(potwierdzenie);
                if(potwierdzenie=tak) then
                    tmp_os.imie:=arr(i).imie;
                    tmp_os.nazwisko:=arr(i).nazwisko;
                    tmp_os.pesel:=arr(i).pesel;
                    tmp_os.Data_Urodzenia:=arr(i).Data_Urodzenia;
                    arr(i):=tmp_os;
                end if;       
            end if;
        end loop;
    end;

    procedure dodajPJ(arr: out TabOS; pesel: in string) is
        tmp_os: Osoba(true);
    begin
        for i in arr'range loop
            if(arr(i).pesel=pesel) then
                put_line("Znaleziono ta osobe. Wyswietlam jej dane...");
                wypisz(arr(i));
                if (arr(i).kierowca) then
                    pobierzprawko(arr(i));
                else
                    tmp_os.imie:=arr(i).imie;
                    tmp_os.nazwisko:=arr(i).nazwisko;
                    tmp_os.pesel:=arr(i).pesel;
                    tmp_os.Data_Urodzenia:=arr(i).Data_Urodzenia;
                    pobierzprawko(tmp_os);
                    arr(i):=tmp_os;
                end if;
            end if;
        end loop;
    end;

n: positive;
begin
    put("Podaj dlugosc tablicy: ");
    get(n);
    declare
        arr: TabOs(1..n);
    begin
        pobierz(arr);
        odbierzPJ(arr,"90100910031");
        wypisz(arr);
        dodajPJ(arr,"90100910031");
        wypisz(arr);
    end;
end;
