with ada.text_io;
use ada.text_io;                                         

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

package body zaj11_1_pakiet is

procedure wczytaj(t: out tab) is
begin
    for i in t'range loop
        put("Podaj element numer"&integer'image(i)&": ");
        get(t(i));
    end loop;
end;

procedure wypisz(t: in tab) is
begin
    for i in t'range loop
        put(t(i));
        new_line;
    end loop;
end;

function zawiera_powtorzenia (t: in tab) return boolean is
begin
    for i1 in t'range loop
        for i2 in (i1+1)..t'last loop
            if t(i1)=t(i2) then
                return true;
            end if;
        end loop;
    end loop;
    return false;
end;

function max(t: in tab) return el is
    tmp_max: el := t(t'first);
begin
    for i in t'range loop
        if t(i)>tmp_max then
            tmp_max:=t(i);
        end if;
    end loop;
    return tmp_max;
end;

procedure niemalejaco(t: out tab) is
    max_i2: integer;
    tmp: el;
begin
    for i1 in t'range loop
        max_i2:=i1;
        for i2 in i1+1..t'last loop
            if t(i2)>t(max_i2) then
                max_i2:=i2;
            end if;
        end loop;
        if (i1/=max_i2) then
            tmp:=t(i1);
            t(i1):=t(max_i2);
            t(max_i2):=tmp;
        end if;
    end loop;
end;


end;
