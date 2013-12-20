with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--1. Napisac program pobierajacy od uzytkownika wartosci calkowite az do 
--podania wartosci 0 kończacej pobieranie i wypisujacy pare kolejno podanych 
--liczb o najwiekszej sumie (jesli takich par bylo wiecej niz jedna, program 
--wypisuje jedna; końcowe zero nie jest brane pod uwage).

procedure kolo1_09_51 is
tmp, a, b, naj_suma, naj_a, naj_b, licznik: integer:=0;
begin
while true loop
licznik:=licznik+1;
put("Prosze podac liczbe: ");
get(tmp);
exit when tmp=0;
b:=a;
a:=tmp;

if (licznik>1 and a+b>naj_suma) or licznik=2 then
--put_line("Zmieniam naj_sume.");
naj_a:=a;
naj_b:=b;
naj_suma:=a+b;
--licznik:=0; --zmienia zachowanie programu
end if;

end loop;

put("Liczby o najwiekszej podanej sumie to ");
put(naj_a,width=>0);
put(" i ");
put(naj_b,width=>0); 
put(", ktorych suma to: ");
put(naj_suma,width=>0);
put_line(".");

end;
