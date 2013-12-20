with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Zadeklarowac niezawezony typ tablicowy T przechowujacy wartosci calkowite 
--nieujemne. 
--Napisac:
-- * Procedure Pobierz pobierajaca dane do tablicy typu T podanej jako 
--   parametr;
-- * Procedure Wypisz wypisujaca zawartosc tablicy typu T podanej jako 
--   parametr;
-- * Funkcje TablicaPodzielnych zwracajaca tablice typu T powstala z tablicy 
--   typu T podanej jako parametr poprzez przekopiowanie elementow tablicy 
--   wejsciowej podzielnych przez liczbe calkowita N podana jako drugi 
--   parametr;
-- * Funkcje CzyZnaczacaSymetryczna zwracajaca wartosc logiczna mowiaca, czy
--   tablica powstala przez usuniecie koncowych i poczatkowych zer jest 
--   symetryczna (przyklad: dla tablicy 1,2,3,2,1, tablicy 0,0,0,2,4,4,2,0, 
--   tablicy 0,0,2,0,2 i tablicy 2,2,3,2,2,0,0 funkcja powinna zwrocic 
--   prawde).
--
--Napisac program tworzacy tablice typu T o dlugosci podanej przez 
--uzytkownika, pobierajacy i wypisujacy jej zawartosc, a nastepnie, po 
--pobraniu od uzytkownika liczby calkowitej K wypisujacy tablice liczb 
--podzielnych przez K (funkcja TablicaPodzielnych), oraz wypisujacy 
--informacje, czy podana przez uzytkownika tablica jest w swojej 
--„znaczacej” czesci symetryczna (funkcja CzyZnaczacaSymetryczna).

procedure kolo5 is
subtype nieujemne is integer range 0..integer'last;
type t is array(positive range <>) of nieujemne;

procedure pobierz(t1: out t) is
begin
for i in t1'range loop
put("Podaj element numer ");
put(i,0);
put(": ");
get(t1(i));
end loop;
end; 

procedure wypisz(t1: t) is
begin
for i in t1'range loop
put(t1(i),0);
new_line;
end loop;
end;

function tablicapodzielnych(t1: t; n: positive) return t is
liczba: integer:=0;
begin
for i in t1'range loop
if t1(i)/=0 and t1(i) mod n=0 then
liczba:=liczba+1;
end if;
end loop;
if liczba>0 then
declare
ret: t(1..liczba);
begin
liczba:=1;
for i in t1'range loop
if t1(i)/=0 and t1(i) mod n=0 then
ret(liczba):=t1(i);
liczba:=liczba+1;
end if;
end loop;
return ret;
end;
end if;
end;

function czyznaczacasymetryczna(t1: t) return boolean is
pocz: integer:=t1'first;
koniec: integer:=t1'last;
begin

for i in t1'range loop
if t1(i)=0 then 
pocz:=pocz+1;
else
exit;
end if;
end loop;

for i in reverse t1'range loop
if t1(i)=0 and i/=pocz then
koniec:=koniec-1;
else
exit;
end if;
end loop;


for i in 1..koniec-pocz+1 loop
if t1(pocz+i-1)/=t1(koniec-i+1) then
return false;
end if;
end loop;
return true;
end;

n: positive;
g: positive;
begin
put("Podaj dlugosc tablicy: ");
get(n);
put("Podaj N: ");
get(g);
declare
t1: t(1..n);
begin
pobierz(t1);
wypisz(tablicapodzielnych(t1,g));
if czyznaczacasymetryczna(t1) then
put_line("No, prawda.");
else
put_line("Falsz!");
end if;
end;
end;
