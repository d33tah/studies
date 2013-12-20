with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--2. Napisac program tworzacy dynamicznie (po pobraniu od uzytkownika wartosci
--N bedacej liczba calkowita dodatnia) dwie tablice N wartosci calkowitych. 
--Program pobiera od uzytkownika wartosci tablic, wypisuje ich zawartosc, a 
--nastepnie zamienia miejscami elementy tych tablic stojace na tych samych 
--pozycjach tak, aby element w pierwszej tablicy byl nie wiekszy niz element w
--drugiej. Po zakonczeniu zamiany program wypisuje zawartosc obu tablic.

procedure kolo1_09_52 is
n: positive;
begin
put("Podaj dlugosc tablicy: ");
get(n);
declare
type t is array(1..n) of integer;
t1, t2: t;
tmp: integer;
begin
put_line("Pobiore pierwsza tablice.");
for i in t'range loop
put("Podaj liczbe na pozycji ");
put(i);
put(": ");
get(t1(i));
end loop;

new_line;

put_line("Teraz bede pobieral druga tablice.");
for i in t'range loop
put("Podaj liczbe na pozycji ");
put(i);
put(": ");
get(t2(i));
end loop;

new_line;

put_line("Oto zawartosci obu tablic: ");
for i in t'range loop
put(t1(i),width=>0);
put(" => ");
put(t2(i),width=>0);
new_line;
end loop;


for i in t'range loop
if t2(i)>t1(i) then
put_line("Zamieniam...");
tmp:=t2(i);
t2(i):=t1(i);
t1(i):=tmp;
end if;
end loop;

new_line;

put_line("Oto zawartosci obu tablic po zamianie: ");
for i in t'range loop
put(t1(i),width=>0);
put(" => ");
put(t2(i),width=>0);
new_line;
end loop;

end;
end;
