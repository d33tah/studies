with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--2. Napisac program tworzacy dynamicznie (po pobraniu od uzytkownika wartosci
--naturalnej N) tablice N wartosci calkowitych. Program pobiera od uzytkownika
--wartosci tablicy, wypisuje jej zawartosc, a nastepnie wypisuje wszystkie 
--uporzadkowane pary elementow tablicy bedacych na roznych pozycjach, ktorych
--suma jest mniejsza niz pobrana wczesniej liczba calkowita G oraz wszystkie 
--uporzadkowane pary elementow tablicy bedacych na roznych pozycjach, ktorych 
--suma jest wieksza niz G.

procedure kolo1_08_32 is
n, g: integer;
begin
put("Podaj G: ");
get(g);

put("Podaj dlugosc tablicy: ");
get(n);

declare
type t is array(1..n) of integer;
t1: t;
begin

for i in t'range loop
put("Prosze podac element o numerze ");
put(i,width=>0);
put(": ");
get(t1(i));
end loop;

put_line("Oto pary uporzadkowane o sumie mniejszej niz G: ");
for i1 in t'range loop
for i2 in t'range loop
if i1/=i2 and ((t1(i1)+t1(i2))<g) and not (t1(i2)<t1(i1)) then
put(t1(i1),width=>0);
put(":");
put(t1(i2),width=>0);
new_line;
end if;
end loop;
end loop;


put_line("Oto pary uporzadkowane o sumie wiekszej niz G: ");
for i1 in t'range loop
for i2 in t'range loop
if i1/=i2 and ((t1(i1)+t1(i2))>g) and not (t1(i2)<t1(i1)) then
put(t1(i1),width=>0);
put(":");
put(t1(i2),width=>0);
new_line;
end if;
end loop;
end loop;

end;

end;
