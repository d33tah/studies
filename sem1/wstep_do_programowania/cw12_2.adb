with ada.text_io, ada.float_text_io, ada.integer_text_io;
use  ada.text_io, ada.float_text_io, ada.integer_text_io;

--Zadeklarowac niezawezony typ tablicowy T przechowujacy rzeczywiste 
--nieujemne. Napisac nastepujace funkcje i procedury:
-- * procedure pobierajaca zawartosc tablicy typu T podanej jako parametr,
-- * procedure wypisujaca zawartosc tablicy typu T podanej jako parametr
-- * funkcje zwracajaca wartosc logiczna mowiaca, czy tablica podana 
--   jako parametr jest uporzadkowana rosnaco,
-- * funkcje zwracajaca wartosc logiczna mowiaca, czy tablica podana 
--   jako parametr o dlugosci podanej jako parametr jest symetryczna 
--   (pierwszy element jest rowny ostatniemu, drugi - przedostatniemu itd),
-- * funkcje zwracajaca wartosc logiczna mowiaca, czy tablica podana jako 
--   parametr o dlugosci podanej jako parametr zawiera powtorzenia.
--Napisac program tworzacy tablice liczb calkowitych o podanej przez 
--uzytkownika dlugosci, a nastepnie wykorzystujacy powyzsze funkcje do 
--wypelnienia i wypisania tablicy oraz do sprawdzenia czy zawiera ona 
--powtorzenia, czy jest uporzadkowana rosnaco i czy jest symetryczna. 

procedure cw12_2 is
subtype positive_float is float range 0.0..float'last;
type t is array(positive range <>) of positive_float;

procedure get(t1: out t) is
begin
for i in t1'range loop
put("Podaj liczbe ");
put(i,0);
put(": ");
get(t1(i));
end loop;
end;

procedure put(t1: t) is
begin
for i in t1'range loop
put(t1(i),0,2,0);
new_line;
end loop;
end;


function rosnaca (t1: t) return boolean is
pop: positive_float:=t1(1);
begin
for i in 2..t1'last loop
if pop>t1(i) then
return false;
else
pop:=t1(i);
end if;
end loop;
return true;
end;

function powtorzenia(t1: t) return boolean is
tmp: positive_float;
begin
for i1 in t1'range loop
tmp:=t1(i1);
if i1/=t1'last then
for i2 in i1+1..t1'last loop
if t1(i2)=tmp then
return true;
end if;
end loop;
end if;
end loop;
return false;
end;

function symetryczna(t1: t) return boolean is
pol: positive;
begin

if t1'length mod 2=0 then
pol:=t1'length/2;
else
pol:=t1'length-1/2;
end if;

for i1 in t1'first..pol loop

if t1(i1)/=t1(t1'last-i1+1) then
return false;
end if;

--put("Porownam "); put(t1(i1),0,2,0); put(" z "); put(t1(t1'last-i1+1),0,2,0); new_line;

end loop;
return true;
end;

n: positive;

begin
put("Podaj dlugosc tablicy: ");
get(n);
declare
t1: t(1..n);
begin
get(t1);
put_line("Podales tablice: ");
put(t1);
if rosnaca(t1) then
put_line("Tablica jest rosnaca.");
else
put_line("Tablica nie jest rosnaca.");
end if;

if powtorzenia(t1) then
put_line("Tablica zawiera powtorzenia.");
else
put_line("Tablica nie zawiera powtorzen.");
end if;

if symetryczna(t1) then
put_line("Tablica jest symetryczna.");
else
put_line("Tablica nie jest symetryczna.");
end if;

end;
end;
