with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Napisac program wypisujacy wszystkie liczby pierwsze mniejsze od liczby 
--podanej przez uzytkownika (liczba pierwsza to taka liczba naturalna, ktora 
--dzieli sie tylko przez 1 i przez sama siebie).

procedure cw6_4 is
n: integer;
pierwsza: boolean;
begin

put("Podaj n: ");
get(n);

for i1 in 1..n loop
	pierwsza:=true;
	for i2 in 2..i1 loop
		if (i1/=i2 and (i1 mod i2)=0) then
--			put("i1: "); put(i1,width=>0);
--			put(" i2: "); put(i2,width=>0);
--			new_line;
			pierwsza:=false;
		end if;
	end loop;
	if pierwsza then
		put(i1,width=>0);
		new_line;
	end if;
end loop;

end;
