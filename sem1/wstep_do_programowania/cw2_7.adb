with ada.text_io, ada.float_text_io;
use  ada.text_io, ada.float_text_io;

--Napisac program pobierajacy od uzytkownika wysokosc, dlugosc i szerokosc 
--pomieszczenia, liczbe okien, wymiary okna (zakladamy, ze wszystkie okna sa
--prostokatne i jednakowe), liczbe drzwi i wymiary drzwi (zakladamy, ze 
--wszystkie drzwi sa jednakowe). Program ma obliczac ilosc farby potrzebnej 
--do pomalowania tego pomieszczenia. Zaklamy, ze 1 litr farby wystarcza do 
--pomalowania 5 m kw; malujemy sciany i sufit.

procedure cw2_7 is
a, b, c                 : float;
wys_ok,  szer_ok,  il_ok: float;
wys_dr,  szer_dr,  il_dr: float;

ppb: float;
ppd: float;

p_ok: float;
p_dr: float;

pc: float;
litrow_na_mkw: constant float:=0.20;
potrzebna_farba: float;

begin
put("Podaj dlugosc pomieszczenia: ");   get(a);
put("Podaj wysokosc pomieszczenia: ");  get(b);
put("Podaj szerokosc pomieszczenia: "); get(c);
ppb:=2.0*(a*c+b*c);
ppd:=a*b;

put("Podaj ilosc okien: ");     get(il_ok);
put("Podaj wysokosc okien: ");  get(wys_ok);
put("Podaj szerokosc okien: "); get(szer_ok);
p_ok := il_ok*wys_ok*szer_ok;

put("Podaj ilosc drzwi: ");     get(il_dr);
put("Podaj wysokosc drzwi: ");  get(wys_dr);
put("Podaj szerokosc drzwi: "); get(szer_dr);
p_dr := il_dr*wys_dr*szer_dr;

pc := ppb+ppd-p_ok-p_dr;
potrzebna_farba := pc * litrow_na_mkw;
put("Potrzeba ");
put(potrzebna_farba, exp=>0);
put_line(" litrow farby.");

end;
