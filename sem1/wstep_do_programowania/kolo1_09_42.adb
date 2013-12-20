with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--2. Napisac program tworzacy dynamicznie (po pobraniu od uzytkownika wartosci
--N bedacej liczba calkowita dodatnia) tablice N wartosci calkowitych. Program
--pobiera od uzytkownika wartosci tablicy, a nastepnie wypisuje wszystkie te 
--uporzadkowane pary elementow tablicy stojacych na roznych pozycjach, ktorych
--srednia jest wieksza od podanej wczesniej liczby rzeczywistej G.

procedure kolo1_09_42 is
n,g: integer;
begin
put("Podaj G: ");
get(g);
put("Podaj dlugosc tablicy: ");
get(n);
if n not in positive then
put_line("Nie podano liczby dodatniej.");
else
declare
type t is array(1..n) of integer;
t1: t;
begin
for i in t'range loop
put("Podaj liczbe ");
put(i,width=>0);
put(": ");
get(t1(i));
end loop;

put("Oto wszystkie pary liczb wieksze od G="); put(g,width=>0); put_line(":");
for i1 in t'range loop
	for i2 in i1+1..t'last loop
		if t1(i1)+t1(i2) > g then
			put(t1(i1),width=>0); put(":"); put(t1(i2),width=>0);
			new_line;
		end if;
	end loop;
end loop;

end;
end if;
end;
