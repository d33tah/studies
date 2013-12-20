with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--2. Napisac program tworzacy dynamicznie (po pobraniu od uzytkownika wartosci
--N bedacej liczba calkowita dodatnia) tablice N wartosci calkowitych. Program
--pobiera od uzytkownika wartosci tablicy, a nastepnie wypisuje te z wartosci 
--tablicy, ktora wystepuje w niej najrzadziej (jesli wiecej niz jedna liczba 
--wystepuje z taka czestoscia, program wypisuje jedna z nich).

procedure kolo1_09_22 is
n: integer;
begin
put("Podaj dlugosc tablicy: ");
get(n);

declare
type t is array(1..n) of integer;
type x is array(1..n) of boolean;
t1: t;
t2: x;
naj_i, naj, tmp: integer:=0;
begin
for i in t'range loop
put("Podaj liczbe na pozycji ");
put(i,width=>0);
put(" ");
get(t1(i));
t2(i):=true;
end loop;

for i1 in t'range loop
	if t2(i1) then
	tmp:=1;
	for i2 in i1+1..t'last loop
		if t2(i2) and t1(i1)=t1(i2) then
			tmp:=tmp+1;
			t2(i2):=false;
		end if;

	end loop;

	--put_line("---DEBUG---");
	--put(t1(i1)); put(tmp); new_line;
	--put_line("---DEBUG---");

	if naj_i=0 then 
		naj_i:=i1; 
		naj:=tmp;
	elsif tmp<naj and tmp/=0 then
		naj:=tmp;
		naj_i:=i1;
	end if;

	end if;
end loop;

new_line;
put("Najrzadziej w ciagu wystepowala liczba ");
put(t1(naj_i),width=>0);
put(", ktora wystepowala ");
put(naj,width=>0);
put(" razy.");

end;
end;
