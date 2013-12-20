with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Zadeklarowac niezawezony typ tablicowy T przechowujacy wartosci calkowite. 
--Napisac:
-- * Procedure Pobierz pobierajaca dane do tablicy typu T podanej jako 
--   parametr;
-- * Procedure Wypisz wypisujaca zawartosc tablicy typu T podanej jako 
--   parametr;
-- * Procedure Zamien modyfikujaca zawartosc tablicy typu T podanej jako 
--   parametr poprzez zamiane miejscami N poczatkowych i N koncowych elementow
--   tak, ze element pierwszy jest zamieniany z ostatnim, drugi z 
--   przedostatnim itd. Liczba N jest parametrem wejsciowym procedury;
-- * Funkcje Skroc zwracajaca tablice typu T powstala z tablicy typu T podanej
--   jako parametr poprzez usuniecie koncowego fragmentu zlozonego z liczb 
--   mniejszych od liczby G podanej jako parametr (przyklad: dla G = 5 i 
--   tablicy 1,5,6,4,3,2,7,6,2,1,2,4 wynikiem jest tablica 1,5,6,4,3,2,7,6).
--
--Napisac program tworzacy tablice typu T o dlugosci podanej przez 
--uzytkownika, pobierajacy i wypisujacy jej zawartosc, a nastepnie, po 
--pobraniu od uzytkownika liczby calkowitej K zamieniajacy miejscami K 
--elementow tej tablicy (procedura Zamien), oraz wypisujacy tablice skrocona 
--o koncowy fragment zlozony z liczb mniejszych od K (funkcja Skroc).

procedure kolo4 is
type t is array(positive range <>) of integer;

procedure pobierz(t1: out t) is
begin
for i in t1'range loop
put("Podaj element ");
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

--FIXME: zalozenie, ze tablica zaczyna sie od 1..n
procedure zamien(t1:out t ; n: positive) is
tmp: integer;
begin
for i in 1..n loop
tmp:=t1(t1'first+i-1);
t1(t1'first+i-1):=t1(t1'last-i+1);
t1(t1'last-i+1):=tmp;
end loop;
end;

function skroc(t1: t ; g: integer) return t is
n: integer:=0;
begin
for i in reverse t1'range loop
if t1(i)<g then
n:=n+1;
else
exit;
end if;
end loop; 
declare
ret: t(1..(t1'last-n));
begin
for i in ret'range loop
ret(i):=t1(i);
end loop;
return ret;
end;
end;

n: positive;
begin
put("Podaj dlugosc tablicy: ");
get(n);
declare
t1: t(1..n);
g: integer;
begin
pobierz(t1);
put("Podaj N: ");
get(g);
put_line("Po wykonaniu zamien():");
zamien(t1,g);
wypisz(t1);
put("Podaj G: ");
get(g);
put_line("Po wykonaniu skroc():");
wypisz(skroc(t1,g));
end;
end;
