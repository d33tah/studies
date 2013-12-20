with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--2. Napisac program tworzacy dynamicznie (po pobraniu od uzytkownika wartosci
--N bedacej liczba calkowita dodatnia) tablice N wartosci calkowitych 
--dodatnich. Program pobiera od uzytkownika wartosci tablicy, a nastepnie 
--wypisuje informacje, czy tablica zawiera taka pare sasiadujacych elementow,
--w ktorej pierwszy element jest podzielny przez drugi.

procedure kolo1_09_62 is
n: positive;
begin
put("Podaj dlugosc tablicy: ");
get(n);

declare
type t is array(1..n) of integer;
t1: t;
zawiera: boolean:=false;
begin
for i in t'range loop
put("Podaj liczbe ");
put(i,width=>0);
put(": ");
get(t1(i));
if (i>1) then
if (t1(i) mod t1(i-1))=0 and t1(i)/=0 and t1(i-1)/=0 then
zawiera:=true;
--else put(t1(i-1) mod t1(i)); new_line;
end if;
end if;
end loop;

if zawiera then
put("Podana tablica zawiera pare sasiadujacych liczb ");
put_line("podzielnych przez siebie.");
else
put("Podana tablica nie zawiera pary sasiadujacych liczb ");
put_line("podzielnych przez siebie.");
end if;
end;


end;
