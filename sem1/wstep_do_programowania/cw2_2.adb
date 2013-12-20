with ada.text_io, ada.float_text_io;
use ada.text_io, ada.float_text_io;

--Napisac program pobierajacy od uzytkownika wysokosc pensji (liczbe 
--rzeczywista), a nastepnie obliczajacy podatek (18% pensji) i wysokosc 
--wyplaty (pensja minus wartosc podatku).

procedure cw2_2 is
netto, podatek, pensja: float;
begin
put("Podaj twoja pensje netto:");
get(netto);
podatek:=netto*0.18;
pensja:=netto-podatek;

put_line("Twoja liczba po odliczeniu podatku 18%: ");
put(pensja,exp=>0,aft=>2);

new_line;
put_line("Podatek wyniosl: ");
put(podatek,exp=>0,aft=>2);
end; 
