with ada.text_io, ada.integer_text_io, ada.numerics.elementary_functions;
use  ada.text_io, ada.integer_text_io, ada.numerics.elementary_functions;

--1. Napisac program pobierajacy od uzytkownika wartosci calkowite nieujemne 
--az do podania wartosci 0 kończacej pobieranie i wszystkie te pary kolejno 
--podanych wartosci, w ktorych liczby sa uporzadkowane niemalejaco, a 
--pierwiastek ich sumy jest wiekszy od podanej wczesniej liczby calkowitej G 
--(końcowe zero nie jest brane pod uwage).

procedure kolo1_09_31 is
a,b,tmp,licznik,g:integer:=0;
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
if licznik > 1 and sqrt(float(a)+float(b))>float(g) then
put("Podane liczby spelniaja warunek: ");
put(a,width=>0);
put(" i ");
put(b,width=>0);
put_line(".");
end if;
end loop;
end;
