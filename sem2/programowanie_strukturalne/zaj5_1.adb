with ada.text_io, ada.integer_text_io, zaj5_1_pakiet;
use  ada.text_io, ada.integer_text_io, zaj5_1_pakiet;

--Napisać pakiet implementujący stos liczb całkowitych przy pomocy wskaźników, 
--udostępniający:
--
-- * typ rekordowy stos, przechowujący wskaźnik początku stosu (ograniczony 
--   typ prywatny)
-- * procedurę wypisującą stos podany jako parametr
-- * procedurę wkładając na stos podany jako parametr element podany jako 
--   parametr
-- * procedurę zdejmującą element ze stosu podanego jako parametr. Liczba 
--   zdjęta ze stosu ma zostać przekazana do programu, pamięć zajmowana przez
--   usuwany element ma zostać zwolniona. W przypadku braku elementu do 
--   zdjęcia procedura ma zgłaszać wyjątek stos_pusty
-- * funkcję zwracającą rozmiar (ilość elementów) stosu podanego jako 
--   parametr,
-- * procedurę czyszczącą stos podany jako parametr. Pamięć zajmowana przez 
--   stos ma zostać zwolniona,
-- * procedurę zwracającą kopię stosu podanego jako parametr
-- * funkcję "=" zwracającą wartość logiczną mówiącą, czy dwa stosy podane 
--   jako parametry są takie same
--
--oraz program testujący działanie tego pakietu

pragma warnings(off);

procedure zaj5_1 is

    pierwszy: stos_ptr;
    drugi: stos_ptr;
    liczba: integer;
    wybor: integer;
    tmp1: stos_ptr_struct;
    tmp2: stos_ptr_struct;
begin
    loop
        put_line("1: Poloz liczbe na stosie pierwszym");
        put_line("2: Zdejmij liczbe ze stosu pierwszego");
        put_line("3: Wypisz stos pierwszy");
        put_line("4: Podaj rozmiar stosu pierwszego");
        put_line("5: Wyczysc stos");
        put_line("6: Skopiuj stos pierwszy do drugiego");
        put_line("7: Wypisz stos drugi");
        put_line("8: Porownaj dwa stosy");
        put_line("9: Poloz liczbe na stosie drugim");
        put_line("0: Wyjscie");
        put("Twoj wybor: ");
        get(wybor);
        case wybor is
            when 1=>
                put("Podaj liczbe: "); 
                get(liczba); 
                poloz(pierwszy,liczba);
            when 2=>
                begin
                    zdejmij(pierwszy,liczba);
                    put("Zdjeto ze stosu liczbe: ");
                    put(liczba,0);
                    put_line(".");
                exception
                    when stos_pusty=>
                        put_line("BLAD: stos jest pusty.");
                end;
            when 3=>
                wypisz(pierwszy);
            when 4=>
                put("Stos pierwszy ma rozmiar: ");
                put(rozmiar(pierwszy),0);
                put_line(".");
            when 5=>
                wyczysc(pierwszy);
            when 6=>
                drugi:=skopiuj(pierwszy);
            when 7=>
                wypisz(drugi);
            when 8=>
                tmp1.ptr:=pierwszy;
                tmp2.ptr:=drugi;
                if(tmp1=tmp2) then
                    put_line("Sa takie same.");
                else
                    put_line("Nie sa takie same.");
                end if;
            when 9=>
                put("Podaj liczbe: "); 
                get(liczba); 
                poloz(drugi,liczba);
            when 0=>
                exit;
            when others=>put_line("BLAD: nieprawidlowy wybor.");
        end case;
    end loop;
end;
