with ada.integer_text_io, ada.text_io;
use  ada.integer_text_io, ada.text_io;

--Napisac program pobierajacy od uzytkownika liczby calkowite w taki sposob, 
--ze wprowadzenie zera zakańcza podawanie, a nastepnie wypisujacy sume 
--wprowadzonych liczb, ich ilosc i srednia oraz najwieksza i najmniejsza 
--wprowadzona liczbe (wyniki maja nie uwzgledniac końcowego zera).

procedure cw6_1 is
biezaca, ilosc, razem, max, min: integer := 0;
begin

loop
	put("Podaj liczbe (zero przerywa dzialanie): ");
	get(biezaca);

	if biezaca=0 then
	exit;
	end if;

	ilosc:= ilosc+1;
	razem:=razem+biezaca;

	if biezaca>max then
	max:=biezaca;
	end if;

	if biezaca<min or min=0 then
	min:=biezaca;
	end if;

end loop;


put("Razem podales: ");
put(razem,width=>0);
new_line;

put("Minimum: ");
put(min,width=>0);
new_line;

put("Maksimum: ");
put(max,width=>0);
new_line;

put("Srednia: ");
put(razem/ilosc,width=>0);
new_line;

end;
