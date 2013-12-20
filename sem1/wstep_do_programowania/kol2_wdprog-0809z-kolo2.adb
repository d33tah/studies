with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Zadeklarowac niezawezony typ tablicowy T przechowujacy wartosci calkowite. 
--Napisac:
-- * Procedure Pobierz pobierajaca dane do tablicy typu T podanej jako 
--   parametr;
-- * Procedure Wypisz wypisujaca zawartosc tablicy typu T podanej jako 
--   parametr;
-- * Funkcje CzyNierosnaco zwracajaca wartosc logiczna mowiaca, czy zawartosc
--   tablicy typu T bedacej parametrem jest uporzadkowana nierosnaco 
--   (przyklad: dla tablic 5,3,2,2,0, 5,3,2,1,0 i 2,2,2 odpowiedz powinna byc 
--   true, dla tablic 1,2,3,3,4 i 4,5,2,1,5 – false);
-- * Funkcje TworzPosortowana zwracajaca tablice typu T powstala z tablicy 
--   typu T podanej jako parametr poprzez uporzadkowanie jej zawartosci 
--   nierosnaco (sortowanie tablicy o dlugosci N mozna wykonac nastepujaca 
--   metoda: wsrod elementow stojacych na miejscach 1..N znalezc element 
--   najwiekszy i zamienic go miejscem z elementem pierwszym, nastepnie wsrod 
--   elementow stojacych na miejscach 2..N znalezc element najwiekszy i 
--   zamienic go miejscem z elementem drugim itd. – az do ostatniego kroku
--   zamiany, tj. znalezienia najwiekszego elementu wsrod stojacych na 
--   pozycjach N-1..N i zamienienia go miejscem z elementem stojacym na 
--   miejscu N-1. 
--
--Napisac program tworzacy tablice typu T o dlugosci podanej przez 
--uzytkownika, pobierajacy i wypisujacy jej zawartosc, a nastepnie wypisujacy 
--informacje czy tablica jest uporzadkowana nierosnaco (funkcja 
--CzyNierosnaco), oraz wypisujacy tablice posortowana (funkcja 
--TworzPosortowana).

procedure kolo2 is
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

function czynierosnaco(t1: t) return boolean is
begin
for i in t1'first+1..t1'last loop
if (t1(i)>t1(i-1)) then
return false;
end if;
end loop;
return true;
end;

function tworzposortowana(t1: t) return t is
ret:t:=t1;
tmp:integer:=0;
tmp_max:integer;
tmp_max_pos:integer;
begin

for i in ret'range loop

tmp_max:=ret(i);
tmp_max_pos:=i;
for i2 in i..ret'last loop
if ret(i2)>tmp_max then
tmp_max:=ret(i2);
tmp_max_pos:=i2;
end if;
end loop;
tmp:=ret(i);
ret(i):=ret(tmp_max_pos);
ret(tmp_max_pos):=tmp;

end loop;

return ret;
end;


n: positive;

debug: boolean:=false;
t2: t(1..5):=(5,3,2,2,0);
t3: t(1..5):=(5,3,2,1,0);
t4: t(1..3):=(2,2,2);
t5: t(1..5):=(1,2,3,3,4);
t6: t(1..5):=(4,5,2,1,5);

begin

if debug then
if czynierosnaco(t2) then put_line("Dobrze1."); else put_line("Zle1"); end if;
if czynierosnaco(t3) then put_line("Dobrze2."); else put_line("Zle2"); end if;
if czynierosnaco(t4) then put_line("Dobrze3."); else put_line("Zle3"); end if;
if not czynierosnaco(t5) then put_line("Dobrze4."); else put_line("Zle4"); end if;
if not czynierosnaco(t6) then put_line("Dobrze5."); else put_line("Zle5"); end if;
end if;

put("Podaj dlugosc tablicy: ");
get(n);
declare
t1: t(1..n);
begin

pobierz(t1);

if czynierosnaco(t1) then
put_line("Jest nierosnaco.");
else
put_line("Nie jest nierosnaco.");
end if;

wypisz(tworzposortowana(t1));
end;
end;
