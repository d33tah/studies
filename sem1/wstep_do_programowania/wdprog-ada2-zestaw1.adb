with ada.text_io, ada.integer_text_io, ada.float_text_io;
use  ada.text_io, ada.integer_text_io, ada.float_text_io;

--Napisac:
-- * procedure Pobierz pobierajaca zawartosc niezawezonej tablicy liczb 
--   rzeczywistych podanej jako parametr;
-- * procedure Wypisz wypisujaca zawartosc niezawezonej tablicy liczb 
--   rzeczywistych podanej jako parametr;
-- * procedure Odwroc, ktorej parametrami sa: niezawezona tablica liczb 
--   rzeczywistych T oraz liczby calkowite L i P. Procedura ma odwrocic 
--   kolejnosc elementow we fragmencie tablicy wyznaczonym przez liczby L i P 
--   (np. gdy L=2, P=4 procedura odwraca kolejnosc elementow we fragmencie
--   zaczynajacym sie od T(2) i konczacym sie na T(4)). Jesli L>P, to 
--   procedura zamienia ich wartosci (np. gdy podano L=4, P=2, to procedura 
--   ustala L=2, P=4);
--Napisac program tworzacy tablice liczb rzeczywistych o podanej przez 
--uzytkownika dlugosci, pobierajacy i wypisujacy jej zawartosc oraz – po 
--pobraniu od uzytkownika zakresu indeksow wyznaczajacego fragment tablicy – 
--odwracajacy wskazany fragment tablicy. W programie wykorzystac wymienione 
--wyzej procedury i funkcje.
--Rozszerzyc program o:
-- * procedure Przetasuj przyjmujaca jako parametry dwie tablice T1 i T2 
--   (jedna liczb rzeczywistych, druga calkowitych). Procedura wykonuje N/2 
--   kolejnych odwrocen w tablicy T1, z ktorych kazde dotyczy fragmentu 
--   tablicy T1 wyznaczonego przez kolejna pare liczb z tablicy T2 (przyklad: 
--   jesli tablica T1 ma dlugosc 6, a tablica T2 zawiera wartosci 1,2,3,1, to
--   procedura odwraca najpierw fragment tablicy od T1(1) do T1(2), a potem 
--   fragment tablicy od T1(1) do T1(3)). Procedura ma korzystac z procedury
--   Odwroc;
-- * funkcje CzySymetryczna sprawdzajaca symetrycznosc tablicy podanej jako 
--   parametr o dlugosci podanej jako parametr, zwracajaca true gdy tablica 
--   jest symetryczna, a false w przeciwnym wypadku. Funkcja ma tworzyc kopie 
--   tablicy wejsciowej, korzystajac z procedury Odwroc odwracac te kopie i
--   zwracac true gdy te tablice sa identyczne.
--Oba podprogramy wykorzystac w programie, tworzac dodatkowa tablice liczb 
--calkowitych stanowiaca liste par indeksow wyznaczajaca przetasowania 
--tablicy utworzonej wczesniej (dlugosc tablicy podaje uzytkownik), a 
--nastepnie sprawdzajac czy przetasowana tablica jest symetryczna.

--NIE ZROBILEM ROZSZERZENIA, ZADANIE ZAWIERA NIESCISLOSCI.

procedure zestaw1 is
type t_t1 is array(positive range <>) of float;

procedure pobierz (t1: out t_t1) is
begin
for i in t1'range loop
put("Podaj element ");
put(i,0);
put(": ");
get(t1(i));
end loop;
end;

procedure wypisz (t1: t_t1) is
begin
for i in t1'range loop
put(t1(i),0,2,0);
new_line;
end loop;
end;

procedure odwroc (t1: out t_t1; l: positive; p: positive) is
pol: positive;
tmp: float;
begin

if p-l mod 2=0 then
pol:=(p-l)/2;
else
pol:=((p-l+1)/2)+1;
end if;

for i in 1..pol loop
tmp:=t1(l+i-1);
t1(l+i-1):=t1(p-i+1);
t1(p-i+1):=tmp;
end loop;

end;

n: integer;
begin
put("Podaj dlugosc tablicy: ");
get(n);
declare
t1: t_t1(1..n);
l: positive;
p: positive;
begin
pobierz(t1);
put("Podaj L:");
get(l);
put("Podaj P:");
get(p);
odwroc(t1,l,p);
wypisz(t1);
end;
end;
