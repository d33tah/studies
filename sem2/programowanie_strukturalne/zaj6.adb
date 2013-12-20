with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Napisać program zawierający:
-- • typ rekordowy [strukturalny] Proces o polach PID (identyfikator procesu, 
--   liczba całkowita nieujemna) i liczba_watkow (liczba całkowita dodatnia);
-- • typ Kolejka_procesow będący strukturą dynamiczną w formie kolejki FIFO o
--   elementach przechowujących dane towaru (typ Proces) i wskaźnik na 
--   następny element w kolejce;
-- • procedurę [funkcję] Wypisz o parametrze typu Kolejka_procesow wypisującą
--   dane procesów w kolejce podanej jako parametr;
-- • procedurę [funkcję] Dodaj_do_kolejki, dodającą do kolejki procesów 
--   podanej jako parametr element odpowiadający procesowi podanemu jako 
--   parametr. Jeżeli proces o podanym identyfikatorze nie występuje w 
--   kolejce, proces ten jest dodawany na koniec kolejki. W przeciwnym wypadku
--   zamiast wstawiania do kolejki kolejnego elementu modyfikujemy pole 
--   liczba_watkow procesu umieszczonego w spisie, zwiększając je o liczbę 
--   wątków podaną w parametrze procedury;
-- • procedurę [funkcję] Przestaw_na_poczatek, modyfikującą kolejkę procesów 
--   podaną jako pierwszy parametr procedury przez przestawienie na początek 
--   kolejki procesu o identyfikatorze podanym jako drugi parametr procedury 
--   (o ile ten proces nie jest już na początku kolejki). W przypadku, gdy 
--   proces o podanym identyfikatorze nie występuje w kolejce należy zgłosić 
--   wyjątek Nieznany_proces [zwrócić błąd].
--Program wykorzystuje powyższe konstrukcje do utworzenia kolejki procesów na 
--podstawie danych pobranych od użytkownika (użytkownik podaje identyfikatory 
--i liczbę wątków dla każdego procesu oraz decyduje o zakończeniu podawania 
--danych) i przestawiania w tej kolejce na początek procesu o identyfikatorze
--podanym przez użytkownika (procedura [funkcja] Przestaw_na_poczatek).

procedure zaj6 is

    type proces is record
        pid: natural;
        liczba_watkow: positive:=1;
    end record;

    type kolejka_procesow;
    type kolejka_procesow_ptr is access kolejka_procesow;
    type kolejka_procesow is record
        val: proces;
        nast: kolejka_procesow_ptr:=null;
    end record;
    nieznany_proces: exception;

    procedure wypisz(kolejka: in kolejka_procesow) is
        ptr: kolejka_procesow_ptr;
    begin
        put("PID: ");
        put(kolejka.val.pid,0);
        put("; liczba_watkow: ");
        put(kolejka.val.liczba_watkow,0);
        new_line;
        ptr:=kolejka.nast;
        loop
            exit when ptr=null;    
            put("PID: ");
            put(ptr.val.pid,0);
            put("; liczba_watkow: ");
            put(ptr.val.liczba_watkow,0);
            new_line;
            ptr:=ptr.nast;
        end loop;
        null;
    end;

    function istnieje
        (gdzie: kolejka_procesow_ptr; 
        co: integer;
        zwieksz_od_razu: boolean:=false
        ) return boolean is
        ptr: kolejka_procesow_ptr:=gdzie;
    begin
        loop
            exit when ptr=null;
            if (ptr.val.pid=co) then
                if (zwieksz_od_razu) then
                    ptr.val.liczba_watkow:=ptr.val.liczba_watkow+1;
                end if;
                return true;
            end if;
            ptr:=ptr.nast;
        end loop;
        return false;
    end;

    procedure dodaj_do_kolejki (gdzie: out kolejka_procesow_ptr; co: integer) is
        tmp: kolejka_procesow_ptr:=gdzie;
    begin
        if(gdzie=null) then
            gdzie:=new kolejka_procesow;
            gdzie.val.pid:=co;
        else
            if (not(istnieje(gdzie,co,true))) then
                loop
                    exit when tmp.nast=null;
                    tmp:=tmp.nast;
                end loop;
                tmp.nast:=new kolejka_procesow;
                tmp.nast.val.pid:=co;
            end if;
        end if;
    end;

    procedure przestaw_na_poczatek 
        (skad: in out kolejka_procesow_ptr; 
        co: integer) is

        poprz, nast: kolejka_procesow_ptr;
    begin
        if(not(istnieje(skad,co))) then
            raise nieznany_proces;
        end if;

        if(skad.val.pid=co) then
            put_line("DEBUG: Juz na poczatku");
            return;
        end if;

        nast:=skad;
        poprz:=nast;
        nast:=poprz.nast;
        loop
            if(nast.val.pid=co) then
                put("Znalazlem element. Poprzedni to: ");
                put(poprz.val.pid,0);
                new_line;

                poprz.nast:=nast.nast;
                nast.nast:=skad;
                skad:=nast;
                return;
            end if;
            poprz:=nast;
            nast:=poprz.nast;
        end loop;
    end;

kolejka: kolejka_procesow_ptr;
wybor: integer;
pid: integer;
begin
    loop
        put_line("1: Dodaj do kolejki");
        put_line("2: Wypisz kolejke");
        put_line("3: Przesun proces na poczatek");
        put_line("0: Wyjscie");
        put("Twoj wybor: ");
        get(wybor);
        exit when wybor=0;
        case wybor is
            when 1=>
                put("Podaj PID: ");
                get(pid);
                dodaj_do_kolejki(kolejka,pid);
            when 2=>
                if (kolejka/=null) then 
                    wypisz(kolejka.all); 
                else 
                    put_line("Kolejka jest pusta!");
                end if;
            when 3=>
                begin
                put("Podaj PID: ");
                get(pid);
                przestaw_na_poczatek(kolejka,pid);
                exception
                    when nieznany_proces=>
                        put_line("BLAD: nieznany proces.");
                end;
            when others=>put_line("BLAD: nieprawidlowy wybor.");
        end case;
    end loop;
end;
