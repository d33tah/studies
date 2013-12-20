with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--2. Napisac program tworzacy dynamicznie (po pobraniu od uzytkownika wartosci
--naturalnej N) tablice N wartosci calkowitych. Program pobiera od uzytkownika
--wartosci tablicy, a nastepnie wypisuje informacje czy tablica zawiera 
--powtorzenia, a jesli tak – ile wartosci sie powtarza.

procedure kolo1_08_52 is
n: integer;
begin
put("Podaj dlugosc tablicy: ");
get(n);

declare
type t is array(1..n) of integer;
t1: t;
zwiekszono: boolean;
powtorzenia: integer:=0;
begin
for i in t'range loop
put("Podaj liczbe na pozycji ");
put(i,width=>0);
put(": ");
get(t1(i));
end loop;

for i1 in t'range loop
zwiekszono:=false;
for i2 in i1+1..t'last loop
if t1(i1)=t1(i2) and not zwiekszono then
powtorzenia:=powtorzenia+1;
zwiekszono:=true;
end if;
end loop;
end loop;

put("W podanej tablicy powtarza sie ");
put(powtorzenia,width=>0);
put_line(" wartosci.");

end;

end; 
