with ada.text_io, ada.integer_text_io, ada.float_text_io;
use  ada.text_io, ada.integer_text_io, ada.float_text_io;

--Zadeklarowac niezawezony typ tablicowy Tab przechowujacy wartosci calkowite. 
--Napisac: 
-- * Procedure Pobierz pobierajaca dane do tablicy typu Tab podanej jako 
--   parametr;
-- * Procedure Wypisz wypisujaca zawartosc tablicy typu Tab podanej jako 
--   parametr;
-- * Funkcje NajwiekszaSrednia zwracajaca wartosc rzeczywista bedaca 
--   najwieksza srednia obliczona dla pary sasiednich elementow tablicy typu 
--   Tab podanej jparametr (przyklad: dla tablicy 1,9,4,3,5,1 funkcja powinna 
--   zwrocic wartosc 6.5 – srednia dla pary 9,4);
-- * Funkcje ScalTabliceNaprzemiennie zwracajaca tablice typu Tab utworzona z
--   dwoch tablic T1, T2 typu Tab podanych jako parametry poprzez wstawienie 
--   do niej kolejno pierwszego elementu tablicy T1, pierwszego elementu 
--   tablicy T2, drugiego elementu tablicy T1, drugiego elementu tablicy T2 
--   itd.; na końcu wstawiana jest nie przepisany do tej pory fragment 
--   dluzszej z tablic wejsciowych.
--
--Napisac program tworzacy dwie tablice typu Tab o dlugosciach podanych przez 
--uzytkownika, pobierajacy i wypisujacy ich zawartosc, a nastepnie wypisujacy 
--informacje o najwiekszych srednich sasiednich elementow dla obu tych tablic 
--(funkcja NajwiekszaSrednia), oraz wypisujacy tablice powstala ze scalenia 
--obu tablic (funkcja ScalTabliceNaprzemiennie).

procedure kolo3 is
type tab is array(positive range <>) of integer;
procedure pobierz(t1: out tab) is
begin
for i in t1'range loop
put("Podaj liczbe ");
put(i,0);
put(": ");
get(t1(i));
end loop;
end;


procedure wypisz(t1: tab) is
begin
for i in t1'range loop
put(t1(i));
new_line;
end loop;
end;

function najwiekszasrednia(t1: tab) return float is
max_srednia: float;
pierwsza: positive;
begin
if t1'first=t1'last then
return float(t1(t1'first));
else
pierwsza:=t1'first;
max_srednia:=float(t1(t1'first)+t1(t1'first+1))/2.0;
for i in (t1'first+1)..t1'last loop
if float(t1(i)+t1(i-1))/2.0>max_srednia then
pierwsza:=i-1;
max_srednia:=float(t1(i)+t1(i-1))/2.0;
end if;
end loop;
return max_srednia;
end if;
end;

--TOFIX: zalozylem, ze 1 element jest numerowany jako 1
function scalnaprzemiennie(t1, t2: tab) return tab is
t3: tab(1..positive'max(t1'length,t2'length));
pierwsza: boolean:=true;
begin
for i in 1..positive'max(t1'length,t2'length) loop
if i>t1'last and i>t2'last then
exit;
elsif i>t1'last then
t3(i):=t2(i);
elsif i>t2'last then
t3(i):=t1(i);
else
if pierwsza then
t3(i):=t1(i);
else
t3(i):=t2(i);
end if;
pierwsza:=not pierwsza;
end if;
end loop;
return t3;
end;

n1: positive;
n2: positive;
begin
put("Podaj dlugosc pierwszej tablicy: ");
get(n1);
put("Podaj dlugosc drugiej tablicy: ");
get(n2);
declare
t1: tab(1..n1);
t2: tab(1..n2);
begin
pobierz(t1);
put("Srednia mi wyszla: ");
put(najwiekszasrednia(t1),0,2,0);
put_line(".");
pobierz(t2);
put("Srednia mi wyszla: ");
put(najwiekszasrednia(t2),0,2,0);
put_line(".");
put_line("A oto scalona naprzemiennie tablica: ");
wypisz(scalnaprzemiennie(t1,t2));

end;
end;
