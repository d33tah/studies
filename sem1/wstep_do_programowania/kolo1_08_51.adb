with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--1. Napisac program pobierajacy od uzytkownika wartosci calkowite az do 
--podania wartosci 0 kończacej pobieranie, a nastepnie informujacy, czy 
--podawane wartosci tworzyly ciag rosnacy (końcowe zero nie jest brane pod 
--uwage).

procedure kolo1_08_51  is
liczba, poprzednia: integer:=0;
rosnacy: boolean:=true;
begin

put("Podaj liczbe (0 konczy dzialanie): ");
get(poprzednia);

while true loop
put("Podaj liczbe (0 konczy dzialanie): ");
get(liczba);
if liczba=0 then
exit;
elsif liczba<poprzednia then
rosnacy:=false;
end if;

poprzednia:=liczba;
end loop;

if rosnacy then
put_line("Podany ciag jest rosnacy.");
else
put_line("Podany ciag nie jest rosnacy.");
end if;

end;
