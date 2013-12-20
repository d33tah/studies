with ada.text_io, ada.integer_text_io, ada.unchecked_deallocation;
use  ada.text_io, ada.integer_text_io;

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

package body zaj5_1_pakiet is

    procedure free is new ada.unchecked_deallocation(stos, stos_ptr);

    procedure poloz(v_stos: out stos_ptr; liczba: in integer) is
        tmp: stos_ptr;
    begin
        tmp:=new stos;
        tmp.liczba:=liczba;
        if v_stos=null then
            v_stos:=tmp;
            return;
        end if;

        tmp.poprz:=v_stos;
        v_stos:=tmp;
        return;
    end;

    procedure zdejmij(v_stos: out stos_ptr; liczba: out integer) is
        tmp: stos_ptr;
    begin
        if v_stos=null then
            raise stos_pusty;            
        end if;

        tmp:=v_stos;
        liczba:=v_stos.liczba;
        v_stos:=v_stos.poprz;
        free(tmp);
        return;
    end;

    procedure wypisz(v_stos: in stos_ptr) is
        tmp: stos_ptr:=v_stos;
    begin
        loop
            exit when tmp=null;
            put(tmp.liczba,0);
            new_line;
            tmp:=tmp.poprz;
        end loop;
    end;

    function rozmiar(v_stos: stos_ptr) return integer is
        ret: integer:=0;
        tmp: stos_ptr:=v_stos;
    begin
        loop
            exit when tmp=null;
            ret:=ret+1;
            tmp:=tmp.poprz;
        end loop;
        return ret;
    end;

    procedure wyczysc(v_stos: out stos_ptr) is
        tmp: integer;
    begin
        loop
            exit when v_stos=null;
            zdejmij(v_stos,tmp);
        end loop;
    end;

    function skopiuj(v_stos: stos_ptr) return stos_ptr is
        v_rozmiar: integer:=rozmiar(v_stos);
        tmp: stos_ptr;
        ret: stos_ptr;
    begin
        for i1 in  1..v_rozmiar loop
            tmp:=v_stos;
            for i2 in reverse (i1+1)..v_rozmiar loop
                tmp:=tmp.poprz;
            end loop;
            poloz(ret,tmp.liczba);
        end loop;
        return ret;
    end;

    function "="(v1_stos: stos_ptr_struct; v2_stos: stos_ptr_struct) return boolean is
        tmp1: stos_ptr:=v1_stos.ptr;
        tmp2: stos_ptr:=v2_stos.ptr;
    begin

        if(rozmiar(tmp1)/=rozmiar(tmp2)) then
            put_line("Tutaj.");
            return false;
        end if;

        if(rozmiar(tmp1)=0 and rozmiar(tmp2)=0) then
            return true;
        end if;

        loop
            exit when tmp1=null;
            if (tmp1.liczba/=tmp2.liczba) then
                return false;
            end if;

            tmp1:=tmp1.poprz;
            tmp2:=tmp2.poprz;
        end loop;
        return true;

    end;

end;
