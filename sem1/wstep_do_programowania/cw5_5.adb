with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Napisac program, ktory "rysuje" choinke o liczbie segmentow podanej przez 
--uzytkownika. Przykladowo dla dwoch segmentow powinno sie uzyskac
--  *
-- ***
--  *
-- ***
--*****


procedure cw5_5 is
n: integer;
begin
put("Podaj parametr: "); get(n);

--kombinowalem nad tym dobre pol godziny, pewnie jest prostsze rozwiazanie.

for a in 1..n loop --petla wszystkich choinek
	for b in 1..a+1 loop --dzieki a+1 dla n=2 uzyskujemy ciag: 1,2 ; 1,2,3
			     --a nie:                              1 ; 1,2
			     --b to numer "poziomu" - ilosc gwiazdek obliczamy
			     --ze wzoru i=1+2*(b-1). dla b=1 daje *, 
	    		     ---dla b=2 daje *** itd.

		set_col(count(n-b+2)); --wyrownanie liczace w dol od n+1 do 1
		--swoja droga, czemu ten set_col nie mogl po prostu przyjmowac
		--wartosci typu integer, a nie jakies count...?!

		for i in 1..1+2*(b-1) loop --rysujemy linijke z gwiazdkami
			put("*");
		end loop;
		new_line;

	end loop;
end loop;

end;
