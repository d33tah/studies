with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--1. Napisac program pobierajacy od uzytkownika wartosci calkowite az do 
--podania wartosci 0 kończacej pobieranie i wypisujacy wszystkie te pary 
--kolejno podanych wartosci, ktorych suma jest wieksza od pobranej wczesniej 
--liczby calkowitej G, oraz wypisujacy ile bylo takich par (końcowe zero nie 
--jest brane pod uwage).

procedure kolo1_09_21 is
a,b, g, tmp, licznik: integer:=0;
begin
put("Podaj G: ");
get(g);

while true loop
licznik:=licznik+1;
put("Podaj liczbe: ");
get(tmp);
exit when tmp=0;
b:=a;
a:=tmp;
if licznik>1 and a+b>g then
put("Podana para liczb jest wieksza od G: ");
put(a,width=>0);
put(" i ");
put(b,width=>0);
put_line(".");
--licznik:=0; --zmienia zachowanie programu
end if;
end loop;

end; 
