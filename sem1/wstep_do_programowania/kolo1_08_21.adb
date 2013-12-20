with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

-- 1. Napisac program pobierajacy od uzytkownika wartosci calkowite az do 
--podania wartosci 0 kończacej pobieranie i wypisujacy sume wartosci podanych 
--na pozycjach parzystych i sume wartosci podanych na pozycjach nieparzystych 
--(końcowe zero nie jest brane pod uwage).

procedure kolo1_08_21 is
parzyste, nieparzyste,liczba: integer:=0;
begin
while true loop

put("Podaj liczbe (0 konczy dzialanie): ");
get(liczba);
if liczba=0 then
exit;
elsif liczba mod 2=0 then
parzyste:=parzyste+liczba;
else
nieparzyste:=nieparzyste+liczba;
end if;
end loop;

new_line;
put("Suma liczb parzystych wyniosla: ");
put(parzyste,width=>0);
put_line(".");
put("Suma liczb nieparzystych wyniosla: ");
put(nieparzyste,width=>0);
put_line(".");

end;
