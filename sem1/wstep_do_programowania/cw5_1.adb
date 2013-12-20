with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Napisz program pobierajacy od uzytkownika dwie liczby calkowite stanowiace 
--krance pewnego przedzialu domknietego, a nastepnie wypisujacy ilosc i sume 
--liczb podzielnych przez 3 nalezacych do tego przedzialu, a takze wszystkie 
--te liczby w kolejnosci malejacej.

procedure cw5_1 is
a, b: integer;
ilosc, suma: integer := 0;
begin

put("Podaj pierwsza liczbe: "); get(a);
put("Podaj druga liczbe: "); get(b);
new_line;

if a>b or a=b then
put_line("BLAD: liczba pierwsza musi byc mniejsza od drugiej.");
else

--Pyt: czy mozna to bylo upchnac w jednej petli nie definiujac zmiennej string
--     przy zachowaniu dotychczasowo przedstawionej skladni?

	for i in a..b loop
		if i mod 3 =0 then
			suma  := suma+i;
			ilosc := ilosc+1;
		end if;
	end loop;

	put("Suma elementow: ");  put(suma,width=>0);  new_line;
	put("Ilosc elementow: "); put(ilosc,width=>0); new_line;
	new_line; --IMHO tak jest czytelniej

	for i in reverse a..b loop
		if i mod 3 =0 then
			put(i,width=>0);
			new_line;
		end if;
	end loop;

end if;

end;
