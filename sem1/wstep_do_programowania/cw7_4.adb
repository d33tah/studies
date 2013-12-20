with ada.text_io, ada.float_text_io, ada.integer_text_io;
use  ada.text_io, ada.float_text_io, ada.integer_text_io;

--Napisac program, ktory wczytuje tablice wartosci rzeczywistych o dlugosci 
--podanej przez uzytkownika, a nastepnie wypisuje informacje:
-- * czy te liczby sa uporzadkowane rosnaco lub malejaco,
-- * czy tablica jest symetryczna (pierwszy element rowny ostatniemu, drugi przedostatniemu itd),
-- * czy w tablicy wystepuje przynajmniej jedno powtorzenie wartosci.

procedure cw7_4 is
dlugosc: integer;
powtorzenie: boolean:=false;
rosnace: boolean:=false;
malejace: boolean:=true;
symetryczna: boolean:=true;
begin

put("Podaj dlugosc tablicy: ");
get(dlugosc);

declare
type t_tablica is array(1..dlugosc) of float;
tablica: t_tablica;
begin

for a in tablica'range loop
	put("Podaj liczbe ");
	put(a,width=>0);
	put(": ");

	get(tablica(a));

	if a/=1 and dlugosc/=1 then
		if rosnace and not (tablica(a)>tablica(a-1)) then
			rosnace:=false;
		end if;

		if malejace and not (tablica(a)<tablica(a-1)) then
			malejace:=false;
		end if;

	        for b in tablica'first..a-1 loop
        	        if tablica(b)=tablica(a) then
	                        powtorzenie:=true;
	                end if;
	        end loop;

	end if;

end loop;

if rosnace then
	put_line("Tablica jest rosnaca.");
else
	if malejace then
		put_line("Tablica jest malejaca.");
	end if;
end if;

if dlugosc mod 2=0 then
	for a in 1..dlugosc/2 loop
		if tablica(a)/=tablica(dlugosc-a) then
			symetryczna:=false;
		end if;
	end loop;
else
	for a in 1..(dlugosc-1)/2 loop
		if tablica(a)/=tablica(dlugosc-a) then
			symetryczna:=false;
		end if;
	end loop;
end if;

if symetryczna then
	put_line("Tablica jest symetryczna.");
end if;

if powtorzenie then
	put_line("W tablicy jest przynajmniej jedno powtorzenie.");
end if;

end;
end;
