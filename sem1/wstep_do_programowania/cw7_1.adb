with ada.integer_text_io, ada.text_io;
use  ada.integer_text_io, ada.text_io;

--Napisac program, ktory pobiera od uzytkownika 5 liczb calkowitych, a nastepnie
--wypisuje tabelke zawierajaca iloczyny tych liczb. Przykladowo, dla liczb 
--1,2,3,1,2 dostaniemy tabelke
--
--   1  2  3  1  2
--1  1  2  3  1  2
--2  2  4  6  2  4
--3  3  6  9  3  6
--1  1  2  3  1  2
--2  2  4  6  2  4

procedure cw7_1 is
type t_liczby is array(1..5) of integer;
liczby: t_liczby;
begin

for a in t_liczby'range loop
	put("Podaj liczbe ");
	put(a,width=>0);
	put(": ");
	get(liczby(a));
end loop;

--naglowek
set_col(5);
for b in t_liczby'range loop
	put(liczby(b),width=>3);
end loop;
new_line;

for a in t_liczby'range loop
	put(liczby(a),width=>4);
	for b in t_liczby'range loop
		put(liczby(a)*liczby(b),width=>3);
	end loop;
new_line;
end loop;

end;
