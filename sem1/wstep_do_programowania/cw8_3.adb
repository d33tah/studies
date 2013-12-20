with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Jedna z metod sortowania tablic dziala w nastepujacy sposob:
--
-- * sprawdzamy, czy element pierwszy i drugi stoja w prawidlowym porzadku, 
--   jesli nie, to zamieniamy je miejscami;
-- * powtarzamy powyzsze dla elementow drugiego i trzeciego, potem trzeciego 
--   i czwartego itd, az dojdziemy do końca tablicy 
--   --> powyzszy ciag czynnosci zapewni nam, ze najwiekszy (a przy 
--   sortowaniu nierosnacym-najmniejszy) element znajdzie sie na ostatniej 
--   pozycji tablicy;
-- * powtarzamy kroki 1-2 dla coraz krotszych fragmentow 
--   tablicy poczatkowej: najpierw dla fragmentu odpowiadajacego tej tablicy 
--   bez ostatniego elementu, potem dla fragmentu odpowiadajacego tablicy 
--   poczatkowej bez dwoch ostatnich elementow itd; kazdy z krokow powoduje, 
--   ze najwiekszy (lub - przy sortowaniu nierosnacym - najmniejszy) 
--   element znajdujacy sie w rozpatrywanym fragmencie wywedruje na jego 
--   koniec; ostatnim krokiem bedzie wykonanie powyzszych dzialań dla 
--   fragmentu tablicy zlozonego z dwoch pierwszych elementow.

--Napisac program wczytujacy tablice liczb calkowitych o podanej przez 
--uzytkownika dlugosci, a nastepnie sortujacy ja nierosnaco lub nierosnaco 
--(o sposobie sortowania decyduje uzytkownik).

procedure cw8_3 is
n: integer;
tmp: integer;
rosnaco: integer;
begin
put("Podaj dlugosc tablicy: ");
get(n);

declare
type t_tablica is array(1..n) of integer;
tablica: t_tablica;
begin

for a in 1..n loop
	put("Podaj liczbe ");
	put(a,width=>0);
	put(": ");
	get(tablica(a));
end loop;

new_line;

put_line("Bedziemy sortowac rosnaco? (1=tak, 0=nie)");
get(rosnaco);

for a in 1..(n-1) loop
for b in 1..(n-a) loop
		if (rosnaco=1 and tablica(b+1)<tablica(b)) 
		or (rosnaco=0 and tablica(b)<tablica(b+1)) then
			tmp:=tablica(b);
			tablica(b):=tablica(b+1);
			tablica(b+1):=tmp;
		end if;
end loop;
end loop;

new_line;
put_line("Oto posortowany ciag: ");

for a in 1..n loop
	put(tablica(a),width=>0);
	new_line;
end loop;

end;

end;
