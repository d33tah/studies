with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--1. Napisac program pobierajacy od uzytkownika wartosci calkowite az do 
--podania wartosci 0 kończacej pobieranie i wypisujacy wszystkie trojki 
--kolejno podanych wartosci tak, aby wypisywane liczby byly ulozone 
--nierosnaco (np. trojka liczb 1,3,1 zostanie wypisana jako 3,1,1). Końcowe 
--zero nie jest brane pod uwage.

procedure kolo1_09_41 is
a,b,c,licznik,tmp: integer:=0;
debug:boolean:=false;

	procedure wyswietl(a,b,c: integer) is
	begin
	put(a, width=>0);
	put(", ");
	put(b, width=>0);
	put(", ");
	put(c, width=>0);
	new_line;
	end;

begin
while true loop
licznik:=licznik+1;
put("Podaj liczbe: ");
get(tmp);
exit when tmp=0;

if debug then wyswietl(a,b,c); end if;

c:=b;
b:=a;
a:=tmp;

if debug then wyswietl(a,b,c); end if;

if licznik>2 then
	if a<b then
	tmp:=b;
	b:=a;
	a:=tmp;
	end if;

	if c>b then
	tmp:=c;
	c:=b;
	b:=tmp;
	end if;

	wyswietl(a,b,c);
	--licznik:=0; --odkomentowanie zmieni algorytm
end if;

end loop;
end; 
