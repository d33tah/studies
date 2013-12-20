with ada.text_io, ada.characters.handling;
use ada.text_io, ada.characters.handling;

--Napisac:
--* funkcje zwracajaca wartosc logiczna mowiaca, czy napis podany jako 
--parametr jest palindromem;
--* funkcje zwracajaca lancuch powstaly z lancucha podanego jako parametr 
--poprzez zamiane wszystkich liter na wielkie
--
--oraz program testujacy ich dzialanie

procedure cw11_3 is

function palindrom(str: string) return boolean is
pol: integer:=0;
ret: boolean:=true;
begin
if str'length mod 2=0 then
pol:=str'length/2;
else
pol:=(str'length+1)/2;
end if;

for i in str'range loop
--put("Porownam "); put(str(i)); put(" i "); put(str(str'last-i+1)); put_line(".");
if str(i)/=str(str'last-i+1) then
ret:=false;
end if;
end loop;

return ret;
end;

function na_duze(str:string) return string is
ret: string:=str;
begin
for i in ret'range loop
if ret(i)>='a' and ret(i)<='z' then
ret(i):=to_upper(ret(i));
end if;
end loop;
return ret;
end;

nasz: string(1..30);
tmp: integer;
begin

loop
put("Napisz cos: ");
get_line(nasz,tmp);
exit when tmp=0;
put_line(na_duze(nasz(1..tmp)));
if palindrom(nasz(1..tmp)) then put_line("Palindrom"); end if;
end loop;
end;
