with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Napisac program pobierajacy od uzytkownika pewna liczbe G, a nastepnie 
--wczytujacy liczby calkowite (o zakończeniu podawania decyduje uzytkownik) i 
--wypisujacy wszystkie pary kolejno wczytanych liczb w ktorych suma elementow 
--jest nie mniejsza niz G.

procedure cw6_2 is
g: integer;
n: integer;
begin

put("Podaj liczbe G: ");
get(g);
new_line;

put("Podaj, ile liczb bedziemy rozwazac: ");
get(n);

--mialem problem ze zrozumieniem zadania, mozna to zrobic bez uzycia tablic?

declare
type t_tablica is array(1..n) of integer;
tablica: t_tablica;

begin

for i in tablica'range loop
	put("Podaj liczbe numer ");
	put(i,width=>0);
	put(": ");
	get(tablica(i));
end loop;

for i1 in tablica'range loop
	for i2 in tablica'range loop
		if tablica(i1)+tablica(i2) < g then
			put(tablica(i1),width=>0);
			put(":");
			put(tablica(i2),width=>0);
			new_line;
		end if;
	end loop;
end loop;

end;

end;
