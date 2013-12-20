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

generic
    type el is private;
    with procedure get(e: out el);
    with procedure put(e: el);
    with function ">" (e1: el; e2: el) return boolean;
package zaj11_1_pakiet is
    type tab is array(integer range <>) of el;
    procedure wczytaj(t: out tab);
    procedure wypisz(t: in tab);
    function zawiera_powtorzenia (t: in tab) return boolean;
    function max(t: in tab) return el;
    procedure niemalejaco(t: out tab);
end;
