with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--1. Napisac program pobierajacy od uzytkownika wartosci calkowite az do 
--podania wartosci 0 kończacej pobieranie i wypisujacy iloczyn podanych 
--wartosci mniejszych od podanej wczesniej liczby calkowitej G oraz iloczyn 
--wartosci wiekszych od tej liczby (końcowe zero nie jest brane pod uwage).

procedure kolo1_08_11 is
g, liczba: integer;
iloczyn_m, iloczyn_w: integer:=1;
begin
put("Podaj G: ");
get(g);

while true loop
put("Podaj liczbe (0 konczy dzialanie): ");
get(liczba);
if liczba=0 then
exit;
elsif liczba > g then
iloczyn_w:=iloczyn_w*liczba;
elsif liczba < g then
iloczyn_m:=iloczyn_m*liczba;
end if;
end loop;

new_line;
put("Oto iloczyn liczb mniejszych od G: ");
put(iloczyn_m,width=>0);
put_line(".");

put("Oto iloczyn liczb wiekszych od G: ");
put(iloczyn_w,width=>0);
put_line(".");

end;
