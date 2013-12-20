with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Jedna z metod obliczania najwiekszego wspolnego dzielnika (NWD) dwoch 
--liczb naturalnych a i b, zwana algorytmem Euklidesa, dziala w nastepujacy
-- sposob:
-- * obliczamy c jako reszte z dzielenia a i b;
-- * jezeli c = 0, to szukane NWD = b, w przeciwnym wypadku zastepujemy liczbe
--   a wartoscia b, b wartoscia c i przechodzimy ponownie do kroku 1.
--
--Napisac funkcje NWD zwracajaca najwiekszy wspolny dzielnik dwoch liczb 
--naturalnych podanych jako parametry. Wykorzystac funkcje w programie 
--pobierajacym od uzytkownika dwie liczby naturalne i wypisujacym w wyniku 
--ich NWD.
--
--Rozszerzyc program o nastepujace elementy:
-- * deklaracje niezawezonego typu tablicowego Liczby indeksowanego typem 
--calkowitym i przechowujacego liczby naturalne;
-- * procedure WypiszNWD wypisujaca najwiekszy wspolny dzielnik (z 
--   wykorzystaniem funkcji NWD) dla kazdej pary wartosci z tablicy typu 
--   Liczby podanej jako parametr tak, aby kazda para wartosci byla  
--   uwzgledniona tylko raz (przyklad: dla tablicy zawierajacej wartosci 2,2,1
--   funkcja uwzglednia pary "2,2", "2,1" i "1,1");
-- * funkcje WzgledniePierwsze zwracajaca tablice typu Liczb, zlozona z tych 
--   wartosci tablicy typu Liczby podanej jako parametr, ktore sa "wzglednie 
--   pierwsze" z liczba naturalna podana jako drugi parametr, tzn. te elementy
--   tablicy, dla ktorych NWD z liczba podana w drugim parametrze wynosi 1 
--   (przyklad: dla tablicy 3,12,7,9,15,2 i drugiego parametru rownego 10 
--   funkcja zwraca tablice 3,7,9). Funkcja ma wykorzystywac funkcje NWD.
--Wykorzystujac powyzsze konstrukcje rozszerzyc program tak, aby pobieral 
--tablice liczb naturalnych o podanej przez uzytkownika dlugosci, a 
--nastepnie wypisywal NWD wszystkich par elementow tej tablicy oraz te
--elementy tablicy, ktore sa "wzglednie pierwsze" z dodatkowa liczba podana
--przez uzytkownika.

procedure zestaw2 is
type t_t1 is array(integer range <>) of natural;
type t_t2 is array(integer range <>) of boolean;

procedure pobierz(t1: out t_t1) is
begin
for i in t1'range loop
put("Podaj element ");
put(i,0);
put(": ");
get(t1(i));
end loop;
end;

procedure wypisz(t1: t_t1) is
begin
for i in t1'range loop
put(t1(i));
new_line;
end loop;
end;

function nwd(a, b: integer) return integer is
c, tmp: integer;
tmp_a: integer:=a;
tmp_b: integer:=b;
begin
c := tmp_a mod tmp_b;
while c/=0 loop
tmp_a:=tmp_b;
tmp_b:=c;
c := tmp_a mod tmp_b;
end loop;
return tmp_b;
end;

function wzgledniepierwsze(t1: t_t1; n: natural) return t_t1 is
licznik: integer:=0;
begin
for i in t1'range loop
if nwd(t1(i),n)=1 then
licznik:=licznik+1;
end if;
end loop;

if licznik>0 then
declare
ret: t_t1(1..licznik);
begin
licznik:=1;
for i in t1'range loop
if nwd(t1(i),n)=1 then
ret(licznik):=t1(i);
licznik:=licznik+1;
end if;
end loop;
return ret;
end;
end if;
end;

procedure wypisznwd(a,b: natural) is 
begin
put("NWD("); 
put(a,0); 
put(","); 
put(b,0); 
put(")="); 
put(nwd(a,b),0); 
new_line;
end;

procedure wypisznwd(t1: t_t1) is
byldup: boolean:=false;
t2: t_t2(t1'range):=(others=>false);

currmin: natural;
tmpmin: natural;
begin
for i in t1'range loop

if false then --"BLOCK COMMENT" :)
	byldup:=false;
		for i2 in t1'range loop
			if t1(i)=t1(i2) then
				if not (byldup or t2(i2) or t2(i)) then
					if not (t1(i)<t1(i2)) then
						wypisznwd(t1(i),t1(i2));
					end if;
					byldup:=true;
					for i3 in i2+1..t1'last loop
						if t1(i3)=t1(i) then
							t2(i3):=true;
						end if;
					end loop;
				end if;
			else
				if not( t2(i2) or t2(i)) then
					if not (t1(i)<t1(i2)) then
						wypisznwd(t1(i),t1(i2));
					end if;
				end if;
			end if;
		end loop;
end if; --END OF BLOCK COMMENT

end loop;
end;

procedure zamien(a, b: out integer) is
tmp: integer:=a;
begin
a:=b;
b:=tmp;
end;

procedure sortujrosnaco(t1: out t_t1) is
tmp, min_i, min: integer;

begin
for i in t1'range loop

min:=t1(i);
min_i:=i;

for i2 in i..t1'last loop

if t1(i2)<min then
min:=t1(i2);
min_i:=i2;
end if;

end loop;

if min_i/=i then
zamien(t1(i),t1(min_i));
end if;

end loop;
end;

n: positive;
begin
put("Podaj dlugosc tablicy: ");
get(n);
declare
t1: t_t1(1..n);
g: integer;
begin
put("Podaj G: ");
get(g);
pobierz(t1);
sortujrosnaco(t1);
wypisz(t1);
--wypisznwd(t1);
--wypisz(wzgledniepierwsze(t1,g));
end;
end;
