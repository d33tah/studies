with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Napisac program pobierajacy tablice liczb calkowitych o podanej przez 
--uzytkownika dlugosci, a nastepnie wypisujacy liczbe wystapień 
--poszczegolnych elementow tej tablicy.

procedure cw8_2 is
n: integer; --dlugosc tablicy
tmp: integer; --ilosc konkretnego elementu
begin

put("Podaj dlugosc tablicy: ");
get(n);

declare
type t_tablica1 is array(1..n) of integer;
type t_tablica2 is array(1..n) of boolean;
tablica1: t_tablica1;
tablica2: t_tablica2;
begin

for a in tablica1'range loop
	put("Podaj liczbe ");
	put(a,width=>0);
	put(": ");
	get(tablica1(a));
	tablica2(a):=true;
end loop;

--mniej hardkorowych pomyslow nie mialem
for a in tablica1'range loop
	if tablica2(a) then --jezeli liczba nie oznaczona jako duplikat
		tmp:=1; --zeruj licznik liczby
		for b in tablica1'range loop
			--jezeli nie jest to ta sama liczba i sa identyczne
			if a/=b and tablica1(a)=tablica1(b) then
				tmp:=tmp+1; --zwieksz licznik liczby
				tablica2(b):=false; --oznacz jako duplikat
			end if;
		end loop;
	put("Liczba ");
	put(tablica1(a),width=>0);
	put(": ");
	put(tmp,width=>0);
	new_line;
	end if;
end loop;

end;

end;
