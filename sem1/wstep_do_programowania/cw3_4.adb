with ada.text_io, ada.integer_text_io, ada.float_text_io, 
	ada.numerics.elementary_functions;
use  ada.text_io, ada.integer_text_io, ada.float_text_io, 
        ada.numerics.elementary_functions;

--Napisac program rozwiazujacy rownanie kwadratowe o podanych wspolczynnikach 
--calkowitych.

procedure cw3_4 is
a,b,c,d: integer;
x0, x1: float;
begin
put("Podaj a: "); get(a);
put("Podaj b: "); get(b);
put("Podaj c: "); get(c);

put("Rozwiaze rownanie kwadratowe o wzorze: ");
put(a,width=>0);
put("x^2+");
put(b,width=>0);
put("x+");
put(c,width=>0);
put_line("=0.");

d:= (b**2)-(4*a*c);

if (a=0) then
begin
put("Ta funkcja nie jest kwadratowa!");
end;
else
begin
	if (d<0) then
	begin
	put("To rownanie nie ma zadnych rozwiazan!");
	end;
	elsif (d=0) then
	begin
	x0:=float(-b)/(2.0*float(a));
	put("To rownanie zeruje sie w ");
	put(x0,exp=>0);
	put_line(".");
	end;
	else
	begin
	x0:=(float(-b)+sqrt(float(d)))/(2.0*float(a));
	x1:=(float(-b)-sqrt(float(d)))/(2.0*float(a));
	put("Rozwiazania tego rownania to: ");
	put(x0,exp=>0);
	put(" i ");
	put(x1,exp=>0);
	put_line(".");
	end;
	end if;
end;
end if;

end;

