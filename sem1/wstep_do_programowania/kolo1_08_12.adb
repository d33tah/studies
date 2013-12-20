with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--POPRAWIC!

--2. Napisac program tworzacy dynamicznie (po pobraniu od uzytkownika wartosci
-- naturalnej N) tablice N wartosci calkowitych. Program pobiera od 
--uzytkownika wartosci tablicy, a nastepnie wypisuje wszystkie rozne wartosci 
--wystepujace w tablicy.

procedure kolo1_08_12 is
n: integer;
begin

put("Podaj n: ");
get(n);
declare
type t_t1 is array(1..n) of integer;
t1: t_t1;
type t_t2 is array(1..n) of boolean;
t2: t_t2;
begin

for i in 1..n loop
put("Podaj liczbe ");
put(i,width=>0);
put(": ");
get(t1(i));
t2(i):=true;
end loop;

for i1 in 1..n loop
for i2 in i1..n loop
if i1/=i2 and t1(i1)=t1(i2) then
t2(i2):=false;
end if;
end loop;
end loop;

new_line;
put("Oto unikalne liczby z tego ciagu: ");
for i in 1..n loop
if t2(i) then
put (t1(i),width=>0);
new_line;
end if;
end loop;

end;

end; 
