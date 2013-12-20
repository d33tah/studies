with ada.text_io, ada.float_text_io, ada.integer_text_io;
use ada.text_io, ada.float_text_io, ada.integer_text_io;

--Napisac program rozwiazujacy rownanie postaci ax+b=0 
--o wspolczynnikach calkowitych.

procedure cw3_1 is
a: integer;
b: integer;
wynik: float;
begin
put("Podaj a: "); get(a);
put("Podaj b: "); get(b);

put("Licze ax+b=0, czyli: ");
put(a,width=>0); put("x+"); put(b,width=>0); put_line("=0");

if (a=0 and b=0) then
begin
	put_line("Nieskonczenie wiele rozwiazan!");
end;
elsif (a=0 and not (b=0)) then
begin
	put_line("Brak rozwiazania!");
end;
else
	wynik:=float(b)/float(a);
	put("Funkcja powinna sie zerowac w ");
	put(wynik,exp=>0);
	put_line(".");
end if;

end;
