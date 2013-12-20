with ada.text_io, ada.float_text_io;
use ada.text_io, ada.float_text_io;

--Napisac program pobierajacy od uzytkownika boki prostopadloscianu i 
--zwracajacy jego pole podstawy, objetosc, pole powierzchni bocznej i pole 
--powierzchni calkowitej. Program ma wykonywac mozliwie malo obliczen 
--(jesli to mozliwe, to nalezy do obliczenia kolejnej wartosci wykorzystac 
--wartosc wyliczona wczesniej)


procedure cw2_1 is
a, b, c:      float; --dlugosci bokow
pp, ppb, ppc: float; --pola: podstawy, powierzchni bocznej i calk
v           : float; -- objetosc
begin
put("Podaj a: ");
get(a);

put("Podaj b: ");
get(b);

put("Podaj c: ");
get(c);

pp := a*b;
put("Pole podstawy: ");
put(pp,exp=>0,aft=>2);
new_line;

ppb := 2.0*(a*c + a*b);
put("Pole pow. bocznej: ");
put(ppb,exp=>0,aft=>2);
new_line;

ppc := 2.0*(a*c + a*b + b*c );
put("Pole pow. calkowitej: ");
put(ppc,exp=>0,aft=>2);
new_line;

v := a*b*c;
put("Objetosc prostopadloscianu: ");
put(v,exp=>0,aft=>2);
new_line;

end;
