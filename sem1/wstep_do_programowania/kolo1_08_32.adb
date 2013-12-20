with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--2. Napisac program tworzacy dynamicznie (po pobraniu od uzytkownika wartosci
--naturalnej N) tablice N wartosci calkowitych. Program pobiera od uzytkownika
--wartosci tablicy, a nastepnie wypisuje informacje jaka liczba wystepuje w 
--niej najczesciej (jesli wiecej niz jedna liczba wystepuje z ta sama 
--czestoscia, program wypisuje jedna z nich).

procedure kolo1_08_32 is
n: integer;
begin
put("Podaj dlugosc tablicy: ");
get(n);

declare
type t is array(1..n) of integer;
t1: t;
aktualna, ilosc, najczestsza, najczestsza_ilosc:integer :=0;
begin
for i in t'range loop
put("Podaj wartosc na pozycji ");
put(i,width=>0);
put(": ");
get(t1(i));
end loop;

for i1 in t'range loop
aktualna:=t1(i1);
ilosc:=1;
for i2 in (i1+1)..t'last loop
if t1(i2)=aktualna then
ilosc:=ilosc+1;
end if;
end loop;

if ilosc>najczestsza_ilosc then
najczestsza:=aktualna;
najczestsza_ilosc:=ilosc;
end if;

end loop;

put("W tablicy najczesciej wystepuje liczba ");
put(najczestsza,width=>0);
put_line(".");

end;

end; 
