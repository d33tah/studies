with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--1. Napisac program pobierajacy od uzytkownika wartosci calkowite az do 
--podania wartosci 0 kończacej pobieranie i wypisujacy trojki kolejno 
--podanych wartosci, ktorych srednia jest wieksza od pobranej wczesniej liczby
-- rzeczywistej G, oraz wypisujacy ile bylo takich par (końcowe zero nie jest 
--brane pod uwage).


procedure kolo1_09_61 is
g,a,b,c,tmp,licznik:integer:=0;
	procedure wyswietl(a,b,c: integer) is
	begin
	put(a,width=>0);
	put(", ");
	put(b,width=>0);
	put(", ");
	put(c,width=>0);
	new_line;
	end;
begin
put("Podaj G: ");
get(g);
while true loop
licznik:=licznik+1;
put("Podaj liczbe: ");
get(tmp);
exit when tmp=0;

c:=b;
b:=a;
a:=tmp;

if licznik>2 and (((a+b+c)/3)>g) then
wyswietl(a,b,c);
--licznik:=0; --ta linijka zmienia algorytm
end if;

end loop;
end; 
