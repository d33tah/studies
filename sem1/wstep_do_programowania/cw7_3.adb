with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--1=>2
--2=>3
--3=>1

--Napisac program, ktory pobiera liczby do tablicy o dlugosci podanej przez 
--uzytkownika, a nastepnie dokonuje przesuniecia zawartosci tej tablicy 
--cyklicznie o jedna pozycje (pierwszy element na miejsce drugiego, drugi na 
--miejsce trzeciego, ..., ostatni na miejsce pierwszego)

procedure cw7_3 is
dlugosc: integer;
begin
put("Podaj dlugosc tablicy: ");
get(dlugosc);

declare
type t_tablica is array(1..dlugosc) of integer;
tablica,tablica2: t_tablica;
begin

for a in tablica'range loop
	put("Podaj liczbe ");
	put(a,width=>0);
	put(": ");
	
	get(tablica(a));
end loop;

for a in tablica'range loop
	if a/=tablica'first then
		tablica2(a-1):=tablica(a);
	else
		tablica2(tablica'last):=tablica(tablica'first);
	end if;
end loop;

new_line;
for a in 1..dlugosc loop
        put(tablica2(a));
end loop;

end;
end;
