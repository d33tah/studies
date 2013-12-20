with ada.text_io,ada.integer_text_io;
use  ada.text_io,ada.integer_text_io;

--Napisac funkcje SumaCyfr zwracajaca sume cyfr liczby naturalnej podanej jako
--parametr. Funkcja dziala w nastepujacy sposob:
--
-- * jezeli liczba jest rozna od 0, to dodajemy to aktualnej sumy jej cyfre 
--   jednosci (reszte z dzielenia przez 10), w przeciwnym wypadku wynikiem 
--   jest aktualna suma;
-- * pozbywamy sie uwzglednionej cyfry jednosci zmniejszajac liczbe o jeden 
--   rzad wielkosci (dzielac ja przez 10) i przechodzimy ponownie do kroku 1.
--
--Wykorzystac funkcje w programie pobierajacym od uzytkownika liczbe naturalna
--i wypisujacym sume jej cyfr.
--
--Rozszerzyc program o nastepujace elementy:
-- * deklaracje niezawezonego typu tablicowego Liczby indeksowanego typem 
--   calkowitym i przechowujacego liczby naturalne;
-- * funkcje CyfraUrodzenia przyjmujaca jako parametry trzy liczby naturalne 
--   D, M, R takie, ze D<31 i M<12, tj. odpowiednio dzien, miesiac i rok 
--   urodzenia. Funkcja zwraca "cyfre urodzenia" odpowiadajaca danej dacie, 
--   tj. sumuje poszczegolne cyfry liczb D, M i R korzystajac z funkcji 
--   SymaCyfr, jesli uzyskany wynik nie jest liczba jednocyfrowa, to sumuje 
--   cyfry tej liczby, jesli uzyskany wynik nie jest liczba jednocyfrowa, to 
--   znow sumuje cyfry tej liczby itd. – az do uzyskania liczby jednocyfrowej 
--   stanowiaca szukana "cyfre urodzenia";
-- * funkcje Uporzadkuj przyjmujaca jako parametry trzy tablice typu Liczby 
--   tej samej dlugosci zawierajace odpowiednio dni, miesiace i lata urodzenia
--   pewnych osob, obliczajaca dla kazdej daty (rozumianej jako trzy 
--   odpowiadajace sobie pozycja w tablicach wejsciowych wartosci) "cyfre 
--   urodzenia" z wykorzystaniem funkcji CyfraUrodzenia. Funkcja zwraca 
--   tablice typu Liczby zawierajaca pozycje dat podanych w tablicach 
--   wejsciowych, w takiej kolejnosci jaka uzyska sie po posortowaniu tych 
--   dat niemalejaco wg ich "cyfry urodzenia". 
--
--Wykorzystujac powyzsze konstrukcje rozszerzyc program tak, aby pobieral trzy
--tablice liczb naturalnych o podanej przez uzytkownika dlugosci (dni, 
--miesiace i lata urodzenia osob), a nastepnie korzystajac z funkcji 
--Uporzadkuj wypisywal je w kolejnosci uporzadkowanej niemalejaco wg "cyfry 
--urodzenia".

procedure zestaw2 is

type liczby is array(integer range <>) of natural;

function sumacyfr(n: natural) return natural is
ret: natural:=0;
tmp: natural:=n;
wynik: natural;
begin
	loop
	exit when tmp=0;
		wynik:=tmp mod 10;
		tmp:=(tmp-wynik)/10;
		ret:=ret+wynik;
	end loop;
	return ret;
end;

function cyfraurodzenia(d,m,r: natural) return natural is
ZlyDzien: Exception;
ZlyMiesiac: Exception;
ret: natural;
begin
	if d>31 or d<1 then
		raise ZlyDzien; 
	end if;

	if m>12 or m<1 then
		raise ZlyMiesiac;
	end if;

	ret:=sumacyfr(d)+sumacyfr(m)+sumacyfr(r);

	loop
	exit when ret>=0 and ret<10;
		ret:=sumacyfr(ret);
	end loop;
	
	return ret;
end;

function uporzadkuj(t1, t2, t3: liczby) return liczby is
ZleTablice: Exception;
ret, tmp: liczby(1..t1'length);
tmp2, min, min_i: natural;
begin
if t1'first/=1 or t2'first/=1 or t2'first/=1 
   or t1'last/=t2'last or t2'last/=t3'last then
raise ZleTablice; --takie troche uproszczenie kodu ;)
end if;

for i in t1'range loop
ret(i):=i;
tmp(i):=cyfraurodzenia(t1(i),t2(i),t3(i));
end loop;

for i in tmp'range loop
	min:=tmp(i);
	min_i:=i;
	for i2 in i..tmp'last loop
		if tmp(i2)<min then
			min:=tmp(i2);
			min_i:=i2;
		end if;
	end loop;
	if min_i/=i then
		tmp2:=ret(min_i);
		ret(min_i):=ret(i);
		ret(i):=tmp2;
	end if;
end loop;

return ret;
end;

n: positive;
begin
put("Podaj dlugosc tablicy: ");
get(n);
declare
t1,t2,t3, ret: liczby(1..n);
begin
for i in t1'range loop
put("->Teraz pobiore element nr. "); put(i,0); put_line(".");
put("Podaj dzien: ");
get(t1(i));
put("Podaj miesiac: ");
get(t2(i));
put("Podaj rok: ");
get(t3(i));
end loop;

ret:=uporzadkuj(t1,t2,t3);

put_line("Po posortowaniu indeksy wygladaja tak: ");
for i in ret'range loop
	put(ret(i),0); new_line;
end loop;

--n nam juz do szczescia niepotrzebne, wykorzystamy je jako zmienna tymczasowa ;)
for i in ret'range loop
	if ret(i)=i then
		n:=i;
	else
		for i2 in ret'range loop
			if ret(i2)=i then
				n:=ret(i2);
				exit;
			end if;
		end loop;
	end if;

	new_line;

        put(n,0);
        put(": ");
        put(t1(n),0); 
        put("."); 
        put(t2(n),0); 
        put("."); 
        put(t3(n),0); 
        put(": "); 
        put(cyfraurodzenia(t1(n),t2(n),t3(n)),0); 
        new_line;
end loop;

end;

end;
