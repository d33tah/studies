with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Napisac program pobierajacy od uzytkownika liczby calkowite a i b 
--i wypisujacy tabelke postaci:
--            rem    mod  
--    a   b   ...    ...
--   -a   b   ...    ...  
--    a  -b   ...    ...
--   -a  -b   ...    ...


procedure cw2_4 is
a, b: integer;
begin
put("Podaj liczbe a: ");
get(a);

put("Podaj liczbe b: ");
get(b);

set_col(13); put("rem");
set_col(20); put("mod");
new_line;

put("    a   b   ");
put(a rem b,width=>3);
set_col(20);
put(a mod b,width=>3);
new_line;

put("   -a   b   ");
put((-a) rem b,width=>3);
set_col(20);
put((-a) mod b,width=>3);
new_line;

put("    a  -b   ");
put(a rem (-b),width=>3);
set_col(20);
put(a mod (-b),width=>3);
new_line;

put("   -a  -b   ");
put((-a) rem (-b),width=>3);
set_col(20);
put((-a) mod (-b),width=>3);
new_line;

end;
