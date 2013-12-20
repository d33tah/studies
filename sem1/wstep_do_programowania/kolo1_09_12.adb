with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Napisac program tworzacy dynamicznie (po pobraniu od uzytkownika wartosci N 
--bedacej liczba calkowita dodatnia) tablice N wartosci calkowitych. Program 
--pobiera od uzytkownika wartosci tablicy, wypisuje jej zawartosc, nastepnie 
--przestawia elementy tablicy tak, aby byly w odwrotnej kolejnosci (odwraca 
--ja) i ponownie wypisuje jej zawartosc. Program ma nie korzystac z tablic 
--pomocniczych.

procedure kolo1_09_12 is
n: integer;
begin
put("Podaj dlugosc tablicy: ");
get(n);

declare
type t is array(1..n) of integer;
t1: t;
m, tmp: integer;
begin
for i in t'range loop
put("Podaj liczbe ");
put(i,width=>0);
put(": ");
get(t1(i));
end loop;

if n mod 2=0 then
m:=n/2;
else
m:=(n-1)/2;
end if;

for i in 1..m loop
--put(i,width=>0); put("=>"); put(n-i+1); new_line;
tmp:=t1(i);
t1(i):=t1(n-i+1);
t1(n-i+1):=tmp;
end loop;

new_line;
put_line("Oto odwrocona tablica: ");
for i in t'range loop
put(t1(i),width=>0);
new_line;
end loop;

end;

end;
