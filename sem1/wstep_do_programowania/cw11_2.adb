with ada.text_io;
use ada.text_io;

--Napisac funkcje zwracajaca lancuch otrzymany z lancucha podanego jako 
--parametr poprzez zamiane w nim kazdej litery na litere znajdujaca sie w 
--alfabecie dwie pozycje dalej (przy czym litery z konca alfabetu zamieniane 
--sa na litery z jego poczatku). Wykorzystac funkcje w programie, ktory 
--pobiera od uzytkownika napisy i wypisuje napisy "zaszyfrowane". O 
--zakonczeniu podawania ma decydowac uzytkownik.

procedure cw11_2 is

package ch is new ada.text_io.enumeration_io(character);
use ch;

function szyfruj_znak (znak: character) return character is
begin
case znak is
when 'y'=> return 'a';
when 'z'=> return 'b';
when 'Y'=> return 'A';
when 'Z'=> return 'B';
when others=>
if not ((znak>'a' and znak<'z') or (znak>'A' and znak<'Z')) then return znak; end if;
return character'val(character'pos(znak)+2);
end case;
end;

function szyfruj (str: in string) return string is
ret:string:=str;
begin
for i in ret'range loop
ret(i):=szyfruj_znak(ret(i));
end loop;
return ret;
end;

nasz:string(1..30);
tmp: integer:=0;
begin
loop
put("Wpisz cos: ");
get_line(nasz, tmp);
exit when tmp=0;
put(szyfruj(nasz(1..tmp)));
new_line;
end loop;

put("Koniec dzialania programu.");

end;
