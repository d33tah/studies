with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Napisac program pobierajacy od uzytkownika calkowita dodatnia liczbe G, a 
--nastepnie mowiacy ile kolejnych liczb calkowitych dodatnich nalezy dodac,
--aby otrzymac najmniejsza liczbe nie mniejsza niz G.

procedure cw5_4 is
g: integer;
i,suma: integer:=0;
begin
put("Podaj G: "); get(g);

loop 	--unikajac algebry nie znamy z gory liczby iteracji,
	-- wiec chyba lepiej while

	i := i + 1;
	suma := suma + i;

	if suma >= g then
		put("Szukana liczba to ");
		put(i,width=>0);
		new_line;
		exit;
	end if;
end loop;

end;
