with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

-- 1. Napisac program pobierajacy od uzytkownika liczbe calkowita dodatnia G, 
--a nastepnie wartosci calkowite az do podania wartosci 0 kończacej pobieranie
--i wypisujacy najwieksza podana wartosc podzielna przez G (końcowe zero nie 
--jest brane pod uwage).

procedure kolo1_08_31 is
g, liczba, najwieksza: integer:=0;
begin

put("Podaj G: ");
get(g);

while true loop
put("Podaj liczbe (0 konczy dzialanie): ");
get(liczba);
if liczba=0 then
exit;
elsif liczba mod g=0 and liczba>najwieksza then
najwieksza:=liczba;
end if;

end loop;

put("Najwieksza podana liczba podzielna przez G to: ");
put(najwieksza,width=>0);
put_line(".");

end;
