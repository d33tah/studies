with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Napisac program, ktory pobierze kwadratowa tablice liczb calkowitych i 
--wypisze jej kolejne kolumny jako wiersze. 
--
--Przyklad: dla tablicy
--1 2 3
--4 5 6
--7 8 9
--program powinien wypisac tablice:
--1 4 7
--2 5 8
--3 6 9


procedure cw9_1 is
m: integer;
begin
put("Podaj wielkosc macierzy: ");
get(m);

declare
type t1 is array(1..m, 1..m) of integer;
t: t1;
begin
for i1 in t'range(1) loop
	for i2 in t'range(2) loop
		put("Podaj element na pozycji (");
		put(i1,width=>0);
		put(":");
		put(i2,width=>0);
		put(") => ");
		get(t(i1,i2));
	end loop;
end loop;

for i2 in t'range(2) loop
	for i1 in t'range(1) loop
		put(t(i1,i2),width=>3);
	end loop;
	new_line;
end loop;

end; --declare

end cw9_1;
