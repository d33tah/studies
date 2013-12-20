with ada.text_io, ada.integer_text_io, ada.float_text_io;
use  ada.text_io, ada.integer_text_io, ada.float_text_io;

--Napisać:
-- * procedurę Pobierz pobierającą zawartość niezawężonej tablicy liczb 
--   rzeczywistych podanej jako parametr;
-- * procedurę Wypisz wypisująca zawartość niezawężonej tablicy liczb 
--   rzeczywistych podanej jako parametr;
-- * funkcję Zlicz, której parametrem jest niezawężona tablica liczb 
--   rzeczywistych T. Funkcja ma zwrócić liczbę różnych wartości znajdujących 
--   się w tablicy przekazanej w parametrze (przykład: dla tablicy 
--   1,3,2,1,1,1,4,2 funkcja zwraca wartość 4);
--
--Napisać program tworzący tablicę liczb rzeczywistych o podanej przez 
--użytkownika długości, pobierający i wypisujący jej zawartość oraz wypisujący
--liczbę różnych wartości znajdujących się w tablicy. W programie wykorzystać 
--wymienione wyżej procedury i funkcje.
--Rozszerzyć program o:
-- * funkcję CzyZblizone przyjmującą jako parametry dwie tablice liczb 
--   rzeczywistych. Funkcja korzystając z funkcji Zlicz liczy liczbę różnych 
--   wartości znajdujących się w każdej z tablic, tworzy dwie tablice o 
--   wyliczonych długościach i wypełnia je różnymi wartościami z odpowiednio 
--   pierwszej i drugiej tablicy przekazanej do funkcji z zachowaniem 
--   oryginalnego porządku. Funkcja zwraca wartość true gdy krótsza z dwóch w 
--   ten sposób powstałych tablic jest podtablicą dłuższej (jeżeli są one 
--   równej długości muszą być identyczne), w przeciwnym wypadku zwraca false 
--   (przykład: dla tablic wejściowych 3,3,2,3,2,4,2,2,2 i 1,3,2,1,1,1,4,2 
--   liczymy liczbę ich różnych wartości i otrzymujemy odpowiednio 3 i 4; 
--   tworzymy tablice różnowartościowe z zachowaniem porządku: 3,2,4 i 
--   1,3,2,4; krótsza z tych tablic jest podtablicą dłuższej, więc funkcja 
--   zwraca wartość true).
--
--Dodaną funkcję wykorzystać w programie, tworząc dodatkową tablicę liczb 
--rzeczywistych o podanej przez użytkownika długości i sprawdzając czy jest on
--„zbliżona” do tablicy utworzonej wcześniej.

procedure zestaw1 is

type t_t1 is array(positive range <>) of float;
type t_t2 is array(positive range <>) of boolean;

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
put(t1(i),0,2,0);
new_line;
end loop;
end;

function zlicz(t1: t_t1) return integer is
ret:integer:=0;
t2: t_t2(t1'range):=(others=>false);
begin

for i in t1'range loop

if not t2(i) then
ret:=ret+1;

for i2 in t1'range loop
if t1(i)=t1(i2) then
t2(i2):=true;
end if;
end loop;

end if;

end loop;

return ret;
end;

function czypodzbior(t1, t2: t_t1) return boolean is
--ret: boolean;
tmp: boolean;
licznik: integer;
begin

for i1 in t1'range loop

	licznik:=0;
	for i2 in t2'range loop
		tmp:=true;
		if (t1'last-(i1+licznik)+1)>=t1'first then --sam nie wiem co to robi :P
			if t1(i1+licznik)/=t2(i2) then
				tmp:=false;
				exit;
			end if;
		end if;
		if tmp then
			return true;
		end if;
	end loop;
end loop;

return false;

end;

function czyzblizone(t1, t2: t_t1) return boolean is
ret1: t_t1(1..zlicz(t1));
ret2: t_t1(1..zlicz(t2));

tmp1: t_t2(t1'range):=(others=>false);
tmp2: t_t2(t2'range):=(others=>false);
licznik: integer;
begin

licznik:=1;
for i in t1'range loop
	if not tmp1(i) then
		ret1(licznik):=t1(i);
		licznik:=licznik+1;
			for i2 in t1'range loop
				if t1(i)=t1(i2) then
					tmp1(i2):=true;
				end if;
			end loop;
	end if;
end loop;

licznik:=1;
for i in t2'range loop
        if not tmp2(i) then
                ret2(licznik):=t2(i);
                licznik:=licznik+1;
                        for i2 in t2'range loop
                                if t2(i)=t2(i2) then
                                        tmp2(i2):=true;
                                end if;
                        end loop;
        end if;
end loop;

put_line("Porownam dwie tablice. Pierwsza: ");
wypisz(ret1);
put_line("A druga: ");
wypisz(ret2);
new_line;

if ret1'length<ret2'length then
return czypodzbior(ret2,ret1);
else
return czypodzbior(ret1,ret2);
end if;

end;


n,n2: positive;
begin
put("Podaj dlugosc tablicy: ");
get(n);
put("Podaj dlugosc drugiej tablicy: ");
get(n2);
declare
t1: t_t1(1..n);
t2: t_t1(1..n2);
begin

put_line("Najpierw pobiore pierwsza tablice.");
pobierz(t1);

put_line("Teraz druga tablica.");
pobierz(t2);

if czyzblizone(t1,t2) then
put_line("Obie tablice sa zblizone.");
else
put_line("Tablice nie sa do siebie zblizone.");
end if;

--put_line("Wpisales: ");
--wypisz(t1);

--put("W podanym ciagu jest "); 
--put(zlicz(t1),0);
--put_line(" roznych wartosci.");

end;
end;
