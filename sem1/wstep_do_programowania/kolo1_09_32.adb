with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--2. Napisac program tworzacy dynamicznie (po pobraniu od uzytkownika wartosci
--N bedacej liczba calkowita dodatnia) tablice N wartosci calkowitych. Program
--pobiera od uzytkownika wartosci tablicy, a nastepnie wypisuje pozycje 
--(indeksy) pary sasiadujacych elementow tej tablicy o najwiekszym 
--iloczynie (jesli wystepuje kilka takich par, .program wypisuje
--pozycje jednej z nich).


procedure kolo1_09_31 is
n: integer; 
begin

put("Podaj dlugosc tablicy: ");
get(n);
if n not in positive then
put_line("Podana liczba nie jest liczba dodatnia.");
else
declare
type t is array(1..n) of integer;
t1: t;
i_naj, naj, tmp: integer;
begin
for i in t'range loop
put("Podaj liczbe ");
put(i,width=>0);
put(": ");
get(t1(i));
if i/=1 and i/=2 then 
tmp:=t1(i)*t1(i-1);
if tmp>naj then
naj:=tmp;
i_naj:=i;
end if;
elsif i=2 then
i_naj:=2; naj:=t1(i)*t1(i-1);
end if;

end loop;

put("Najwiekszy iloczyn uzyska sie poprzez przemnozenie liczb o indeksach ");
put(i_naj-1,width=>0); put(" i "); put(i_naj,width=>0); put("."); new_line;

put("Wynik mnozenia to "); put(naj,width=>0); put_line(".");

end;
end if;

end;
