with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--1. Napisac program pobierajacy od uzytkownika wartosci calkowite az do 
--podania wartosci 0 kończacej pobieranie i wypisujacy informacje czy podano 
--po sobie dwie liczby ujemne (końcowe zero nie jest brane pod uwage).

procedure kolo1_09_11 is
poprzednia, liczba: integer:=0;
warunek: boolean:=false;
begin
put("Podaj liczbe (0 konczy wpisywanie): ");
get(poprzednia);

while true loop
put("Podaj liczbe (0 konczy wpisywanie): ");
get(liczba);
if liczba=0 then
exit;
elsif liczba < 0 and poprzednia <0 then
warunek:=true;
end if;

poprzednia:=liczba;
end loop;

if warunek then
put_line("Podano po sobie dwie liczby ujemne.");
else
put_line("Nie podano po sobie dwie liczby ujemnych.");
end if;

end;
