with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Zadeklarowac niezawezony typ tablicowy T przechowujacy wartosci 
--calkowite. Napisac:
-- * Procedure Pobierz pobierajaca dane do tablicy typu T podanej jako 
--   parametr;
-- * Procedure Wypisz wypisujaca zawartosc tablicy typu T podanej jako 
--   parametr;
-- * Funkcje CzyParaDodatnich zwracajaca wartosc logiczna mowiaca, czy 
--   tablic typu T podana jako parametr zawiera na dwoch sasiadujacych z 
--   soba miejscach liczbdodatnie (przyklad: dla tablicy –2, -3, 4, 8 
--   odpowiedzia powinno byc true, dltablicy 2, -2, 4, 0 – false);
-- * Funkcje NajdluzszaPodtablicaParzystych zwracajaca tablice typu T 
--   powstala z tablicy typu T podanej jako parametr poprzez przekopiowanie z
--   nienajdluzszej podtablicy tablicy wejsciowej (tj. ciagu sasiednich 
--   elementow tej tablicyzawierajacej tylko liczby parzyste (przyklad: dla
--   tablicy 2,4,4,1,3,6,8,1 funkcja zwraca 2,4,4). 
--Napisac program tworzacy tablice typu T o dlugosci podanej przez 
--uzytkownika, pobierajacy i wypisujacy jej zawartosc, a nastepnie wypisujacy 
--informacje czy tablica zawiera pare liczb dodatnich znajdujacych sie na 
--sasiednich pozycjach w tablicy (funkcjCzyParaDodatnich), oraz wypisujacy 
--najdluzsza podtablice liczb parzystych z tej tablic (funkcja 
--NajdluzszaPodtablicaParzystych).

procedure kolo1 is
type t is array(positive range <>) of integer;
procedure pobierz (t1: out t) is
begin
for i in t1'range loop
put("Podaj liczbe numer ");
put(i,0);
put(": ");
get(t1(i));
null;
end loop;
end;

procedure wypisz (t1: t) is
begin
for i in t1'range loop
put(t1(i),0);
new_line;
null;
end loop;
end;

function CzyParaDodatnich (t1: t) return boolean is
begin
for i in (t1'first+1)..t1'last loop
if t1(i)>0 and t1(i-1)>0 then
return true;
end if;
end loop;
return false;
end;

function NajdluzszaPodtablicaParzystych (t1: t) return t is
max_dl: integer:=-1;
tmp_pocz, tmp_koniec, pocz, koniec: integer:=0;
begin
for i1 in t1'range loop
	tmp_pocz:=i1;
	tmp_koniec:=i1;

	if t1(i1) mod 2=0 then
		for i2 in i1+1..t1'last loop

			if t1(i2) mod 2=0 then
				tmp_koniec:=tmp_koniec+1;
			else
				exit;
			end if;
		end loop;

		if (tmp_koniec-tmp_pocz)>max_dl then
			pocz:=tmp_pocz;
			koniec:=tmp_koniec;
			max_dl:=tmp_koniec-tmp_pocz;
		end if;
	end if;

end loop;

declare
t2: t(pocz..koniec);
begin
	for i in t2'range loop
		t2(i):=t1(i);
	end loop;
	return t2;
end;
end;

n: integer;

begin
put("Podaj dlugosc tablicy: ");
get(n);
declare
t1: t(1..n);
begin
pobierz(t1);
wypisz(t1);
if czyparadodatnich(t1) then
put_line("W tablicy znajduje sie para dodatnich liczb.");
else
put_line("W tablicy nie znajduje sie para dodatnich liczb.");
end if;
wypisz(najdluzszapodtablicaparzystych(t1));
end;
end;
