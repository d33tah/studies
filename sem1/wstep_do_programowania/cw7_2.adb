with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Napisac program, ktory pobiera od uzytkownika tablice liczb calkowitych o 
--podanej przez uzytkownika dlugosci, a nastepnie wypisuje informacje czy w 
--tablicy jest liczba dodatnia.

procedure cw7_2 is 
dlugosc: integer;
jest_parzysta: boolean;
begin
put("Podaj dlugosc tablicy: ");
get(dlugosc);

declare
	type t_tablica is array(1..dlugosc) of integer;
	tablica: t_tablica;
begin
	for a in tablica'range loop

		put("Podaj liczbe ");
		put(a,width=>0);
		put(":");

		get(tablica(a));

		if tablica(a) mod 2=0 then
			jest_parzysta:=true;
		end if;
	end loop;

	if jest_parzysta then
		put_line("Wsrod podanych liczb jest liczba parzysta");
	else
	put_line("Wsrod podanych liczb nie ma liczby parzystej");
	end if;
end;
end;
