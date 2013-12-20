with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Zadeklarowac niezawezony typ tablicowy Tab przechowujacy liczby calkowite 
--nieujemne. Napisac:
-- * procedure Get pobierajaca dane do tablicy typu Tab podanej jako parametr,
-- * procedure Put wypisujaca tablice typu Tab podana jako parametr,
-- * funkcje Ile_parzystych i Ile_nieparzystych o parametrze wejsciowym typu 
--   Tab, zwracajace odpowiednio: ilosc elementow parzystych i ilosc elementow
--    nieparzystych w tablicy podanej jako parametr,
-- * procedure Rozdziel o trzech parametrach typu Tab - jednym wejsciowym i 
--   dwoch wyjsciowych, zwracajaca tablice elementow parzystych i tablice 
--   elementow nieparzystych z tablicy podanej jako parametr wejsciowy
--
--Wykorzystac powyzsze elementy do napisania programu pobierajacego od 
--uzytkownika tablice liczb calkowitych nieujemnych o podanej przez niego 
--dlugosci, a nastepnie tworzacego tablice elementow parzystych i tablice 
--elementow nieparzystych z tej tablicy oraz wypisujacego ich zawartosc. 

procedure cw12_1 is

type tab is array(positive range <>) of positive;
n: integer;

procedure get(t1: out tab) is
begin
for i in t1'range loop
put("Podaj parametr ");
put(i,0);
put(": ");
get(t1(i));
end loop;
end;

procedure put(t1: tab) is
begin
for i in t1'range loop
put(t1(i),0);
new_line;
end loop;
end;

function ile_parzystych (t1: tab) return integer is
ret: integer:=0;
begin
for i in t1'range loop

if t1(i) mod 2=0 then
ret:=ret+1;
end if;
end loop;
return ret;
end;

function ile_nieparzystych (t1: tab) return integer is
ret: integer:=0;
begin
for i in t1'range loop
if t1(i) mod 2=1 then
ret:=ret+1;
end if;
end loop;
return ret;
end;

procedure podziel(t1, t2, t3: in out tab) is
parz, nieparz: integer;
begin
parz:=ile_parzystych(t1);
nieparz:=ile_nieparzystych(t1);
declare
rp:tab(1..parz);
rn:tab(1..nieparz);
i2:integer;
begin

i2:=1;
for i in t1'range loop
if t1(i) mod 2=0 then
rp(i2):=t1(i);
i2:=i2+1;
end if;
end loop;

i2:=1;
for i in t1'range loop
if t1(i) mod 2=1 then
rn(i2):=t1(i);
i2:=i2+1;
end if;
end loop;

t2:=rp;
t3:=rn;

end;


end;

begin
put("Podaj dlugosc tablicy: ");
get(n);
declare
t1:tab(1..n);
begin
get(t1);
put_line("Test funkcji put: ");
put(t1);
declare
rp: tab(1..ile_parzystych(t1));
rn: tab(1..ile_nieparzystych(t1));
begin
podziel(t1,rp,rn);
put_line("Tablica parzystych: ");
put(rp);
put_line("Tablica nieparzystych: ");
put(rn);
end;
end;
end;
