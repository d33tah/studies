with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--1. Napisac program pobierajacy od uzytkownika wartosci rzeczywiste az do 
--podania wartosci 0 kończacej pobieranie i wypisujacy wynik powstaly poprzez 
--dodawanie liczb podawanych na pozycjach nieparzystych i odejmowanie liczb 
--podawanych na pozycjach parzystych (końcowe zero nie jest brane pod uwage).

procedure kolo1_08_41 is
liczba, wynik: integer:=0;
i: integer:=1;
begin

while true loop
put("Podaj liczbe (0 konczy dzialanie): ");
get(liczba);

if liczba=0 then 
exit;
elsif i mod 2=0 then
wynik:=wynik-liczba;
else
wynik:=wynik+liczba;
end if;

i:=i+1;

end loop;

put("Wynik to: ");
put(wynik,width=>0);
put_line(".");

end;
