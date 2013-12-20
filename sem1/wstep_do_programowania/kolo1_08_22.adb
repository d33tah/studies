with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--2. Napisac program tworzacy dynamicznie (po pobraniu od uzytkownika wartosci
--naturalnej N) tablice N wartosci calkowitych. Program pobiera od uzytkownika
--wartosci tablicy oraz dwie liczby naturalne L i P (numery miejsc 
--wyznaczajace pewien fragment tej tablicy), wypisuje zawartosc tej tablicy, 
--a nastepnie modyfikuje zawartosc tablicy, zastepujac w wyznaczonym przez 
--L i P fragmencie najmniejsza wartosc z tego fragmentu – najwieksza wartoscia
--spoza tego fragmentu. Po zakończeniu modyfikacji program wypisuje ponownie 
--zawartosc tablicy.

procedure kolo1_08_22 is
n: integer;
begin
put("Podaj dlugosc tablicy: ");
get(n);

declare
type t is array (1..n) of integer;
t1: t;
l,p, najmniejsza, najwieksza, tymcz:integer:=0;
najwieksza_i, najmniejsza_i:integer :=0;
begin

for i in t'range loop
put("Podaj liczbe na pozycji ");
put(i,width=>0);
put(": ");
get(t1(i));
end loop;

put("Podaj L: ");
get(l);
put("Podaj P: ");
get(p);

if p<l then
tymcz:=p;
p:=l;
l:=tymcz;
end if;

najwieksza:=t1(l);
najwieksza_i:=l;
for i in l..p loop
if t1(i)>najwieksza then
najwieksza:=t1(i);
najwieksza_i:=i;
end if;
end loop;
put("Najwieksza znaleziona w przedziale liczba to: ");
put(najwieksza,width=>0);
put_line(".");

najmniejsza:=t1(l);
najmniejsza_i:=l;
for i in l..p loop
if t1(i)<najmniejsza then
put_line("Zmienilem!");
najmniejsza:=t1(i);
najmniejsza_i:=i;
end if;
end loop;
put("Najmniejsza znaleziona w przedziale liczba to: ");
put(najmniejsza,width=>0);
put_line(".");

t1(najmniejsza_i):=najwieksza;
t1(najwieksza_i):=najmniejsza;

new_line;
put_line("A oto zawartosc tablicy ""po przejsciach"": ");
for i in t1'range loop
put(t1(i),width=>0);
new_line;
end loop;

end;
end;
